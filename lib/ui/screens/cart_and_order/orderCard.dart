import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/models/orderFromFS.dart';
import 'package:e_commerce/ui/widgets/stepoWidget.dart';
import 'package:flutter/material.dart';

class OrderCard extends StatelessWidget {
  OrderFromFS pr;
  OrderCard(this.pr);
  int productount;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: pr.products.length,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: <Widget>[
              SizedBox(
                height: 25,
              ),
              Container(
                color: Colors.transparent,
                height: 130,
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50.0),
                          // shape: BoxShape.circle,
                          color: Colors.white,
                          border: Border.all(
                            width: 5.0,
                            color: Colors.white,
                          )),
                      child: CachedNetworkImage(
                        height: 95,
                        imageUrl: pr.products[index]['productImage'],
                        placeholder: (context, url) =>
                            CircularProgressIndicator(),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          pr.products[index]['productName'],
                          style: TextStyle(
                            fontFamily: "Neusa Next Std",
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                            color: Color(0xff515c6f),
                          ),
                        ),
                        // Text(
                        //   pr[index].brand,
                        //   style: TextStyle(
                        //     fontFamily:
                        //         "Neusa Next Std",
                        //     fontWeight: FontWeight.w300,
                        //     fontSize: 15,
                        //     color: Color(0xff515c6f),
                        //   ),
                        // ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "\$${pr.products[index]['productPrice']}",
                          style: TextStyle(
                            fontFamily: "Neusa Next Std",
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                            color: Color(0xffff6969),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
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
                        // Padding(
                        //   padding: EdgeInsets.symmetric(
                        //       horizontal: 10.0),
                        //   child: Container(
                        //     height: 2.0,
                        //     width: 186,
                        //     color: Colors.white,
                        //   ),
                        // ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
