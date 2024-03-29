import 'package:demo_app/api/api.dart';
import 'package:demo_app/config/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    final auth = LoginAuth();
    final response = await auth.checkStatus();
    if (response['success'] && response['user'] != null) {
      getRoute(response['user']?.role);
    } else {
      // ignore: use_build_context_synchronously
      return context.go(PathRouter.login);
    }
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: LoadingAnimationWidget.threeArchedCircle(
                size: 200, color: Theme.of(context).primaryColorDark),
          ),
          const SizedBox(height: 60),
          const Text(
            'Verificando sesión....',
            style: TextStyle(fontSize: 25, fontFamily: 'NimbusSans'),
          ),
        ],
      ),
    );
  }
}
