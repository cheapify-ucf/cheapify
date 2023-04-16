import 'dart:ui';

import 'package:cheapify/pages/welcome_screen.dart';
import 'package:cheapify/customComponents/custom_TextFields.dart';
import 'package:cheapify/customComponents/custom_button.dart';
import 'package:flutter/material.dart';

class Signup extends StatelessWidget
{
  Signup({super.key});

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();


  final _formKey = GlobalKey<FormState>();

  void signUserIn()
  {
    if (_formKey.current!.validate()) {
      print('valid');
    } else {
      print('Not valid');
    }
  }

  @override Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            alignment: Alignment.center,
            children: [
              
            ],
          ),
        ),
      ),
    ),
  }
}