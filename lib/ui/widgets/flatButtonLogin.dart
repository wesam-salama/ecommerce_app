import 'package:flutter/material.dart';

class FlatButtonWidget extends StatelessWidget {
  String buttonName;
  Function submetForm;
  FlatButtonWidget({this.buttonName, this.submetForm});
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: Text(
        buttonName,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontFamily: "Neusa Next Std",
          fontWeight: FontWeight.w700,
          fontSize: 12,
          color: Color(0xffffffff),
        ),
      ),
      onPressed: () {
        submetForm(context);
      },
    );
  }
}
