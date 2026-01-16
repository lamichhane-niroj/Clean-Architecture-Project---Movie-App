import 'package:flutter/material.dart';

class DisplayMessage {
  static void errorMessage({required String message, required BuildContext context}) {
    final snackBar = SnackBar(
      content: Text(message),
      backgroundColor: Colors.red,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
