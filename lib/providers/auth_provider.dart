import 'package:e_commerce/models/user_model.dart';
import 'package:e_commerce/repository/auth_client.dart';
import 'package:e_commerce/repository/fire_store_repository.dart';
import 'package:e_commerce/ui/screens/home_and_categories/homeAndCategories.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:string_validator/string_validator.dart';

class AuthProvider extends ChangeNotifier {
  final keyForm2 = GlobalKey<FormState>();
  final keyForm = GlobalKey<FormState>();
  final formKeyaddress = GlobalKey<FormState>();
  FirebaseUser user;

  validatorEmail(String value) {
    if (value == null || value == "") {
      return "this Field is requerd";
    }
    notifyListeners();
  }

  validatorName(String value) {
    if (value == null || value == "") {
      return "this Field is requerd";
    } else if (!isAlpha(value)) {
      return "The name con't contain Number";
    }
    notifyListeners();
  }

  validatorPassword(String value) {
    if (value == null || value == "") {
      return "this Field is requerd";
    } else if (value.length < 6) {
      return 'Must be more than 5 charater';
    }
    notifyListeners();
  }

  validatorAddress(String value) {
    if (value == null || value == "") {
      return "this Field is requerd";
    }
  }

  submetFormLogin(BuildContext context) async {
    if (keyForm2.currentState.validate()) {
      keyForm2.currentState.save();
      FirebaseUser user = await Auth.auth
          .loginUsingEmailAndPassword(this.email, this.password, context);
      if (user != null) {
        this.user = user;
        print(user.uid);
      } else {
        return null;
      }
    }
    return;
  }

  submetaddress(BuildContext context) {
    if (formKeyaddress.currentState.validate()) {
      formKeyaddress.currentState.save();
      notifyListeners();
      Navigator.pop(context);
      print(name);
    }
    return;
  }

  submetFormGmail(BuildContext context) async {
    await loginUsingGmail(context);
  }

  String email;
  String name;

  String password;

  getName(value) {
    this.name = value;
    notifyListeners();
  }

  getEmail(value) {
    this.email = value;
    notifyListeners();
  }

  getpassword(value) {
    this.password = value;
    notifyListeners();
  }

  String username = "Your name";
  String streetNum = "Street number";
  String city = "City";
  String contry = "Contry";

  getUsername(value) {
    this.username = value;
    notifyListeners();
  }

  getStreetNum(value) {
    this.streetNum = value;
    notifyListeners();
  }

  getCity(value) {
    this.city = value;
    notifyListeners();
  }

  getContry(value) {
    this.contry = value;
    notifyListeners();
  }

  loginUsingGmail(BuildContext context) async {
    FirebaseUser user = await Auth.auth.loginUsingGmail();

    User userMosel = User(
        userEmail: user.email,
        userName: user.displayName,
        userImageURL: user.photoUrl);

    if (user != null) {
      this.user = user;
      print(user.uid);
      FireStoeRepository.fires.createUser(user, userMosel);
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (BuildContext context) => HomeAndCategories()));
    } else {
      return null;
    }
  }

  registerUsingEmailAndPassword(BuildContext context) async {
    try {
      FirebaseUser user = await Auth.auth.registerUsingEmailAndPassword(
          email: this.email, password: this.password);

      User userMosel = User(
        userEmail: this.email,
        userName: this.name,
      );

      if (user != null) {
        this.user = user;
        print(user.uid);
        FireStoeRepository.fires.createUser(user, userMosel);
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => HomeAndCategories()));
      } else {
        return null;
      }
    } catch (error) {
      print(error);
    }
  }

  submetFormRegister(BuildContext context) async {
    if (keyForm.currentState.validate()) {
      keyForm.currentState.save();
      await registerUsingEmailAndPassword(context);
    } else {
      return null;
    }
  }
}
