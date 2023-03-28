import 'dart:ui';
import 'package:cheapify/pages/signup.dart';
import 'package:cheapify/customComponents/custom_button.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget
{
  const LoginScreen({Key? key}) : super(key: key);
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
{
  bool loginSelected = true;
  bool showPassword = false, showConfirmPassword = false;

  // Text editing controllers
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context)
  {
    return SafeArea( // avoids silly little notches in phones and things alike
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Color.fromARGB(200, 158, 137, 201),
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.55,
                width: MediaQuery.of(context).size.width * 0.75,
                child: Image(
                  image: AssetImage('assets/images/cheapify.png'),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.30),
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
                          color: Color.fromRGBO(0, 0, 0, 1).withOpacity(0.2),
                          borderRadius: BorderRadius.all(Radius.circular(30))
                        ),
                        height: MediaQuery.of(context).size.height * 0.58,
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: Form(
                          key: _formKey,
                          child: Center(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                // Email Field
                                TextFormField(
                                  validator: (val) => val!.isEmpty ? "Enter your email!" : null,
                                  controller: usernameController,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    enabledBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.white),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.grey.shade400),
                                    ),
                                    fillColor: Colors.grey.shade200,
                                    filled: true,
                                    hintText: 'Email',
                                    hintStyle: TextStyle(color: Colors.grey.shade500)
                                  ),
                                ),

                                const SizedBox(height: 10),
                                
                                // Password Field
                                TextFormField(
                                  validator: (val) => val!.isEmpty ? "Please enter your password!" : null,
                                  controller: passwordController,
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    suffixIcon: const Icon(Icons.visibility_off),
                                    enabledBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.white),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.grey.shade400),
                                    ),
                                    fillColor: Colors.grey.shade200,
                                    filled: true,
                                    hintText: 'Password',
                                    hintStyle: TextStyle(color: Colors.grey.shade500),
                                  ),
                                ),

                                const SizedBox(height: 10),

                                // Login Button
                                GestureDetector(
                                  onTap: (() {
                                    if (_formKey.currentState!.validate())
                                    {
                                      print('Sign up :)');
                                    }
                                  }),
                                  child: Container(
                                    padding: const EdgeInsets.all(25),
                                    decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 233, 217, 71),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: const Center(
                                      child: Text(
                                        "Login!",
                                        style: TextStyle(
                                          color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
                                      ),
                                    ),
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
                                          Text(
                                            'Don\'t have an account?',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20),
                                            textAlign: TextAlign.start,
                                          ),
                                          const SizedBox(width: 4),
                                          const Text(
                                            'Sign up!',
                                            style: TextStyle(
                                              color: Color.fromARGB(255, 233, 201, 71),
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: MediaQuery.of(context).size.height * 0.01),
                                      const Text(
                                        'Forgot Password?',
                                        style: TextStyle(
                                          color: Color.fromARGB(255, 233, 201, 71),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                        textAlign: TextAlign.start,
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
