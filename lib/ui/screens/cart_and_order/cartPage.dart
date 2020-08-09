import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/models/product_model.dart';
import 'package:e_commerce/providers/db_provider.dart';
import 'package:e_commerce/ui/screens/cart_and_order/checkout.dart';
import 'package:e_commerce/ui/widgets/bottomNavigationBar.dart';
import 'package:e_commerce/ui/widgets/raisedButtonWidget.dart';
import 'package:e_commerce/ui/widgets/stepoWidget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  int productount = 2;
  int productSize = 2;

  List<Product> pr;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Color(0xFFF5F6F8),
          // appBar: AppBar(
          //   backgroundColor: Colors.transparent,
          //   elevation: 0,
          // ),
          body: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        "Cart",
                        style: TextStyle(
                          fontFamily: "Neusa Next Std",
                          fontWeight: FontWeight.w700,
                          fontSize: 30,
                          color: Color(0xff515c6f),
                        ),
                      ),
                    ),
                    Container(
                      height: 602,
                      child: FutureBuilder<List<Product>>(
                        future: Provider.of<DBProvider>(context).getallOrders(),
                        builder: (BuildContext context,
                            AsyncSnapshot<List<Product>> snapshot) {
                          if (snapshot.hasData) {
                            pr = snapshot.data;

                            if (pr.length > 0) {
                              return ListView.builder(
                                itemCount: pr.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Column(
                                    children: <Widget>[
                                      Container(
                                        color: Colors.transparent,
                                        height: 130,
                                        width: double.infinity,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Container(
                                              width: 100,
                                              height: 100,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          50.0),
                                                  // shape: BoxShape.circle,
                                                  color: Colors.white,
                                                  border: Border.all(
                                                    width: 5.0,
                                                    color: Colors.white,
                                                  )),
                                              child: CachedNetworkImage(
                                                height: 95,
                                                imageUrl:
                                                    pr[index].productImage,
                                                placeholder: (context, url) =>
                                                    CircularProgressIndicator(),
                                                errorWidget:
                                                    (context, url, error) =>
                                                        Icon(Icons.error),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Text(
                                                  pr[index].productName,
                                                  style: TextStyle(
                                                    fontFamily:
                                                        "Neusa Next Std",
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
                                                  "\$${pr[index].productPrice}",
                                                  style: TextStyle(
                                                    fontFamily:
                                                        "Neusa Next Std",
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
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                          fontFamily:
                                                              "Neusa Next Std",
                                                          fontSize: 15,
                                                          color:
                                                              Color(0xff727c8e),
                                                        ),
                                                      ),
                                                    ),
                                                    Stepo(
                                                      // sizeList: size,
                                                      key: UniqueKey(),
                                                      width: 70, //Optional
                                                      backgroundColor: Colors
                                                          .white
                                                          .withOpacity(
                                                              0.5), //Optional
                                                      textColor: Color(
                                                          0xffff6969), //Optional
                                                      animationDuration: Duration(
                                                          milliseconds:
                                                              200), //Optional
                                                      iconColor: Color(
                                                          0xffff6969), //Optional
                                                      fontSize: 20, //Optional
                                                      iconSize: 30, //Optional
                                                      // initialSize: '${size[count1]}',
                                                      initialCounter: 2,
                                                      lowerBound: 10, //Optional
                                                      upperBound: 50, //Optional
                                                      onIncrementClicked:
                                                          (counter) {
                                                        // this.count1 = ++counter;
                                                        this.productount =
                                                            ++counter;
                                                        // print(productount);
                                                      },
                                                      onDecrementClicked:
                                                          (counter) {
                                                        this.productount =
                                                            --counter;
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
                                            IconButton(
                                                icon: Icon(
                                                  Icons.delete,
                                                  color: Colors.red,
                                                  size: 30,
                                                ),
                                                onPressed: () {
                                                  Provider.of<DBProvider>(
                                                          context,
                                                          listen: false)
                                                      .deleteTask(pr[index]);
                                                  print(pr.length);
                                                  // notificationListener();
                                                })
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 8,
                                      )
                                    ],
                                  );
                                },
                              );
                            } else {
                              return Center(
                                child: Text('No product'),
                              );
                            }
                          } else {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: Container(
                        height: 16,
                        width: 310,
                        // color: Colors.white,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        RaisedButtonWidget(
                          buttonColor: Color(0xffff6969),
                          textColor: Color(0xFFFFFFFF),
                          buttonName: "DELETE ALL",
                          iconColor: Color(0xFFFFFFFF),
                          onpressed: () {
                            Provider.of<DBProvider>(context, listen: false)
                                .deleteAllTasks();

                            // Navigator.of(context).push(MaterialPageRoute(
                            //     builder: (BuildContext context) =>
                            //         Checkout(pr)));
                          },
                        ),
                        RaisedButtonWidget(
                          buttonColor: Color(0xffff6969),
                          textColor: Color(0xFFFFFFFF),
                          buttonName: "CHECKOUT",
                          iconColor: Color(0xFFFFFFFF),
                          onpressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    Checkout(pr)));
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                  ],
                ),
              ),
              BottomNavigationBarWidget(),
            ],
          )),
    );
  }
}
