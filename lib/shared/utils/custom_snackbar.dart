import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';

class CustomSnackbar {
  static void showSnackBar(String message, BuildContext context,
      {bool isSuccess = true}) {
    AnimatedSnackBar.material(message,
            type: isSuccess
                ? AnimatedSnackBarType.success
                : AnimatedSnackBarType.error,
            mobileSnackBarPosition: MobileSnackBarPosition.bottom)
        .show(context);
  }
}
