import 'dart:ui';

import 'package:flutter/material.dart';

class GlassButton extends StatelessWidget {
  final Widget child;
  final double? width;
  final double? height;
  final ImageFilter? filter;
  const GlassButton({
    Key? key,
    required this.child,
    this.width,
    this.height,
    this.filter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: BackdropFilter(
        filter: filter ?? ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: Container(
          width: width ?? 390,
          height: height ?? 345,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomCenter,
              colors: [Colors.white60, Colors.white10],
            ),
            borderRadius: BorderRadius.circular(25),
            border: Border.all(width: 2, color: Colors.white30),
          ),
          child: child,
        ),
      ),
    );
  }
}
