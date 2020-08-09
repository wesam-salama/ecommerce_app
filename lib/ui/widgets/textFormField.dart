import 'package:flutter/material.dart';

class TextFormFieldCustom extends StatelessWidget {
  final String labelText;
  final IconData icon;
  final bool obscureText;
  final Function validationFunc;
  final Function savedForm;
  TextFormFieldCustom(
      {this.labelText,
      this.icon,
      this.obscureText,
      this.validationFunc,
      this.savedForm});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 330.0,
      child: TextFormField(
        obscureText: obscureText,
        decoration: InputDecoration(
            labelStyle: TextStyle(
              fontFamily: "Neusa Next Std",
              fontWeight: FontWeight.w500,
              fontSize: 12,
              color: Color(0xff515c6f).withOpacity(0.50),
            ),
            labelText: labelText,
            // border: InputBorder.none,
            prefixIcon: Icon(icon)),
        onSaved: (newValue) => savedForm(newValue),
        validator: (value) => validationFunc(value),
      ),
    );
  }
}
