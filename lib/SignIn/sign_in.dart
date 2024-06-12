// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import '../../constants.dart';
import '../../uitls/button_layout.dart';
import '../../uitls/snaplink_textlayout.dart';
import '../../uitls/white_box.dart';
import '../ForgotPassword/ForgotPassword.dart';
import '../SignUp/sign_up.dart';

class SignIn extends StatefulWidget {
  static String routeName = "/SignIn";

  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String? _emailErrorText;
  String? _passwordErrorText;
  bool _isButtonEnabled = false;

  void _validateForm() {
    setState(() {
      _isButtonEnabled = _emailController.text.isNotEmpty &&
          _passwordController.text.isNotEmpty;
    });
  }

  String? _validateEmail(String email) {
    if (email.isEmpty) {
      return 'Please enter your email';
    } else if (!email.contains('@') || !email.contains('.com')) {
      return 'Please enter correct email format';
    }
    return null;
  }

  String? _validatePassword(String? password) {
    if (password == null || password.isEmpty) {
      return 'Please enter your password';
    }
    return null;
  }

  void _signInWithEmailAndPassword() async {
    setState(() {
      _emailErrorText = _validateEmail(_emailController.text.trim());
      _passwordErrorText = null;
    });

    if (_emailErrorText == null && _passwordErrorText == null) {
      bool isSuccess = await _mockSignIn(
        _emailController.text,
        _passwordController.text,
      );

      if (isSuccess) {
        bool hasUploadedImages = true;
        print("success");
        // naviagtion for the next screen

      } else {
        setState(() {
          _emailErrorText = 'Invalid email or password';
          _passwordErrorText = 'Invalid email or password';
        });
      }
    }
  }

  Future<bool> _mockSignIn(String email, String password) async {
    await Future.delayed(Duration(seconds: 2));
    return email == "test@example.com" && password == "password123";
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
                child: WhiteContainer(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 40),
                          child: Text(
                            'Sign In',
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
                        Padding(
                          padding: const EdgeInsets.only(top: 24),
                          child: SizedBox(height: 20),
                        ),
                        SizedBox(
                          width: 500,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: TextFormField(
                              controller: _emailController,
                              onChanged: (_) => _validateForm(),
                              decoration: InputDecoration(
                                labelText: 'Email',
                                errorText: _emailErrorText,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter your email';
                                } else if (!value.contains('@') ||
                                    !value.contains('.com')) {
                                  return 'Please enter correct email format';
                                }
                                return null;
                              },
                            ),
                          ),
                        ),
                        SizedBox(height: 8),
                        SizedBox(
                          width: 500,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextFormField(
                                  controller: _passwordController,
                                  onChanged: (_) => _validateForm(),
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    labelText: 'Password',
                                    errorText: _passwordErrorText,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(12),
                                      ),
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter your password';
                                    }
                                    return null;
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 16),
                        Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: ButtonLayout(
                            width: 350,
                            height: 62,
                            buttonText: "Sign In",
                            enabled: _isButtonEnabled,
                            onPressed: () {
                              setState(() {
                                _emailErrorText =
                                    _validateEmail(_emailController.text);
                                _passwordErrorText =
                                    _validatePassword(_passwordController.text);
                                _isButtonEnabled = _emailErrorText == null &&
                                    _passwordErrorText == null;
                              });
                              if (_isButtonEnabled) {
                                _signInWithEmailAndPassword();
                              }
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: SizedBox(height: 16),
                        ),
                        SizedBox(
                          height: 40,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        ForgotPassword()),
                              );
                            },
                            child: SizedBox(
                              width: 345,
                              child: Text(
                                'Forgot Your Password?',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xFF878787),
                                  fontSize: 16,
                                  fontFamily: 'Nunito',
                                  fontWeight: FontWeight.w400,
                                  height: 0.09,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Don't have an account ",
                                    style: TextStyle(fontSize: 14),
                                  ),
                                  GestureDetector(
                                    onTap: () =>
                                        Navigator.pushNamed(
                                            context, SignUp.routeName),
                                    child: Text(
                                      "Sign Up",
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Color(0xFF332CD2),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
