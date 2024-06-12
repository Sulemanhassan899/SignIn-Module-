import 'package:flutter/material.dart';

class TextFeilds extends StatelessWidget {
  final String text;
  final double? width;
  final double? height;
  final bool obscureText;
  final TextEditingController? controller;

  const TextFeilds({
    Key? key,
    required this.text,
    this.controller, this.width,  this.height, required this.obscureText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: TextFormField(
          controller: controller,
          obscureText: obscureText,
          decoration: InputDecoration(
            hintText: text,

            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(12),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
