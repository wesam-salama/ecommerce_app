import 'package:e_commerce/providers/auth_provider.dart';
import 'package:e_commerce/providers/db_provider.dart';
import 'package:e_commerce/providers/firestore_provider.dart';
import 'package:e_commerce/ui/screens/get_started/homePageLogin.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<DBProvider>(
          create: (BuildContext context) {
            return DBProvider();
          },
        ),
        ChangeNotifierProvider<AuthProvider>(
          create: (BuildContext context) {
            return AuthProvider();
          },
        ),
        ChangeNotifierProvider<FirestoeProvider>(
          create: (BuildContext context) {
            return FirestoeProvider();
          },
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.red,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: HomePageScreen(),
      ),
    );
  }
}
