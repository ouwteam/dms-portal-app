import 'package:flutter/material.dart';

enum AlertType { success, info, error }

snackAlert(BuildContext ctx, String message, AlertType alertType) {
  MaterialColor clr = Colors.amber;
  if (alertType == AlertType.success) {
    clr = Colors.green;
  }

  if (alertType == AlertType.info) {
    clr = Colors.lightBlue;
  }

  if (alertType == AlertType.error) {
    clr = Colors.red;
  }

  return ScaffoldMessenger.of(ctx).showSnackBar(SnackBar(
    content: Text(message),
    backgroundColor: clr,
  ));
}
