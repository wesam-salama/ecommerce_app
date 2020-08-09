import 'package:flutter/material.dart';

class CategoriesStory extends StatelessWidget {
  String imageUrl;
  String imageText;
  final Color firstColor;
  final Color secondColor;

  CategoriesStory(
      {this.imageUrl, this.imageText, this.firstColor, this.secondColor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 7.5, left: 15),
      child: Column(
        children: <Widget>[
          Container(
            width: 65,
            height: 65,
            child: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Image.asset(
                imageUrl,
              ),
            ),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment
                    .bottomCenter, // 10% of the width, so there are ten blinds.
                colors: [
                  firstColor,
                  secondColor,
                ], // whitish to gray
                tileMode:
                    TileMode.clamp, // repeats the gradient over the canvas
              ),
            ),
          ),
          Text(
            imageText,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: "Neusa Next Std",
              fontSize: 15,
              color: Color(0xff515c6f),
            ),
          )
        ],
      ),
    );
  }
}
