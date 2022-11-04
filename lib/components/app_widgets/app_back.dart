import 'package:flutter/material.dart';

class AppBack extends StatelessWidget {
  final String image;
  final Widget child;
  final BoxFit? fit;
  const AppBack({
    Key? key,
    required this.image,
    required this.child,
    this.fit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(image),
          fit: fit ?? BoxFit.fill,
        ),
      ),
      child: child,
    );
  }
}
