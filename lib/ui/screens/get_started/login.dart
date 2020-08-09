import 'package:e_commerce/providers/auth_provider.dart';
import 'package:e_commerce/ui/screens/get_started/forgetPassword.dart';
import 'package:e_commerce/ui/widgets/flatButtonLogin.dart';
import 'package:e_commerce/ui/widgets/textFormField.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Form(
        key: Provider.of<AuthProvider>(context).keyForm2,
        child: Column(
          children: <Widget>[
            TextFormFieldCustom(
              labelText: 'USERNAME / EMAIL',
              icon: Icons.person_outline,
              obscureText: false,
              validationFunc: Provider.of<AuthProvider>(context).validatorEmail,
              savedForm: Provider.of<AuthProvider>(context).getEmail,
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
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.only(left: 180),
              child: FlatButton(
                child: Text(
                  "Forgot Password?",
                  textAlign: TextAlign.end,
                  style: TextStyle(
                    fontFamily: "Neusa Next Std",
                    fontWeight: FontWeight.w700,
                    fontSize: 12,
                    color: Color(0xffff6969),
                  ),
                ),
                onPressed: () {
                  setState(() {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => ForgetPassword()));
                  });
                },
              ),
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
                buttonName: "SIGN IN",
                submetForm: Provider.of<AuthProvider>(context, listen: false)
                    .submetFormLogin,
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 40, right: 40, top: 20),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: 'Don’t have an account? Swipe left to ',
                  style: TextStyle(
                    fontFamily: "Neusa Next Std",
                    fontWeight: FontWeight.w300,
                    fontSize: 12,
                    color: Color(0xff515c6f),
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: ' to create a new account.',
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
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // IconButton(
                //     icon: FaIcon(
                //       FontAwesomeIcons.facebook,
                //       color: Color(0xFF4267B2),
                //       size: 32,
                //     ),
                //     onPressed: () {}),
                // IconButton(
                //     icon: FaIcon(
                //       FontAwesomeIcons.facebook,
                //       color: Color(0xFF4267B2),
                //       size: 32,
                //     ),
                //     onPressed: () {}),
                IconButton(
                    icon: FaIcon(
                      FontAwesomeIcons.google,
                      color: Color(0xFF4267B2),
                      size: 32,
                    ),
                    onPressed: () async {
                      // FirebaseAuth.instance.signOut();
                      // bool x = await Auth.auth.loginUsingGmail();
                      // print(x);
                      Provider.of<AuthProvider>(context, listen: false)
                          .submetFormGmail(context);
                    }),
              ],
            )
          ],
        ));
  }
}
