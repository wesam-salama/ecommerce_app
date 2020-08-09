import 'package:e_commerce/providers/auth_provider.dart';
import 'package:e_commerce/ui/widgets/flatButtonLogin.dart';
import 'package:e_commerce/ui/widgets/textFormField.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Signin extends StatefulWidget {
  @override
  _SigninState createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  // validatorEmail(String value) {
  //   if (value == null || value == "") {
  //     return "this Field is requerd";
  //   } else if (!isEmail(value)) {
  //     return "The Email is Invalid";
  //   }
  // }

  // validatorPassword(String value) {
  //   if (value == null || value == "") {
  //     return "this Field is requerd";
  //   } else if (value.length < 6) {
  //     return 'Must be more than 5 charater';
  //   }
  // }

  // String name;
  // String email;
  // String password;

  @override
  Widget build(BuildContext context) {
    return Form(
        key: Provider.of<AuthProvider>(context).keyForm,
        child: Column(
          children: <Widget>[
            TextFormFieldCustom(
              labelText: 'EMAIL',
              icon: Icons.email,
              obscureText: false,
              validationFunc: Provider.of<AuthProvider>(context).validatorEmail,
              savedForm: Provider.of<AuthProvider>(context).getEmail,
            ),
            SizedBox(height: 15),
            TextFormFieldCustom(
              labelText: 'USERNAME',
              icon: Icons.person_outline,
              obscureText: false,
              validationFunc: Provider.of<AuthProvider>(context).validatorName,
              savedForm: Provider.of<AuthProvider>(context).getName,
            ),
            SizedBox(height: 15),
            TextFormFieldCustom(
              labelText: 'PASSWORD',
              icon: Icons.lock_outline,
              obscureText: true,
              validationFunc:
                  Provider.of<AuthProvider>(context).validatorPassword,
              savedForm: Provider.of<AuthProvider>(context).getpassword,
            ),
            SizedBox(height: 140),
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
                buttonName: "SIGN UP",
                submetForm: Provider.of<AuthProvider>(context, listen: false)
                    .submetFormRegister,
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 55, right: 55, top: 20),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: 'By creating an account, you agree to our ',
                  style: TextStyle(
                    fontFamily: "Neusa Next Std",
                    fontWeight: FontWeight.w300,
                    fontSize: 12,
                    color: Color(0xff515c6f),
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Terms of Service',
                      style: TextStyle(
                        fontFamily: "Neusa Next Std",
                        fontWeight: FontWeight.w300,
                        fontSize: 12,
                        color: Color(0xffff6969),
                      ),
                    ),
                    TextSpan(
                      text: ' and',
                      style: TextStyle(
                        fontFamily: "Neusa Next Std",
                        fontWeight: FontWeight.w300,
                        fontSize: 12,
                        color: Color(0xff515c6f),
                      ),
                    ),
                    TextSpan(
                      text: ' Privacy Policy',
                      style: TextStyle(
                        fontFamily: "Neusa Next Std",
                        fontWeight: FontWeight.w300,
                        fontSize: 12,
                        color: Color(0xffff6969),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
