import 'package:flutter/material.dart';
import 'package:sign_in_module/SignIn/sign_in.dart';
import 'package:sign_in_module/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
debugShowCheckedModeBanner: false,
      home: SignIn(), // Replace HomePage() with your screen widget for users without uploaded images
      routes: routes,    );
  }
}
