import 'package:e_commerce/models/orderFromFS.dart';
import 'package:e_commerce/models/order_model.dart';
import 'package:e_commerce/providers/firestore_provider.dart';
import 'package:e_commerce/ui/widgets/bottomNavigationBar.dart';
import 'package:e_commerce/ui/widgets/odrersCart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrdersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFF5F6F8),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                  right: 16, left: 32, top: 16, bottom: 25),
              child: Text(
                "Orders",
                style: TextStyle(
                  fontFamily: "Neusa Next Std",
                  fontWeight: FontWeight.w700,
                  fontSize: 30,
                  color: Color(0xff515c6f),
                ),
              ),
            ),
            Expanded(
              child: Container(
                height: 275,
                padding: EdgeInsets.all(8),
                color: Colors.transparent,

                child: FutureBuilder<List<OrderFromFS>>(
                  future:
                      Provider.of<FirestoeProvider>(context).getOrders(context),
                  builder: (BuildContext context,
                      AsyncSnapshot<List<OrderFromFS>> snapshot) {
                    if (snapshot.hasData) {
                      List<OrderFromFS> pr = snapshot.data;

                      // return Container();

                      if (pr.length > 0) {
                        return GridView.builder(
                          itemCount: pr.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 0.9,
                            crossAxisCount: 2,
                            crossAxisSpacing: 8,
                            mainAxisSpacing: 8,
                          ),
                          itemBuilder: (BuildContext context, int index) {
                            return OrderCart(pr[index]);
                          },
                        );
                      } else {
                        return Center(
                          child: Text('No orders'),
                        );
                      }
                    } else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),

                // child: GridView.count(
                //   childAspectRatio: 0.9,
                //   crossAxisCount: 2,
                //   crossAxisSpacing: 8,
                //   mainAxisSpacing: 8,
                //   children: <Widget>[
                //     CategoriesCart(),
                //     CategoriesCart(),
                //     CategoriesCart(),
                //     CategoriesCart(),
                //   ],
                // ),
              ),
            ),
            BottomNavigationBarWidget(),
          ],
        ),
      ),
    );
  }
}
