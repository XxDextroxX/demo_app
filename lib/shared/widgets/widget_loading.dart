import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class WidgetLoading extends StatelessWidget {
  const WidgetLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(
          height: 100,
        ),
        Center(
          child: LoadingAnimationWidget.threeArchedCircle(
              size: 300, color: Theme.of(context).primaryColorDark),
        ),
        const SizedBox(height: 60),
        const Text(
          'Cargando datos....',
          style: TextStyle(fontSize: 25, fontFamily: 'NimbusSans'),
        ),
      ],
    );
  }
}
