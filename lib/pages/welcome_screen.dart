import 'dart:ui';
import 'package:cheapify/pages/signup.dart';
import 'package:cheapify/customComponents/custom_TextFields.dart';
import 'package:cheapify/customComponents/custom_button.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget
{
  WelcomeScreen({super.key});

  // Text editing controllers
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context)
  {
    return SafeArea( // avoids silly little notches in phones and things alike
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Color.fromARGB(200, 158, 137, 201),
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.40,
                width: MediaQuery.of(context).size.width * 0.75,
                child: Image(
                  image: AssetImage('assets/images/cheapify.png'),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.17), // Whitespace from top
                  const Text("Hello! ",
                    style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontSize: 40,
                      fontWeight: FontWeight.bold)),
                  ClipRect(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(0, 0, 0, 1).withOpacity(0.2),
                          borderRadius: const BorderRadius.all(Radius.circular(30))
                        ),
                        height: MediaQuery.of(context).size.height * 0.71,
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: Form(
                          key: _formKey,
                          child: Center(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const SizedBox(height: 31),
                                // Email Field
                                MyTextField(
                                  controller: usernameController,
                                  suffixIcon: null,
                                  hintText: 'Email',
                                  obscureText: false,
                                ),

                                const SizedBox(height: 10),
                                
                                // Password Field
                                /*MyTextField(
                                  controller: passwordController,
                                  suffixIcon: const Icon(Icons.visibility_off),
                                  hintText: 'Password',
                                  obscureText: true,
                                ),*/

                                //const SizedBox(height: 10),

                                // Login Button
                                CustomButton(
                                  onTap: (() {
                                    if (_formKey.currentState!.validate())
                                    {
                                      print('Sign up :)');
                                    }
                                  }),
                                  text: "Continue with Email"
                                ),

                                const SizedBox(height: 10),

                                // google and apple sign in
                                Padding(
                                  padding: const EdgeInsets.all(0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(20),
                                        decoration: BoxDecoration(
                                          border: Border.all(color: Colors.white),
                                          borderRadius: BorderRadius.circular(16),
                                          color: Colors.grey.shade200,
                                        ),
                                        child: Row(
                                          children: [
                                            Image.asset(
                                              'assets/images/google_logo.png',
                                              height: 40,
                                            ),
                                            const SizedBox(width: 20),
                                            const Text(
                                              "Continue with Google",
                                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ),

                                      const SizedBox(height: 10),  

                                      Container(
                                        padding: EdgeInsets.all(20),
                                        decoration: BoxDecoration(
                                          border: Border.all(color: Colors.white),
                                          borderRadius: BorderRadius.circular(16),
                                          color: Colors.grey.shade200,
                                        ),
                                        child: Row(
                                          children: [
                                            Image.asset(
                                              'assets/images/apple_logo.png',
                                              height: 40,
                                            ),
                                            const SizedBox(width: 20),
                                            const Text(
                                              "Continue with Apple",
                                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                // Fields to create an account
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.stretch,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          const Text(
                                            'Don\'t have an account?',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20),
                                            textAlign: TextAlign.start,
                                          ),
                                          const SizedBox(width: 4),
                                          TextButton(
                                            onPressed: () {
                                              print('Sign up');
                                            }, // ToDo: Sign up screen
                                            child: const Text(
                                              'Sign up!',
                                              style: TextStyle(
                                                color: Color.fromARGB(255, 233, 201, 71),
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20),
                                              ),
                                          ),
                                        ],
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          print('Forgot password screen');
                                        },
                                        style: ButtonStyle(
                                          alignment: const Alignment(-1.0, -3.0),
                                          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                                            const EdgeInsets.all(0),
                                          ),
                                        ),
                                        child: const Text(
                                          'Forgot Password?',
                                          style: TextStyle(
                                            color: Color.fromARGB(255, 233, 201, 71),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                          textAlign: TextAlign.left,
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
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}