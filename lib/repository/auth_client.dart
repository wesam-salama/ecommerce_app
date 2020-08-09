import 'package:e_commerce/ui/screens/home_and_categories/homeAndCategories.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Auth {
  Auth._();
  static final Auth auth = Auth._();
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  // create google sign in
  GoogleSignIn googleSignIn = GoogleSignIn();
  Future<FirebaseUser> registerUsingEmailAndPassword(
      {String email, String password}) async {
    try {
      AuthResult authResult = await firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      if (authResult.user != null) {
        print(authResult.user.uid);
        return authResult.user;
      } else {
        return null;
      }
    } catch (error) {
      print(error);
    }
  }

  Future<FirebaseUser> loginUsingEmailAndPassword(
      String email, String password, BuildContext context) async {
    try {
      AuthResult authResult = await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      if (authResult.user != null) {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => HomeAndCategories()));
        return authResult.user;
      } else {
        return null;
      }
    } catch (error) {
      print(error);
    }
  }

  Future<FirebaseUser> loginUsingGmail() async {
    try {
      // create google Account
      GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
      // create authentaication object to get the  access token and token id
      GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;
      // get credintials
      String accesToken = googleSignInAuthentication.accessToken;
      String tokenId = googleSignInAuthentication.idToken;
      // create credintial object
      AuthCredential authCredential = GoogleAuthProvider.getCredential(
          idToken: tokenId, accessToken: accesToken);
      // create the user using credintials
      AuthResult authResult =
          await firebaseAuth.signInWithCredential(authCredential);
      // print(authResult.user.photoUrl);
      // print(authResult.user.email);
      // print(authResult.user.displayName);
      if (authResult.user == null) {
        return null;
      } else {
        return authResult.user;
      }
    } catch (error) {
      print(error);
    }
  }

  signOut() {
    auth.signOut();
  }
}
