import 'dart:ui';

import 'package:cheapify/customComponents/snack_bar.dart';
import 'package:cheapify/pages/home_screen.dart';
import 'package:cheapify/pages/util/push_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../customComponents/custom_TextFields.dart';
import '../customComponents/custom_button.dart';
import '../provider/internet_provider.dart';
import '../provider/sign_in_provider.dart';

class LoginScreen extends StatefulWidget
{
  const LoginScreen({Key ? key}) : super(key : key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
{
  final GlobalKey _scaffoldKey = GlobalKey<ScaffoldState>();

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

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
              SizedBox( // Holding the image of our bread friend :)
                height: MediaQuery.of(context).size.height * 0.40,
                width: MediaQuery.of(context).size.width * 0.75,
                child: const Image(
                  image: AssetImage('assets/images/cheapify.png'),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.18), // Whitespace from top
                  const Text("Hello! ",
                    style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontSize: 40,
                      fontWeight: FontWeight.bold)),
                  ClipRect( // Holds all our text fields
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(0, 0, 0, 1).withOpacity(0.2),
                          borderRadius: const BorderRadius.all(Radius.circular(30))
                        ),
                        height: MediaQuery.of(context).size.height * 0.7,
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: Form(
                          key: _scaffoldKey,
                          child: Center(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const SizedBox(height: 25),
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

                                // Continue/Login Button
                                CustomButton(
                                  onTap: (() {
                                      print('Sign up :)');
                                  }),
                                  text: "Continue with Email"
                                ),

                                const SizedBox(height: 10),

                                // google and apple sign in
                                SignInButton(
                                  onTap: () {
                                    print('Logging in!!!');
                                    handleGoogleSignIn();
                                  },
                                  imageAsset: "assets/images/google_logo.png",
                                  text: 'Continue with Google'
                                ),

                                const SizedBox(height: 10),  

                                SignInButton(
                                  onTap: () {print('Apple!');},
                                  imageAsset: "apple",
                                  text: 'Continue with Apple'
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
                                        }, // TODO: Forgot password screen
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

  Future handleGoogleSignIn() async 
  {
    final provider = context.read<SignInProvider>();
    final ip = context.read<InternetProvider>();
    await ip.checkInternetConnection();

    if (ip.hasInternet == false)
    {
      openSnackBar(context, "Failed to gather internet connection.", Colors.red);
    }
    else
    {
      // internet connection is fine, time to continue with signing in with google
      await provider.signInWithGoogle().then((value)
      {
        if (provider.hasError == true)
        {
          openSnackBar(context, provider.errorCode.toString(), Colors.red);
        }
        else 
        // check for existing user
        {
          provider.checkUserExists().then((value) async
          {
            if (value == true)
            // user exists
            {
              await provider.getUserDataFromFirestore(provider.userId).then((value) => 
              provider.saveDataToSharedPreferences().then((value) => 
              provider.setSignIn().then((value) 
              {
                handleAfterSignIn();
              })));
            }
            else
            {
              provider.saveDataToFirestore().then((value) => 
              provider.saveDataToSharedPreferences().then((value) => 
              provider.setSignIn().then((value) 
              {
                  handleAfterSignIn();
              })));
            }
          });
        }
      });
    }

  }

  // handle after sign in (from google, apple, or email)
  handleAfterSignIn()
  {
    Future.delayed(const Duration(milliseconds: 1000)).then((value) {
      nextScreenReplace(context, HomeScreen());
    });
  }
}