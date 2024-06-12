import 'package:flutter/widgets.dart';

import 'ForgotPassword/ForgotPassword.dart';
import 'SignIn/sign_in.dart';
import 'SignUp/sign_up.dart';

// We use name route
// All our routes will be available here

final Map<String, WidgetBuilder> routes = {

  SignIn.routeName: (context) => SignIn(),
  SignUp.routeName: (context) => const SignUp(),
  ForgotPassword.routeName: (context) => const ForgotPassword(),



};
