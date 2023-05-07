import 'package:cheapify/pages/util/push_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cheapify/pages/welcome_screen.dart';
import 'package:cheapify/pages/login_screen.dart';
import 'package:provider/provider.dart';
import 'dart:ui';

import '../provider/sign_in_provider.dart';

class HomeScreen extends StatefulWidget
{
  const HomeScreen({Key ? key}) : super(key : key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
{
  @override
  Widget build(BuildContext context)
  {
    final provider = context.read<SignInProvider>();
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: Text("Sign Out"),
          onPressed: (){
            provider.userSignOut();
            nextScreenReplace(context, const LoginScreen());
          },
        ),
      ),
    );
  }

}