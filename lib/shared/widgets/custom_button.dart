import 'package:flutter/material.dart';
import 'package:loading_icon_button/loading_icon_button.dart';

class CustomLoadingButton extends StatelessWidget {
  const CustomLoadingButton(
      {super.key,
      required this.btnController,
      this.onPressed,
      required this.text,
      this.icon,
      this.primaryColor,
      this.color = Colors.white});
  final String text;
  final IconData? icon;
  final LoadingButtonController btnController;
  final void Function()? onPressed;
  final Color? color;
  final Color? primaryColor;

  @override
  Widget build(BuildContext context) {
    return LoadingButton(
      valueColor: Colors.white,
      primaryColor: primaryColor,
      iconColor: Colors.white,
      iconData: icon,
      onPressed: onPressed,
      controller: btnController,
      child: Text(text,
          style: TextStyle(
            color: color,
            fontSize: 15,
          )),
    );
  }
}
