import 'package:demo_app/api/api.dart';
import 'package:demo_app/config/config.dart';
import 'package:demo_app/models/models.dart';
import 'package:demo_app/providers/providers.dart';
import 'package:demo_app/screens/screens.dart';
import 'package:demo_app/shared/utils/utils.dart';
import 'package:demo_app/shared/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:loading_icon_button/loading_icon_button.dart';
import 'package:lottie/lottie.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoginUser = ref.watch(isLoginUserProvider);
    final size = MediaQuery.of(context).size;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarColor: Colors.black,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
        body: Stack(
          children: [
            Positioned(
                left: 0,
                top: 0,
                child: Container(
                  width: size.width,
                  height: size.height,
                  color: Theme.of(context).primaryColor,
                )),
            Positioned(
              left: 80,
              top: 100,
              child: _lottieAssets(AssetsName.dashboard, 250),
            ),
            _container(size, isLoginUser),
          ],
        ),
      ),
    );
  }

  Widget _lottieAssets(String path, double height) {
    return Lottie.asset(
      path,
      height: height,
      fit: BoxFit.cover,
    );
  }

  Widget _container(Size size, bool isLoginUser) {
    return Container(
      width: size.width,
      height: size.height,
      decoration: BoxDecoration(color: Colors.black.withOpacity(0.1)),
      child: CustomPaint(
          painter: _BackgroundPainter(),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: isLoginUser ? size.height * 0.5 : size.height * 0.4,
                ),
                isLoginUser ? const _Inputs() : const FormClient()
              ],
            ),
          )),
    );
  }
}

class _BackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    // paint.color = Colors.black;
    paint.color = Colors.white.withOpacity(0.1);
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 20;
    final path = Path();
    path.lineTo(0, size.height * 0.45);
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.50,
        size.width * 0.5, size.height * 0.45);
    path.quadraticBezierTo(
        size.width * 0.75, size.height * 0.40, size.width, size.height * 0.45);
    path.lineTo(size.width, 0);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class _Inputs extends ConsumerStatefulWidget {
  const _Inputs({super.key});

  @override
  InputsState createState() => InputsState();
}

bool _obscureText = true;
late LoadingButtonController _btnController;

class InputsState extends ConsumerState<_Inputs> {
  @override
  void initState() {
    _btnController = LoadingButtonController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final auth = ref.watch(authUserProvider);
    final authNotifier = ref.watch(authUserProvider.notifier);
    final intanceIndex = ref.watch(currentIndexDrawerProvider.notifier);
    final isLoginUserNotifier = ref.watch(isLoginUserProvider.notifier);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        children: [
          CustomInputs(
            colorStyle: Colors.white,
            errorText: auth.email?.errorMessage,
            keyboardType: TextInputType.emailAddress,
            hintText: 'Correo electronico',
            textCapitalization: false,
            prefixIcon: const Icon(
              Icons.email_outlined,
            ),
            suffixIcon: null,
            onChanged: authNotifier.setEmail,
          ),
          const SizedBox(height: 30),
          CustomInputs(
            colorStyle: Colors.white,
            maxLines: 1,
            errorText: auth.password?.errorMessage,
            textCapitalization: false,
            obscureText: _obscureText,
            hintText: 'Contraseña',
            prefixIcon: const Icon(
              Icons.lock_outline,
            ),
            suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
                icon: const Icon(
                  Icons.remove_red_eye_outlined,
                  color: Colors.grey,
                )),
            onChanged: authNotifier.setPassword,
          ),
          const SizedBox(height: 30),
          SizedBox(
              width: double.infinity,
              height: 60,
              child: CustomLoadingButton(
                  primaryColor: Theme.of(context).primaryColorDark,
                  text: 'INICIAR SESIÓN',
                  icon: Icons.login,
                  btnController: _btnController,
                  onPressed: () async {
                    if (!authNotifier.isValid) {
                      // ignore: use_build_context_synchronously
                      CustomSnackbar.showSnackBar(
                          'Formulario invalido', context,
                          isSuccess: false);
                      _btnController.reset();
                      return;
                    }
                    final authInstance = LoginAuth();
                    final response = await authInstance.signIn(
                        auth.email!.value, auth.password!.value);
                    if (response['success']) {
                      final user = response['user'];
                      final userLoged =
                          await authInstance.getDataUser(user!.user!.uid);
                      final userModel = UserModel.instance();
                      if (userLoged != null) {
                        if (userLoged.role == 'seller' &&
                            !userLoged.isActive!) {
                          authInstance.signOut();
                          CustomSnackbar.showSnackBar(
                              'Cuenta inactiva',
                              // ignore: use_build_context_synchronously
                              context,
                              isSuccess: false);
                          _btnController.reset();
                          return;
                        }
                        userModel.setData(userLoged);
                      }
                      GeneralUtils.setUid(user.user?.uid ?? '');
                      GeneralUtils.setPassword(auth.password!.value);
                      // ignore: use_build_context_synchronously
                      CustomSnackbar.showSnackBar('Login exitoso', context,
                          isSuccess: true);
                      intanceIndex.changeIndex(0);
                      getRoute(userModel.role!);
                    } else {
                      // ignore: use_build_context_synchronously
                      CustomSnackbar.showSnackBar(response['message'], context,
                          isSuccess: false);
                    }
                    _btnController.success();
                    _btnController.reset();
                  })),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                  onPressed: () {
                    isLoginUserNotifier.changeState();
                  },
                  child: const Text('¿No tienes una cuenta? registrate',
                      style: TextStyle(
                        color: Colors.white,
                      )))
            ],
          ),
        ],
      ),
    );
  }

  void getRoute(String role) {
    switch (role) {
      case 'admin':
        return context.go(PathRouter.homeAdmin);
      case 'seller':
        return context.go(PathRouter.homeSeller);
      case 'client':
        return context.go(PathRouter.homeClient);
      default:
        return context.go(PathRouter.login);
    }
  }
}
