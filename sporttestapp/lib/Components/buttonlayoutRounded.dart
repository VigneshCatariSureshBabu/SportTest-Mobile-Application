// ignore_for_file: file_names

import 'package:flutter/material.dart';

class ButtonLayout extends StatelessWidget {
  const ButtonLayout({
    Key? key,
    required this.color,
    required this.text,
    required this.fun,
  }) : super(key: key);
  final Color color;
  final String text;
  final Function fun;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(30),
      color: color,
      child: InkWell(
        onTap: fun(),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 100),
          child: Text(text),
        ),
      ),
    );
  }
}
