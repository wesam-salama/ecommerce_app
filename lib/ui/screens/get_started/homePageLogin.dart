import 'package:e_commerce/ui/screens/get_started/login.dart';
import 'package:e_commerce/ui/screens/get_started/signup.dart';
import 'package:flutter/material.dart';

class HomePageScreen extends StatefulWidget {
  @override
  _HomePageScreenState createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  // static int index = 0;
  // Widget chooseTheScreen() {
  //   if (index == 0) {
  //     return Signin();
  //   } else if (index == 1) {
  //     return Login();
  //   } else if (index == 2) {
  //     return ForgetPassword();
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          resizeToAvoidBottomPadding: false,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            bottom: TabBar(
                indicatorSize: TabBarIndicatorSize.tab,
                unselectedLabelColor: Color(0xff515c6f),
                labelColor: Color(0xffff6969),
                tabs: [
                  Tab(
                    child: Text(
                      'SIGN UP',
                      style: TextStyle(
                        fontFamily: "Neusa Next Std",
                        fontWeight: FontWeight.w700,
                        fontSize: 15,
                        // color: Color(0xff515c6f),
                      ),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'SIGN IN',
                      style: TextStyle(
                        fontFamily: "Neusa Next Std",
                        fontWeight: FontWeight.w700,
                        fontSize: 15,
                        // color: Color(0xff515c6f),
                      ),
                    ),
                  ),
                ]),
          ),
          body: Padding(
            padding: const EdgeInsets.only(top: 80),
            child: TabBarView(
              children: <Widget>[
                Signin(),
                Login(),
              ],
            ),
          ),

          // Column(
          //   mainAxisAlignment: MainAxisAlignment.start,
          //   children: <Widget>[
          //     Container(
          //         padding: EdgeInsets.only(top: 100), child: chooseTheScreen())
          //   ],
          // ),
        ),
      ),
    );
  }
}
