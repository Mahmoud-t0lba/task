import 'package:flutter/material.dart';

void navigateTo(context, widget) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => widget));

void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
      (route) {
        return false;
      },
    );

customSnackBar(context, {required String text, Color? color}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: color ?? Colors.red,
      content: Text(text),
      duration: const Duration(milliseconds: 2500),
    ),
  );
}
