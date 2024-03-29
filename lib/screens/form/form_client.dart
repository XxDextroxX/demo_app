import 'package:demo_app/config/config.dart';
import 'package:demo_app/providers/providers.dart';
import 'package:demo_app/shared/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:loading_icon_button/loading_icon_button.dart';

class FormClient extends ConsumerStatefulWidget {
  const FormClient({super.key});

  @override
  FormClientState createState() => FormClientState();
}

class FormClientState extends ConsumerState<FormClient> {
  bool _obscureText = true;
  late LoadingButtonController _btnController;
  @override
  void initState() {
    _btnController = LoadingButtonController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final registerClient = ref.watch(registerClientProvider);
    final registerClientNotifier = ref.watch(registerClientProvider.notifier);
    final intanceIndex = ref.watch(currentIndexDrawerProvider.notifier);
    final isLoginUserNotifier = ref.watch(isLoginUserProvider.notifier);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        children: [
          CustomInputs(
            colorStyle: Colors.white,
            errorText: registerClient.name.errorMessage,
            hintText: 'Nombres',
            textCapitalization: true,
            prefixIcon: const Icon(
              Icons.person_outline,
            ),
            suffixIcon: null,
            onChanged: registerClientNotifier.setName,
          ),
          const SizedBox(height: 20),
          CustomInputs(
            colorStyle: Colors.white,
            errorText: registerClient.lastName.errorMessage,
            hintText: 'Apellidos',
            textCapitalization: true,
            prefixIcon: const Icon(
              Icons.person_outline,
            ),
            suffixIcon: null,
            onChanged: registerClientNotifier.setLastName,
          ),
          const SizedBox(height: 20),
          CustomInputs(
            colorStyle: Colors.white,
            errorText: registerClient.email.errorMessage,
            keyboardType: TextInputType.emailAddress,
            hintText: 'Correo electronico',
            textCapitalization: false,
            prefixIcon: const Icon(
              Icons.email_outlined,
            ),
            suffixIcon: null,
            onChanged: registerClientNotifier.setEmail,
          ),
          const SizedBox(height: 30),
          CustomInputs(
            colorStyle: Colors.white,
            maxLines: 1,
            errorText: registerClient.password.errorMessage,
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
            onChanged: registerClientNotifier.setPassword,
          ),
          const SizedBox(height: 30),
          SizedBox(
              width: double.infinity,
              height: 60,
              child: CustomLoadingButton(
                  primaryColor: Theme.of(context).primaryColorDark,
                  text: 'REGISTRARSE',
                  icon: Icons.login,
                  btnController: _btnController,
                  onPressed: () async {
                    final response =
                        await registerClientNotifier.registerUser(context);
                    if (response) {
                      intanceIndex.changeIndex(0);
                      // ignore: use_build_context_synchronously
                      context.go(PathRouter.homeClient);
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
                  child: const Text('¿Ya tienes una cuenta?',
                      style: TextStyle(
                        color: Colors.white,
                      )))
            ],
          ),
        ],
      ),
    );
  }
}
