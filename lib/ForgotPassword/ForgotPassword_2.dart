// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../constants.dart';
import '../../uitls/CustomElevatedButton.dart';
import '../../uitls/snaplink_textlayout.dart';
import '../../uitls/white_box_2.dart';
import '../SignIn/sign_in.dart'; // Import the correct file

class ForgotPassword2 extends StatefulWidget {
  static String routeName = "/ForgotPasswordScreen";
  const ForgotPassword2({Key? key}) : super(key: key);

  @override
  State<ForgotPassword2> createState() => _ForgotPassword2State();
}

class _ForgotPassword2State extends State<ForgotPassword2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: kPrimaryGradientColor,
        ),
        child: SingleChildScrollView(
          child: Stack(
            children: [
              WhiteContainerDashboard(
                child: Column(
                  children: [
                    Center(
                      child: Align(
                        alignment: Alignment.center,
                        child: Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 100, left: 50, right: 50, bottom: 175),
                              child: Column(
                                children: [
                                  SvgPicture.asset(
                                    "assets/images/forgotpassword.svg", // Replace with your SVG image path
                                    fit: BoxFit.cover,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 24),
                                    child: Text(
                                      'Check your email',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Color(0xFF222222),
                                        fontSize: 30,
                                        fontFamily: 'Nunito Sans',
                                        fontWeight: FontWeight.w800,
                                        height: 1,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 20),
                                    child: SizedBox(
                                      width: 345,
                                      child: Text(
                                        "We've sent a password recovery\ninstructions to your email",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Color(0xFF878787),
                                          fontSize: 16,
                                          fontFamily: 'Nunito Sans',
                                          fontWeight: FontWeight.w400,
                                          height: 1.2,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 20),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: CustomButtonLayout(
                                        width: 208,
                                        height: 62,
                                        child: Text.rich(
                                          TextSpan(
                                            children: [
                                              TextSpan(
                                                text: 'Back to ',
                                                style: TextStyle(
                                                  color: Color(0xFF222222),
                                                  fontSize: 16,
                                                  fontFamily: 'Nunito',
                                                  fontWeight: FontWeight.w700,
                                                  height: 0.09,
                                                ),
                                              ),
                                              TextSpan(
                                                text: 'Sign In',
                                                style: TextStyle(
                                                  color: Color(0xFF342CD2),
                                                  fontSize: 16,
                                                  fontFamily: 'Nunito',
                                                  fontWeight: FontWeight.w700,
                                                  height: 0.09,
                                                ),
                                              ),
                                            ],
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                        onPressed: () {
                                          Navigator.pushNamed(
                                              context, SignIn.routeName);
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 60,
                  left: MediaQuery.of(context).size.width * 0.05,
                  right: 8,
                ),
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back_ios),
                      color: Colors.white,
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
