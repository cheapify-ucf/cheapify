import 'dart:ui';
import 'package:cheapify/signup/signup.dart';
import 'package:cheapify/customComponents/custom_TextFields.dart';
import 'package:cheapify/customComponents/custom_button.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  WelcomeScreen({super.key});

  // Text editing controllers
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      // avoids silly little notches in phones and things alike
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
                child: const Image(
                  image: AssetImage('assets/images/cheapify.png'),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                      height: MediaQuery.of(context).size.height *
                          0.25), // Whitespace from top
                  ClipRect(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                            color: const Color.fromRGBO(0, 0, 0, 1)
                                .withOpacity(0.2),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(30))),
                        height: MediaQuery.of(context).size.height * 0.6,
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: Form(
                          key: _formKey,
                          child: Center(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text("Hello! ",
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 0, 0, 0),
                                        fontSize: 40,
                                        fontWeight: FontWeight.bold)),
                                const SizedBox(height: 20),
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
                                      if (_formKey.currentState!.validate()) {
                                        print('Sign up :)');
                                      }
                                    }),
                                    text: "Continue with Email"),

                                const SizedBox(height: 10),

                                // google and apple sign in
                                SignInButton(
                                    onTap: () {
                                      print('Google!');
                                    },
                                    imageAsset: 'assets/images/google_logo.png',
                                    text: 'Continue with Google'),

                                const SizedBox(height: 10),

                                SignInButton(
                                    onTap: () {
                                      print('Apple!');
                                    },
                                    imageAsset: 'assets/images/apple_logo.png',
                                    text: 'Continue with Apple'),

                                // Fields to create an account
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
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
                                                  color: Color.fromARGB(
                                                      255, 233, 201, 71),
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
                                          alignment:
                                              const Alignment(-1.0, -3.0),
                                          padding: MaterialStateProperty.all<
                                              EdgeInsetsGeometry>(
                                            const EdgeInsets.all(0),
                                          ),
                                        ),
                                        child: const Text(
                                          'Forgot Password?',
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 233, 201, 71),
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
