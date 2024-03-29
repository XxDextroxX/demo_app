import 'package:flutter/material.dart';

class CustomFilledButtonWithIcon extends StatelessWidget {
  final void Function()? onPressed;
  final String text;
  final Color? buttonColor;
  final double? margin;
  final IconData? icon;
  final double? iconSize;
  final double? radius;
  final double? height;

  const CustomFilledButtonWithIcon(
      {super.key,
      this.onPressed,
      required this.text,
      this.buttonColor,
      this.margin,
      this.icon,
      this.iconSize,
      this.radius,
      this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: margin ?? 20, vertical: 10),
      height: height ?? 70,
      width: double.infinity,
      child: FilledButton.tonalIcon(
          style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(radius ?? 10.0),
                ),
              ),
              backgroundColor: MaterialStateProperty.all(
                  buttonColor ?? Theme.of(context).primaryColorDark)),
          onPressed: onPressed,
          icon: Icon(
            icon ?? Icons.add_shopping_cart_outlined,
            size: iconSize ?? 30,
            color: Colors.white,
          ),
          label: Padding(
            padding: const EdgeInsets.only(top: 0),
            child: Text(text,
                style: const TextStyle(fontSize: 20, color: Colors.white)),
          )),
    );
  }
}
