import 'package:e_commerce/ui/widgets/flatButtonLogin.dart';
import 'package:e_commerce/ui/widgets/textFormField.dart';
import 'package:flutter/material.dart';
import 'package:string_validator/string_validator.dart';

class ForgetPassword extends StatefulWidget {
  @override
  _ForgetPasswordState createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final keyForm3 = GlobalKey<FormState>();

  String email;

  getEmail(value) {
    this.email = value;
  }

  validatorEmail(String value) {
    if (value == null || value == "") {
      return "this Field is requerd";
    } else if (!isEmail(value)) {
      return "The Email is Invalid";
    }
  }

  submetForm() {
    if (keyForm3.currentState.validate()) {
      keyForm3.currentState.save();
    }
    return;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Color(0xffff6969)),
            onPressed: () => Navigator.of(context).pop(),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Form(
          key: keyForm3,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  "Enter the email address you used to create your account and we will email you a link to reset your password",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: "Neusa Next Std",
                    fontWeight: FontWeight.w300,
                    fontSize: 15,
                    color: Color(0xff515c6f),
                  ),
                ),
              ),
              TextFormFieldCustom(
                labelText: 'EMAIL',
                icon: Icons.email,
                obscureText: false,
                validationFunc: validatorEmail,
                savedForm: getEmail,
              ),
              SizedBox(height: 45),
              Container(
                height: 46.00,
                width: 330.00,
                decoration: BoxDecoration(
                  color: Color(0xffff6969),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0.00, 5.00),
                      color: Color(0xffff6969).withOpacity(0.40),
                      blurRadius: 10,
                    ),
                  ],
                  borderRadius: BorderRadius.circular(23.00),
                ),
                child: FlatButtonWidget(
                  buttonName: "SEND EMAIL",
                  submetForm: submetForm,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
