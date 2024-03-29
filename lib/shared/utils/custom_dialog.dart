import 'package:flutter/material.dart';

class CustomDialogs {
  static Future<void> generalDialog({
    required BuildContext context,
    required String title,
    String? content,
    required void Function()? onPressed,
    void Function()? onCancel,
    bool isCancel = true,
    Widget? child,
  }) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: child ??
              Text(
                content ?? '',
              ),
          actions: <Widget>[
            if (isCancel)
              TextButton(
                  style: TextButton.styleFrom(
                    textStyle: Theme.of(context).textTheme.labelLarge,
                  ),
                  onPressed: onCancel ??
                      () {
                        Navigator.pop(context);
                      },
                  child: const Text('Cancelar')),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              onPressed: onPressed,
              child: const Text('Aceptar'),
            ),
          ],
        );
      },
    );
  }
}
