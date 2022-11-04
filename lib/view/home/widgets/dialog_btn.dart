import 'dart:ui';

import 'package:flutter/material.dart';

class SimpleBtn extends StatelessWidget {
  final String text;
  final String image;
  final Function() onTap;
  final Color? color;

  const SimpleBtn({
    super.key,
    required this.text,
    required this.image,
    required this.onTap,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
          child: Container(
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomCenter,
                colors: [Colors.white, Colors.white38],
              ),
              borderRadius: BorderRadius.circular(25),
              border: Border.all(width: 2, color: Colors.white30),
            ),
            child: SizedBox(
              width: 180,
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(image),
                  const SizedBox(width: 10),
                  Text(
                    text,
                    style: TextStyle(
                      color: color ?? Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
