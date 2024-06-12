import 'package:flutter/material.dart';

class ButtonLayout extends StatelessWidget {
  final double width;
  final double height;
  final String buttonText;
  final VoidCallback? onPressed;

  const ButtonLayout({
    Key? key,
    required this.width,
    required this.height,
    required this.buttonText,
    this.onPressed, required bool enabled,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(1, 0.07),
          end: Alignment(-1.3, 0.04),
          colors: [
            Color(0xFFEA70FF),
            Color(0xFF2F2AD0),
          ],
        ),
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
          padding: EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 20,
          ),
          child: Text(
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
        ),
      ),
    );
  }
}
