// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class IconButtonLayout extends StatelessWidget {
  final double width;
  final double height;
  final String buttonText;
  final IconData? icon;
  final Color? iconColor;
  final Color? buttonColor;
  final VoidCallback? onPressed;

  const IconButtonLayout({
    Key? key,
    required this.width,
    required this.height,
    required this.buttonText,
    this.icon,
    this.iconColor,
    this.onPressed,
    this.buttonColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      color: buttonColor,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Container(

          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (icon != null)
                Icon(
                  icon,
                  color: iconColor ?? Colors.white, // Use provided color or default to white
                ),
              SizedBox(width: 8), // Add space between icon and text
              Text(
                buttonText,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontFamily: 'Nunito',
                  fontWeight: FontWeight.w700,
                  height: 0.09,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
