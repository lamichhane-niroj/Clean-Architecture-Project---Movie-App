import 'package:flutter/cupertino.dart';

class AppNavigation {
  static void pushReplacement(context, Widget page) {
    Navigator.pushReplacement(
      context,
      CupertinoPageRoute(builder: (context) => page),
    );
  }

  static void push(context, Widget page) {
    Navigator.push(context, CupertinoPageRoute(builder: (context) => page));
  }

  static void pop(context) {
    Navigator.pop(context);
  }

  static void pushAndRemove(context, Widget page) {
    Navigator.pushAndRemoveUntil(
      context,
      CupertinoPageRoute(builder: (context) => page),
      (route) => false,
    );
  }
}
