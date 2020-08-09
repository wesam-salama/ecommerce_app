import 'package:e_commerce/ui/screens/cart_and_order/cartPage.dart';
import 'package:e_commerce/ui/screens/home_and_categories/homeAndCategories.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: 0,
      items: [
        BottomNavigationBarItem(
          icon: IconButton(
              icon: FaIcon(
                FontAwesomeIcons.home,
                color: Colors.red,
                size: 25,
              ),
              onPressed: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (BuildContext context) => HomeAndCategories()));
              }),
          title: Text(
            "Home",
            style: TextStyle(
              fontFamily: "Neusa Next Std",
              fontSize: 11,
              color: Color(0xffff6969),
            ),
          ),
        ),
        BottomNavigationBarItem(
          icon: IconButton(
              icon: FaIcon(
                FontAwesomeIcons.shoppingCart,
                color: Colors.red,
                size: 25,
              ),
              onPressed: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (BuildContext context) => CartPage()));
              }),
          title: Text(
            "Cart",
            style: TextStyle(
              fontFamily: "Neusa Next Std",
              fontSize: 13,
              color: Color(0xffff6969),
            ),
          ),
        ),
        BottomNavigationBarItem(
          icon: IconButton(
              icon: FaIcon(
                FontAwesomeIcons.solidUser,
                color: Colors.red,
                size: 25,
              ),
              onPressed: () {}),
          title: Text(
            "Profile",
            style: TextStyle(
              fontFamily: "Neusa Next Std",
              fontSize: 13,
              color: Color(0xffff6969),
            ),
          ),
        ),
      ],
    );
  }
}
