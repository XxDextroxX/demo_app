import 'package:demo_app/config/config.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class WidgetEmpty extends StatelessWidget {
  const WidgetEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _lottieAssets(AssetsName.empty, 250),
        const SizedBox(height: 10),
        Text('No hay datos', style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget _lottieAssets(String path, double height) {
    return Lottie.asset(
      path,
      height: height,
      fit: BoxFit.cover,
    );
  }
}
