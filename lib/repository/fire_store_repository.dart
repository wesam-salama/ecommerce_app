import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/models/orderFromFS.dart';
import 'package:e_commerce/models/order_model.dart';
import 'package:e_commerce/models/product_model.dart';
import 'package:e_commerce/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import 'firestore_client.dart';

class FireStoeRepository {
  FireStoeRepository._();
  static FireStoeRepository fires = FireStoeRepository._();

  createUser(FirebaseUser userFirebase, User user) async {
    await FSClient.glient.createUser(userFirebase, user.toJson());
  }

  Future<User> getUser(FirebaseUser userFirebase) async {
    DocumentSnapshot documentSnapshot =
        await FSClient.glient.getUser(userFirebase);

    User user = User.fromJson(documentSnapshot);
    return user;
  }

  createOrder(Map product, BuildContext context) async {
    await FSClient.glient.createOrder(product, context);
  }

  Future<List<Product>> getProduct() async {
    QuerySnapshot q = await FSClient.glient.getProduct();

    List<Product> product =
        q.documents.map((e) => Product.fromDocumet(e)).toList();
    return product;
  }

  Future<List<OrderFromFS>> getOrders(BuildContext context) async {
    QuerySnapshot q = await FSClient.glient.getOeders(context);
    // print(json.encode(q.documents.first.data));

    List<OrderFromFS> orders =
        q.documents.map((e) => OrderFromFS.fromJson(e)).toList();
    return orders;
  }
}
