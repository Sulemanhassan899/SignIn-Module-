import 'package:flutter/material.dart';
import '../../constants.dart';
import '../../uitls/button_layout.dart';
import '../../uitls/snaplink_textlayout.dart';
import '../../uitls/white_box_2.dart';
import '../SignIn/sign_in.dart';
import 'ForgotPassword_2.dart';

class ForgotPassword extends StatefulWidget {
  static String routeName = "/ForgotPasswordScreen";

  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  String? _errorMessage;

  Future<void> _sendPasswordResetEmail() async {
    // Simulate sending a password reset email
    try {
      // Simulate a delay for the email sending process
      await Future.delayed(Duration(seconds: 2));
      // Show success message or navigate to a success screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => ForgotPassword2()),
      );
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Password reset email sent successfully'),
          backgroundColor: Colors.green,
        ),
      );
    } catch (error) {
      // Show error message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to send password reset email'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: kPrimaryGradientColor,
        ),
        child: Stack(
          children: [
            WhiteContainerDashboard(
              child: Form(
                key: _formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 40),
                      child: Text(
                        'Forgot Password',
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
                      padding: const EdgeInsets.only(top: 40),
                      child: SizedBox(
                        width: 345,
                        child: Text(
                          "Enter your email address and we'll\nsend you a link to reset your password",
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
                      padding: const EdgeInsets.only(top: 15),
                      child: SizedBox(height: 20),
                    ),
                    SizedBox(
                      width: 500,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: TextFormField(
                          controller: _emailController,
                          decoration: InputDecoration(
                            labelText: 'Email',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(12),
                              ),
                            ),
                          ),
                          validator: (value) {
                            if (value == null ||
                                value.isEmpty ||
                                !value.contains('@') ||
                                !value.contains('.com')) {
                              return 'Please enter a valid email';
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: SizedBox(height: 8),
                    ),
                    ButtonLayout(
                      width: 350,
                      height: 62,
                      buttonText: 'Send',
                      enabled: _emailController.text.isNotEmpty, // Enable button if email is not empty
                      onPressed: () {
                        _sendPasswordResetEmail();
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: SizedBox(height: 8),
                    ),
                    Container(
                      width: 345,
                      height: 54,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Back to ",
                                style: TextStyle(fontSize: 14),
                              ),
                              GestureDetector(
                                onTap: () => Navigator.pushNamed(
                                    context, SignIn.routeName),
                                child: const Text(
                                  "Sign In",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Color(0xFF332CD2),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
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
    );
  }
}
