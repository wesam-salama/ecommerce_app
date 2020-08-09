import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/models/product_model.dart';
import 'package:e_commerce/providers/db_provider.dart';
import 'package:e_commerce/providers/firestore_provider.dart';
import 'package:e_commerce/ui/screens/cart_and_order/cartPage.dart';
import 'package:e_commerce/ui/widgets/raisedButtonWidget.dart';
import 'package:e_commerce/ui/widgets/stepoWidget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductPage extends StatelessWidget {
  Product pr;
  ProductPage(this.pr);
  int count1 = 2;
  int productount = 2;
  int productSize = 2;
  List<String> size = ['XXL', 'XL', 'L', 'M', 'S'];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFF5F6F8),
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.of(context).pop();
            },
            color: Color(0xFFFF6969),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                pr.productName,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: "Neusa Next Std",
                  fontWeight: FontWeight.w300,
                  fontSize: 15,
                  color: Color(0xff515c6f),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "\$ ${pr.productPrice}",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: "Neusa Next Std",
                      fontWeight: FontWeight.w700,
                      fontSize: 15,
                      color: Color(0xff515c6f),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Container(
                    height: 19,
                    width: 42,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xFFFF6969),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Center(
                          child: Icon(
                            Icons.star,
                            color: Colors.white,
                            size: 13,
                          ),
                        ),
                        Text(
                          "4.9",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: "Neusa Next Std",
                            fontWeight: FontWeight.w700,
                            fontSize: 12,
                            color: Color(0xffffffff),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.shopping_cart,
                color: Color(0xFF727C8E),
              ),
              onPressed: () {},
            ),
          ],
        ),
        body: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 3,
              child: CachedNetworkImage(
                height: 95,
                imageUrl: pr.productImage,
                placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
            FlatButton(
              onPressed: () {},
              child: Text(
                "Details",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: "Neusa Next Std",
                  fontSize: 15,
                  color: Color(0xffff6969),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "BRAND",
                            style: TextStyle(
                              fontFamily: "Neusa Next Std",
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                              color: Color(0xff515c6f).withOpacity(0.50),
                            ),
                          ),
                          Text(
                            pr.brand,
                            style: TextStyle(
                              fontFamily: "Neusa Next Std",
                              fontWeight: FontWeight.w300,
                              fontSize: 14,
                              color: Color(0xff515c6f),
                            ),
                          )
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Text(
                            "SKU",
                            style: TextStyle(
                              fontFamily: "Neusa Next Std",
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                              color: Color(0xff515c6f).withOpacity(0.50),
                            ),
                          ),
                          Text(
                            pr.sku,
                            style: TextStyle(
                              fontFamily: "Neusa Next Std",
                              fontWeight: FontWeight.w300,
                              fontSize: 14,
                              color: Color(0xff515c6f),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "CONDITION",
                            style: TextStyle(
                              fontFamily: "Neusa Next Std",
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                              color: Color(0xff515c6f).withOpacity(0.50),
                            ),
                          ),
                          Text(
                            "Brand New, With Box",
                            style: TextStyle(
                              fontFamily: "Neusa Next Std",
                              fontWeight: FontWeight.w300,
                              fontSize: 14,
                              color: Color(0xff515c6f),
                            ),
                          )
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Text(
                            "MATERIAL",
                            style: TextStyle(
                              fontFamily: "Neusa Next Std",
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                              color: Color(0xff515c6f).withOpacity(0.50),
                            ),
                          ),
                          Text(
                            "Faux Sued, Velvet",
                            style: TextStyle(
                              fontFamily: "Neusa Next Std",
                              fontWeight: FontWeight.w300,
                              fontSize: 14,
                              color: Color(0xff515c6f),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "CATEGORY",
                            style: TextStyle(
                              fontFamily: "Neusa Next Std",
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                              color: Color(0xff515c6f).withOpacity(0.50),
                            ),
                          ),
                          Text(
                            "Women Shoes",
                            style: TextStyle(
                              fontFamily: "Neusa Next Std",
                              fontWeight: FontWeight.w300,
                              fontSize: 14,
                              color: Color(0xff515c6f),
                            ),
                          )
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Text(
                            "FITTING",
                            style: TextStyle(
                              fontFamily: "Neusa Next Std",
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                              color: Color(0xff515c6f).withOpacity(0.50),
                            ),
                          ),
                          Text(
                            "True To Size",
                            style: TextStyle(
                              fontFamily: "Neusa Next Std",
                              fontWeight: FontWeight.w300,
                              fontSize: 14,
                              color: Color(0xff515c6f),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Center(
                            child: Text(
                              "Count: ",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: "Neusa Next Std",
                                fontSize: 15,
                                color: Color(0xff727c8e),
                              ),
                            ),
                          ),
                          Stepo(
                            // sizeList: size,
                            key: UniqueKey(),
                            width: 70, //Optional
                            backgroundColor:
                                Colors.white.withOpacity(0.5), //Optional
                            textColor: Color(0xffff6969), //Optional
                            animationDuration:
                                Duration(milliseconds: 200), //Optional
                            iconColor: Color(0xffff6969), //Optional
                            fontSize: 20, //Optional
                            iconSize: 30, //Optional
                            // initialSize: '${size[count1]}',
                            initialCounter: 2,
                            lowerBound: 10, //Optional
                            upperBound: 50, //Optional
                            onIncrementClicked: (counter) {
                              // this.count1 = ++counter;
                              this.productount = ++counter;
                              // print(productount);
                            },
                            onDecrementClicked: (counter) {
                              this.productount = --counter;
                              // print(productount);
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Stepo(
                            sizeList: size,
                            key: UniqueKey(),
                            width: 70, //Optional
                            backgroundColor:
                                Colors.white.withOpacity(0.5), //Optional
                            textColor: Color(0xffff6969), //Optional
                            animationDuration:
                                Duration(milliseconds: 200), //Optional
                            iconColor: Color(0xffff6969), //Optional
                            fontSize: 20, //Optional
                            iconSize: 30, //Optional
                            // initialSize: '${size[count1]}',
                            initialCounter: 2,
                            lowerBound: 10, //Optional
                            upperBound: 50, //Optional
                            onIncrementClicked: (counter) {
                              this.productSize = ++counter;
                              print(productSize);
                            },
                            onDecrementClicked: (counter) {
                              this.productSize = --counter;
                              print(productSize);
                            },
                          ),
                          Center(
                            child: Text(
                              " :Size",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: "Neusa Next Std",
                                fontSize: 15,
                                color: Color(0xff727c8e),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 175),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  RaisedButtonWidget(
                    buttonColor: Color(0xFFFFFFFF),
                    textColor: Color(0xffff6969),
                    buttonName: "SHARE THIS",
                    iconColor: Color(0xffff6969),
                  ),
                  RaisedButtonWidget(
                    buttonColor: Color(0xffff6969),
                    textColor: Color(0xFFFFFFFF),
                    buttonName: "ADD TO CART",
                    iconColor: Color(0xFFFFFFFF),
                    onpressed: () {
                      Product p = Product(
                          productId: pr.productId,
                          productCount: productount,
                          productImage: pr.productImage,
                          productName: pr.productName,
                          productPrice: pr.productPrice,
                          productSize: productSize);

                      Provider.of<DBProvider>(context, listen: false)
                          .insertNewTask(p);

                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (BuildContext context) => CartPage()));
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
