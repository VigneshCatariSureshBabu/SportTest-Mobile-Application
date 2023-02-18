// ignore_for_file: file_names

import 'package:flutter/material.dart';

class BackgroundImages extends StatelessWidget {
  const BackgroundImages({
    Key? key,
    required this.size,
    required this.child,
  }) : super(key: key);

  final Size size;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
              top: -100,
              left: 300,
              child: Image.asset(
                'assets/images/darkGreenCloud.png',
                width: size.width,
              )),
          child,
          Positioned(
              bottom: -150,
              left: -100,
              child: Image.asset(
                'assets/images/darkGreenCloud.png',
                width: size.width,
              )),
        ],
      ),
    );
  }
}
