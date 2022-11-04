import 'package:flutter/material.dart';

class DefaultTextButton extends StatelessWidget {
  final Function onTap;
  final String? text;

  const DefaultTextButton({super.key, required this.onTap, this.text});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => onTap,
      child: Text(text!),
    );
  }
}
