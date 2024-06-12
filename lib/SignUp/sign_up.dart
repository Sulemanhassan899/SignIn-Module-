// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import '../../constants.dart';
import '../../uitls/button_layout.dart';
import '../../uitls/white_box_2.dart';
import '../SignIn/sign_in.dart';
import '../uitls/snaplink_textlayout.dart';

class SignUp extends StatefulWidget {
  static String routeName = "/SignUp";

  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _isPasswordStrong = false;
  String _emailErrorText = '';
  String _passwordErrorText = '';
  String _emailExistsErrorText = '';
  bool _isButtonEnabled = false;

  String _validateEmail(String email) {
    if (email.isEmpty) {
      return 'Please enter your email';
    } else if (!email.contains('@') || !email.contains('.com')) {
      return 'Please enter correct email format';
    }
    return '';
  }

  void _validateForm() {
    bool isEmailValid = _formKey.currentState!.validate();
    bool isPasswordValid = passwordController.text.isNotEmpty;

    setState(() {
      if (isEmailValid && isPasswordValid) {
        _isButtonEnabled = _formKey.currentState!.validate();
        _emailErrorText = '';
        _emailExistsErrorText = ''; // Reset the error text
      } else {
        _isButtonEnabled = false;
      }
    });
  }

  void _signUp() async {
    try {
      // Placeholder for the sign-up process
      // Simulating a successful sign-up
      bool signUpSuccess = true;

      if (signUpSuccess) {
        // Successfully signed up, do something like navigate to next screen

      } else {
        // Simulating an error for email already in use
        setState(() {
          _emailExistsErrorText = 'Email already exists';
          _emailErrorText = ''; // Clear previous email error
        });
      }
    } catch (e) {
      print('Error signing up: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: kPrimaryGradientColor2,
        ),
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: WhiteContainerDashboard(
                  child: Form(
                    key: _formKey,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 40),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 40),
                            child: Text(
                              'Get started free.',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xFF222222),
                                fontSize: 30,
                                fontFamily: 'Nunito Sans',
                                fontWeight: FontWeight.w800,
                                height: 0.05,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: SizedBox(
                            width: 345,
                            child: Text(
                              "Free forever. No credit card needed ",
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
                          padding: const EdgeInsets.only(top: 24),
                          child: SizedBox(height: 10),
                        ),
                        SizedBox(
                          width: 500,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: TextFormField(
                              controller: emailController,
                              decoration: InputDecoration(
                                labelText: 'Email',
                                errorText: _emailExistsErrorText.isNotEmpty
                                    ? _emailExistsErrorText
                                    : _emailErrorText.isNotEmpty
                                    ? _emailErrorText
                                    : null,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8),
                        ),
                        SizedBox(
                          width: 500,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: TextFormField(
                              controller: passwordController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return null;
                                } else if (!_isPasswordStrong) {
                                  return 'Password should be at least 8 characters long';
                                }
                                return null;
                              },
                              onChanged: (_) {
                                _validateForm();
                                setState(() {
                                  _isPasswordStrong =
                                      passwordController.text.length >= 5;
                                });
                              },
                              obscureText: true,
                              decoration: InputDecoration(
                                labelText: 'Password',
                                hintText: 'Enter your password',
                                suffixIcon: passwordController.text.isNotEmpty
                                    ? _isPasswordStrong
                                    ? Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 20),
                                  child: SizedBox(
                                    width: 70,
                                    height: 16,
                                    child: Row(
                                      children: [
                                        Icon(Icons.check_circle, color: Colors.green),
                                        SizedBox(width: 5),
                                        Text(
                                          'Strong',
                                          style: TextStyle(
                                            fontFamily: 'Nunito',
                                            fontWeight: FontWeight.w700,
                                            fontSize: 13,
                                            color: Colors.green,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                                    : Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 10),
                                  child: SizedBox(
                                    width: 70,
                                    height: 16,
                                    child: Row(
                                      children: [
                                        Icon(Icons.info, color: Colors.grey),
                                        SizedBox(width: 5),
                                        Text(
                                          'Weak',
                                          style: TextStyle(
                                            fontFamily: 'Nunito',
                                            fontWeight: FontWeight.w700,
                                            fontSize: 13,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                                    : null,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: ButtonLayout(
                            width: 350,
                            height: 62,
                            buttonText: "Sign Up",
                            enabled: _isButtonEnabled,
                            onPressed: () {
                              setState(() {
                                _emailErrorText = _validateEmail(emailController.text);
                                if (_emailErrorText.isEmpty) {
                                  _signUp();
                                }
                              });
                            },
                          ),
                        ),
                        Container(
                          width: 345,
                          height: 54,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                " Don't have an account ? ",
                                style: TextStyle(fontSize: 14),
                              ),
                              GestureDetector(
                                onTap: () => Navigator.pushNamed(context, SignIn.routeName),
                                child: Text(
                                  "Sign In",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Color(0xFF332CD2),
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
                      enableFeedback: true,
                      onPressed: () {
                        // Navigator.of(context).pop(); // Close the action sheet
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
