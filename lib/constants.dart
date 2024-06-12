// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xFFAA43FF);
const kPrimaryLightColor = Color(0xFFF2DFFF);



class CustomGradient {
  static LinearGradient getCustomGradient() {
    return LinearGradient(
      begin: Alignment(1, 0.07),
      end: Alignment(-1.3, 0.04),
      colors: [
        Color(0xFFEA70FF),
        Color(0xFF2F2AD0),
      ],
    );
  }
}


class CustomGradient2 {
  static LinearGradient getCustomGradient2() {
    return LinearGradient(
      begin: Alignment(1, 0.07),
      end: Alignment(-1.3, 0.04),
      colors: [
        Color(0xFF807DE4),
        Color(0xFF2F2AD0),

      ],
    );
  }
}



const buttongradient = LinearGradient(
  begin: Alignment(1.00, -0.03),
  end: Alignment(-1, 0.03),
  colors: [Color(0xFF2F2AD0), Color(0xFFEA70FF)],
);


const kPrimaryGradientColor = LinearGradient(
    begin: Alignment(0.9, -0.6), // Corresponds to 214deg angle
    end: Alignment(-0.9, 0.6),
    colors: [
      Color(0xD8D76DFD),
      Color(0xFF5955D6),
      Color(0xFF362DD2),
    ],
    stops: [0.0, 0.1749, 0.4477]);


const kPrimaryGradientColor2 = LinearGradient(
    begin: Alignment(0.92, -0.7), // Corresponds to 214deg angle
    end: Alignment(-0.9, 0.6),
    colors: [
      Color(0xFF807DE4),
      Color(0xFF5955D6),
      Color(0xFF362DD2),
    ],
    stops: [0.0, 0.1749, 0.4477]);


const Heading1 =
TextStyle(
    color: Color(0xFF222222),
    fontWeight: FontWeight.w600,
    fontSize: 24,
    fontFamily: 'Nunito Sans',
    letterSpacing: -1
);


const kSecondaryColor = Color(0xFF979797);
const kTextColor = Colors.black;

const kAnimationDuration = Duration(milliseconds: 200);




