import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/models/product_model.dart';

import 'order_model.dart';

class OrderFromFS {
  List<Map<String, dynamic>> products;
  String address;
  String userName;
  String uID;

  OrderFromFS({this.products, this.address, this.userName, this.uID});

  OrderFromFS.fromJson(DocumentSnapshot snapshot) {
    this.address = snapshot.data['address'];
    this.userName = snapshot.data['userName'];
    this.uID = snapshot.data['uID'];
    this.products = List<Map<String, dynamic>>();

    snapshot.data['products'].forEach((v) {
      products.add(Product.fromJson(v).toJson());
    });

    // if (json['products'] != null) {
    //   products = new List<Products>();
    //   json['products'].forEach((v) {
    //     products.add(new Products.fromJson(v));
    //   });
    // }
    // address = json['address'];
    // userName = json['userName'];
    // uID = json['UID'];
  }

  Map<String, dynamic> toJson() {}
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   if (this.products != null) {
  //     data['products'] = this.products.map((v) => v.toJson()).toList();
  //   }
  //   data['address'] = this.address;
  //   data['userName'] = this.userName;
  //   data['UID'] = this.uID;
  //   return data;
  // }
}
