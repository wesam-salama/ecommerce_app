import 'package:e_commerce/ui/screens/cart_and_order/orderPage.dart';
import 'package:e_commerce/ui/widgets/raisedButtonWidget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SuccessOrder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F6F8),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: IconButton(
                icon: FaIcon(
                  FontAwesomeIcons.times,
                  color: Color(0xFFFF6969),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                }),
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 101,
              height: 101,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.5),
                  // shape: BoxShape.circle,
                  color: Colors.white,
                  border: Border.all(
                    width: 5.0,
                    color: Colors.white,
                  )),
              child: Center(
                child: FaIcon(
                  FontAwesomeIcons.check,
                  color: Color(0xFFFF6969),
                  size: 50,
                ),
              ),
            ),
            SizedBox(height: 28),
            Text(
              "Order Placed!",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: "Neusa Next Std",
                fontWeight: FontWeight.w500,
                fontSize: 30,
                color: Color(0xff515c6f),
              ),
            ),
            SizedBox(height: 13),
            Padding(
              padding: const EdgeInsets.only(left: 40, right: 40),
              child: Text(
                "Your order was placed successfully. For more details, check All My Orders page under Profile tab",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: "Neusa Next Std",
                  fontSize: 15,
                  color: Color(0xff515c6f),
                ),
              ),
            ),
            SizedBox(height: 50),
            RaisedButtonWidget(
              buttonColor: Color(0xffff6969),
              textColor: Color(0xFFFFFFFF),
              buttonName: "MY ORDERS",
              iconColor: Color(0xFFFFFFFF),
              onpressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => OrdersPage()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
