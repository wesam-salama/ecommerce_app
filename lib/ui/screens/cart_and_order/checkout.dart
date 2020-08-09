import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/models/product_model.dart';
import 'package:e_commerce/providers/auth_provider.dart';
import 'package:e_commerce/providers/db_provider.dart';
import 'package:e_commerce/providers/firestore_provider.dart';
import 'package:e_commerce/ui/screens/cart_and_order/successOrder.dart';
import 'package:e_commerce/ui/widgets/raisedButtonWidget.dart';
import 'package:e_commerce/ui/widgets/stepoWidget.dart';
import 'package:e_commerce/ui/widgets/textFormField.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class Checkout extends StatelessWidget {
  int productount = 2;
  int productSize = 2;
  String username;
  String streetNum;
  String city;
  String contry;

  List<Product> pr;
  Checkout(this.pr);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
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
        body: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 15, right: 15, bottom: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Checkout",
                    style: TextStyle(
                      fontFamily: "Neusa Next Std",
                      fontWeight: FontWeight.w700,
                      fontSize: 30,
                      color: Color(0xff515c6f),
                    ),
                  ),
                  SizedBox(
                    height: 17,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "SHIPPING ADDRESS",
                              style: TextStyle(
                                fontFamily: "Neusa Next Std",
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                                color: Color(0xff515c6f).withOpacity(0.50),
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              "${Provider.of<AuthProvider>(context).username}\n${Provider.of<AuthProvider>(context).streetNum},\n${Provider.of<AuthProvider>(context).city},\n${Provider.of<AuthProvider>(context).contry}",
                              style: TextStyle(
                                fontFamily: "Neusa Next Std",
                                fontSize: 15,
                                color: Color(0xff515c6f),
                              ),
                            )
                          ],
                        ),
                        IconButton(
                            icon: FaIcon(
                              FontAwesomeIcons.arrowAltCircleRight,
                              color: Colors.grey,
                            ),
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      content: Stack(
                                        overflow: Overflow.visible,
                                        children: <Widget>[
                                          Positioned(
                                            right: -40.0,
                                            top: -40.0,
                                            child: InkResponse(
                                              onTap: () {
                                                Navigator.of(context).pop();
                                              },
                                              child: CircleAvatar(
                                                child: Icon(Icons.close),
                                                backgroundColor: Colors.red,
                                              ),
                                            ),
                                          ),
                                          Form(
                                            key: Provider.of<AuthProvider>(
                                                    context)
                                                .formKeyaddress,
                                            child: Container(
                                              height: 345,
                                              child: ListView(
                                                // mainAxisSize: MainAxisSize.min,
                                                children: <Widget>[
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.all(8.0),
                                                    child: TextFormFieldCustom(
                                                      labelText: 'Username',
                                                      icon:
                                                          Icons.person_outline,
                                                      obscureText: false,
                                                      validationFunc: Provider
                                                              .of<AuthProvider>(
                                                                  context)
                                                          .validatorAddress,
                                                      savedForm: Provider.of<
                                                                  AuthProvider>(
                                                              context)
                                                          .getUsername,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.all(8.0),
                                                    child: TextFormFieldCustom(
                                                      labelText:
                                                          'Street number',
                                                      icon:
                                                          Icons.person_outline,
                                                      obscureText: false,
                                                      validationFunc: Provider
                                                              .of<AuthProvider>(
                                                                  context)
                                                          .validatorAddress,
                                                      savedForm: Provider.of<
                                                                  AuthProvider>(
                                                              context)
                                                          .getStreetNum,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.all(8.0),
                                                    child: TextFormFieldCustom(
                                                      labelText: 'City',
                                                      icon:
                                                          Icons.person_outline,
                                                      obscureText: false,
                                                      validationFunc: Provider
                                                              .of<AuthProvider>(
                                                                  context)
                                                          .validatorAddress,
                                                      savedForm: Provider.of<
                                                                  AuthProvider>(
                                                              context)
                                                          .getCity,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.all(8.0),
                                                    child: TextFormFieldCustom(
                                                      labelText: 'Country',
                                                      icon:
                                                          Icons.person_outline,
                                                      obscureText: false,
                                                      validationFunc: Provider
                                                              .of<AuthProvider>(
                                                                  context)
                                                          .validatorAddress,
                                                      savedForm: Provider.of<
                                                                  AuthProvider>(
                                                              context)
                                                          .getContry,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: RaisedButton(
                                                        child:
                                                            Text("Add address"),
                                                        onPressed: () =>
                                                            Provider.of<
                                                                AuthProvider>(
                                                              context,
                                                              listen: false,
                                                            ).submetaddress(
                                                                context)),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  });
                            }),
                      ]),
                  SizedBox(
                    height: 19,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Container(
                      height: 0.5,
                      width: 310,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "ITEMS",
                        style: TextStyle(
                          fontFamily: "Neusa Next Std",
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                          color: Color(0xff515c6f).withOpacity(0.50),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        width: double.infinity,
                        height: 354,
                        child: ListView.builder(
                            itemCount: pr.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Row(children: <Widget>[
                                Container(
                                  width: 69,
                                  height: 69,
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
                                    imageUrl: pr[index].productImage,
                                    placeholder: (context, url) =>
                                        CircularProgressIndicator(),
                                    errorWidget: (context, url, error) =>
                                        Icon(Icons.error),
                                  ),
                                ),
                                SizedBox(
                                  width: 25.4,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      pr[index].productName,
                                      style: TextStyle(
                                        fontFamily: "Neusa Next Std",
                                        fontWeight: FontWeight.w700,
                                        fontSize: 15,
                                        color: Color(0xff515c6f),
                                      ),
                                    ),
                                    Text(
                                      'Size: ${pr[index].productSize}',
                                      style: TextStyle(
                                        fontFamily: "Neusa Next Std",
                                        fontWeight: FontWeight.w300,
                                        fontSize: 15,
                                        color: Color(0xff515c6f),
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          "\$${pr[index].productPrice}",
                                          style: TextStyle(
                                            fontFamily: "Neusa Next Std",
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15,
                                            color: Color(0xffff6969),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 50,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: <Widget>[
                                            // Center(
                                            //   child: Text(
                                            //     "Count: ",
                                            //     textAlign: TextAlign.center,
                                            //     style: TextStyle(
                                            //       fontFamily: "Neusa Next Std",
                                            //       fontSize: 15,
                                            //       color: Color(0xff727c8e),
                                            //     ),
                                            //   ),
                                            // ),
                                            Stepo(
                                              // sizeList: size,
                                              key: UniqueKey(),
                                              width: 90, //Optional
                                              backgroundColor: Colors.white
                                                  .withOpacity(0.5), //Optional
                                              textColor:
                                                  Color(0xffff6969), //Optional
                                              animationDuration: Duration(
                                                  milliseconds: 200), //Optional
                                              iconColor:
                                                  Color(0xffff6969), //Optional
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
                                        //     height: 0.5,
                                        //     width: 195,
                                        //     color: Colors.grey,
                                        //   ),
                                        // ),

                                        // Text(
                                        //   "Message to seller (optional)",
                                        //   style: TextStyle(
                                        //     fontFamily: "Neusa Next Std",
                                        //     fontSize: 14,
                                        //     color: Color(0xff515c6f)
                                        //         .withOpacity(0.60),
                                        //   ),
                                        // )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 11,
                                    ),
                                  ],
                                )
                              ]);
                            }),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Container(
                      height: 0.5,
                      width: 310,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          FaIcon(
                            FontAwesomeIcons.tag,
                            color: Color(0xffff6969),
                            size: 22,
                          ),
                          SizedBox(
                            width: 13,
                          ),
                          Text(
                            "Add Promo Code",
                            style: TextStyle(
                              fontFamily: "Neusa Next Std",
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                              color: Color(0xffff6969),
                            ),
                          ),
                        ],
                      ),
                      IconButton(
                          icon: FaIcon(
                            FontAwesomeIcons.arrowAltCircleRight,
                            color: Colors.grey,
                          ),
                          onPressed: () {}),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              height: 95,
              width: double.infinity,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "TOTAL",
                            style: TextStyle(
                              fontFamily: "Neusa Next Std",
                              fontWeight: FontWeight.w500,
                              fontSize: 10,
                              color: Color(0xff515c6f).withOpacity(0.50),
                            ),
                          ),
                          Text(
                            "\$11.00",
                            style: TextStyle(
                              fontFamily: "Neusa Next Std",
                              fontWeight: FontWeight.w700,
                              fontSize: 20,
                              color: Color(0xff515c6f),
                            ),
                          ),
                          Text(
                            "Free Domestic Shipping",
                            style: TextStyle(
                              fontFamily: "Neusa Next Std",
                              fontSize: 12,
                              color: Color(0xff727c8e),
                            ),
                          )
                        ]),
                    RaisedButtonWidget(
                      buttonColor: Color(0xffff6969),
                      textColor: Color(0xFFFFFFFF),
                      buttonName: "PLACE ORDER",
                      iconColor: Color(0xFFFFFFFF),
                      onpressed: () {
                        Provider.of<FirestoeProvider>(context, listen: false)
                            .insertOrderToFireStore(pr, context);

                        Provider.of<DBProvider>(context, listen: false)
                            .deleteAllTasks();

                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext context) => SuccessOrder()));
                      },
                    ),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
