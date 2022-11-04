import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  final Color? color;
  final double? radius;
  final double? size;
  final FontWeight? fontWeight;
  final double? width;
  final double? height;
  final Function onTap;
  final String? text;
  final Widget? child;

  const DefaultButton({
    super.key,
    required this.onTap,
    this.color,
    this.radius,
    this.width,
    this.text,
    this.height,
    this.child,
    this.size,
    this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
      child: MaterialButton(
        onPressed: () => onTap(),
        child: child ??
            Text(
              text!,
              style: TextStyle(
                color: color ?? Colors.white,
                fontWeight: fontWeight ?? FontWeight.bold,
                fontSize: size ?? 16,
              ),
            ),
      ),
    );
  }
}
