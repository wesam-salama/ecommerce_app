import 'package:e_commerce/models/product_model.dart';
import 'package:e_commerce/ui/screens/product/productPage.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CategoriesCart extends StatelessWidget {
  Product pr;
  CategoriesCart(this.pr);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) => ProductPage(pr)));
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
              padding: const EdgeInsets.all(20.0),
              child: CachedNetworkImage(
                height: 95,
                imageUrl: pr.productImage,
                placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(
                pr.productName,
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
                "\$ ${pr.productPrice}",
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
