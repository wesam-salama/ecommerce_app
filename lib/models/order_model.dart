import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/repository/db_client.dart';

class Order {
  // String title;
  // bool isComplete;

  int id;
  String orderId;
  String orderImage;
  String orderName;
  int orderPrice;
  int orderCount;
  int orderSize;
  String ordersku;
  String orderbrand;

  Order(
      {this.orderId,
      this.orderImage,
      this.orderName,
      this.orderPrice,
      this.orderCount,
      this.orderSize,
      this.ordersku,
      this.orderbrand});

  // Order.fromJson(Map<String, dynamic> map) {
  //   this.id = map[DBClient.dbClient.idColumn];
  //   this.productId = map[DBClient.dbClient.productIdColumn];
  //   this.productImage = map[DBClient.dbClient.productImageColumn];
  //   this.productName = map[DBClient.dbClient.productNameColumn];
  //   this.productPrice = map[DBClient.dbClient.productPriceColumn];
  //   this.productCount = map[DBClient.dbClient.productCountColumn];
  //   this.productSize = map[DBClient.dbClient.productSizeColumn];
  // }

  Order.fromDocumet(DocumentSnapshot snapshot) {
    // this.id = snapshot.documentID;
    this.orderId = snapshot.documentID;
    // this.productId = snapshot.data[DBClient.dbClient.productIdColumn];
    this.orderImage = snapshot.data[DBClient.dbClient.productImageColumn];
    this.orderName = snapshot.data[DBClient.dbClient.productNameColumn];
    this.orderPrice = snapshot.data[DBClient.dbClient.productPriceColumn];
    this.orderCount = snapshot.data[DBClient.dbClient.productCountColumn];
    this.orderSize = snapshot.data[DBClient.dbClient.productSizeColumn];
    this.ordersku = snapshot.data['brand'];
    this.orderbrand = snapshot.data['SKU'];
  }
  Map<String, dynamic> toJson() {
    return {
      DBClient.dbClient.productIdColumn: this.orderId,
      DBClient.dbClient.productImageColumn: this.orderImage,
      DBClient.dbClient.productNameColumn: this.orderName,
      DBClient.dbClient.productPriceColumn: this.orderPrice,
      DBClient.dbClient.productCountColumn: this.orderCount,
      DBClient.dbClient.productSizeColumn: this.orderSize,
    };
  }
}
