import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RaisedButtonWidget extends StatelessWidget {
  Color buttonColor;
  Color textColor;
  Color iconColor;
  String buttonName;
  Function onpressed;
  RaisedButtonWidget(
      {this.buttonColor,
      this.textColor,
      this.buttonName,
      this.iconColor,
      this.onpressed});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 46,
      width: 160,
      child: RaisedButton(
        onPressed: () {
          onpressed();
        },
        color: buttonColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              buttonName,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: "Neusa Next Std",
                fontWeight: FontWeight.w700,
                fontSize: 12,
                color: textColor,
              ),
            ),
            FaIcon(
              FontAwesomeIcons.arrowAltCircleRight,
              color: iconColor,
            ),
          ],
        ),
      ),
    );
  }
}
