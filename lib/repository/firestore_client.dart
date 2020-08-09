import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/providers/auth_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class FSClient {
  FSClient._();

  static FSClient glient = FSClient._();
  createUser(FirebaseUser userFirebase, Map<String, dynamic> map) async {
    await Firestore.instance
        .collection('Users')
        .document(userFirebase.uid)
        .setData(map);
  }

  Future<DocumentSnapshot> getUser(FirebaseUser userFirebase) async {
    DocumentSnapshot documentSnapshot = await Firestore.instance
        .collection('Users')
        .document(userFirebase.uid)
        .get();
    return documentSnapshot;
  }

  createOrder(Map productMap, BuildContext context) {
    Firestore.instance.collection('Order').add(productMap);
    // print(Provider.of<AuthProvider>(context, listen: false).user.uid);
    // Firestore.instance
    //     .collection('Order')
    //     .document(
    //       Provider.of<AuthProvider>(context, listen: false).user.uid,
    //     )
    //     .setData(productMap);
  }

  Future<QuerySnapshot> getProduct() async {
    QuerySnapshot q =
        await Firestore.instance.collection('Product').getDocuments();
    return q;
  }

  Future<QuerySnapshot> getOeders(BuildContext context) async {
    QuerySnapshot q = await Firestore.instance
        .collection('Order')
        .where('UID',
            isEqualTo:
                Provider.of<AuthProvider>(context, listen: false).user.uid)
        .getDocuments();
    return q;
  }
}
