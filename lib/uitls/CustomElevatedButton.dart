import 'package:flutter/material.dart';

class CustomButtonLayout extends StatelessWidget {
  final double? width;
  final double? height;
  final String? buttonText;
  final IconData? icon;
  final Color? iconColor;
  final Color? buttonColor;
  final VoidCallback? onPressed;
  final Widget? child;

  const CustomButtonLayout({
    Key? key,
    this.width,
    this.height,
    this.buttonText,
    this.icon,

    this.iconColor,
    this.onPressed,
    this.buttonColor, this.child,
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
        child: child,
      ),
    );
  }
}
