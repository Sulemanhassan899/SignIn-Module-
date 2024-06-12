// ignore_for_file: prefer_const_constructors, use_super_parameters

import 'package:flutter/material.dart';

class TextTopLayout extends StatelessWidget {
  final String text;
  const TextTopLayout({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: Colors.white,
        fontSize: 36,
        fontFamily: 'Nunito Sans',
        fontWeight: FontWeight.w900,
        letterSpacing: -0.72,
      ),
    );
  }
}
