import 'dart:async';
import 'package:cheapify/pages/home_screen.dart';
import 'package:cheapify/pages/login_screen.dart';
import 'package:cheapify/pages/util/push_screen.dart';
import 'package:cheapify/provider/sign_in_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget
{
  const WelcomeScreen({Key ? key}) : super(key : key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
{
  // init state
  @override
  void initState()
  {
    final signInProvider = context.read<SignInProvider>();
    super.initState();

    // create a timer for 2 seconds to fetch the info and migrate to the home screen
    Timer(const Duration(seconds: 2), (){
      signInProvider.isSignedIn == false 
      // user is not logged in
        ? nextScreen(context, const LoginScreen())
      // user is logged in
        : nextScreen(context, HomeScreen()); 
    });
  }

  // loading screen widget
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Image(
                    image: AssetImage('assets/images/cheapify.png'),
                    height: 80,
                    width: 80,
              ),
              SizedBox(height: 10),
              Text(
                "Currently making some toast, one moment!",
                style: TextStyle(fontSize: 12, fontStyle: FontStyle.italic),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
