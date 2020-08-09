import 'package:e_commerce/models/orderFromFS.dart';
import 'package:e_commerce/models/order_model.dart';
import 'package:e_commerce/ui/screens/cart_and_order/orderCard.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class OrderCart extends StatelessWidget {
  OrderFromFS pr;
  OrderCart(this.pr);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) => OrderCard(pr)));
      },
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xFFFFFFFF),
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(
                pr.userName,
                style: TextStyle(
                  fontFamily: "Neusa Next Std",
                  fontWeight: FontWeight.w300,
                  fontSize: 12,
                  color: Color(0xff515c6f),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(
                "\$ ${pr.address}",
                style: TextStyle(
                  fontFamily: "Neusa Next Std",
                  fontWeight: FontWeight.w700,
                  fontSize: 10,
                  color: Color(0xff515c6f),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
