import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignInProvider extends ChangeNotifier
{
  // instance of firebaseauth, and google
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  bool _isSignedIn = false;
  bool get isSignedIn => _isSignedIn;

  bool _hasError = false;
  bool get hasError => _hasError;
  
  String ? _errorCode;
  String ? get errorCode => _errorCode;

  // These are what will be stored in the database
  String ? _provider;
  String ? get provider => _provider;

  String ? _userId;
  String ? get userId => _userId;

  String ? _name;
  String ? get name => _name;

  String ? _email;
  String ? get email => _email;

  String ? _imageUrl;
  String ? get imageUrl => _imageUrl;


  SignInProvider() {
    checkSignInUser();
  }

  Future checkSignInUser() async 
  {
    final SharedPreferences s = await SharedPreferences.getInstance();
    _isSignedIn = s.getBool("signed_in") ?? false;
    notifyListeners();
  }

  Future setSignIn() async
  {
    final SharedPreferences s = await SharedPreferences.getInstance();

    s.setBool("sign_in", true);
    _isSignedIn = true;
    
    notifyListeners();
  }

  // sign in with Google
  Future signInWithGoogle() async
  {
    final GoogleSignInAccount ? googleSignInAccount = 
      await googleSignIn.signIn();

    if (googleSignInAccount != null)
    // execute authentication
    {
      try
      {
        final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;
        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );

        // sign in to firebase user instance
        final User userDetails = 
          (await firebaseAuth.signInWithCredential(credential)).user!;

        // now save all values
        _name = userDetails.displayName;
        _email = userDetails.email;
        _imageUrl = userDetails.photoURL;
        _userId = userDetails.uid;
        _provider = "GOOGLE";

        notifyListeners();
      } on FirebaseAuthException catch(e)
      {
        switch(e.code)
        {
          case "account-exists-with-different-credential":
            _errorCode = "You have an exisiting account with us.";
            _hasError = true;
            notifyListeners();
            break;

          case "null":
            _errorCode = "Some unexpected error has occured signing in";
            _hasError = true;
            notifyListeners();
            break;

          default:
            _errorCode = e.toString();
            _hasError = true;
            notifyListeners();
          }
      }
    }
    else
    {
      _hasError = true;
      notifyListeners();
    }
  }

  // entry point for cloud firestore
  Future getUserDataFromFirestore(userId) async
  {
    await FirebaseFirestore.instance.collection("users")
    .doc(userId).get()
    .then((DocumentSnapshot snapshot) => 
    {
      _userId = snapshot['uid'],
      _name = snapshot['name'],
      _email = snapshot['email'],
      _imageUrl = snapshot['image_url'],
      _provider = snapshot['provider'],
    });
  }

  // saves to the users data to the cloud firestore
  Future saveDataToFirestore() async
  {
    final DocumentReference r =
      FirebaseFirestore.instance.collection("users").doc(userId);
    
    await r.set({
      "uid": _userId,
      "name": _name,
      "email": _email,
      "image_url": _imageUrl,
      "provider": _provider,
    });

    notifyListeners();
  }

  Future saveDataToSharedPreferences() async
  {
    final SharedPreferences s = await SharedPreferences.getInstance();

    await s.setString('name', _name!);
    await s.setString('email', _email!);
    await s.setString('uid', _userId!);
    await s.setString('image_url', _imageUrl!);
    await s.setString('provider', _provider!);

    notifyListeners();
  }

  // check if a User exists in the cloud firestore
  Future<bool> checkUserExists() async
  {
    DocumentSnapshot snap = await FirebaseFirestore.instance.collection('users').doc(_userId).get();

    if (snap.exists)
    {
      print("Existing user");
      return true;
    }
    else
    {
      print("New user");
      return false;
    }
  }

  // signout the user
  Future userSignOut() async 
  {
    await firebaseAuth.signOut;
    await googleSignIn.signOut();
    _isSignedIn = false;
    notifyListeners();

    // clear storage information
    clearStoreData();
  }

  Future clearStoreData() async
  {
    final SharedPreferences s = await SharedPreferences.getInstance();
    s.clear();
  }
}