import 'package:cheapify/login/login.dart';
import 'package:cheapify/signup/signup.dart';
import 'package:cheapify/welcome/welcome.dart';

var appRoutes = {
  '/': (context) => WelcomeScreen(),
  '/login': (context) => const LoginScreen(),
  '/signup': (context) => SignupScreen(),
};
