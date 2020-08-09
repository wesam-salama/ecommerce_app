import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/repository/db_client.dart';

class Product {
  // String title;
  // bool isComplete;

  int id;
  String productId;
  String productImage;
  String productName;
  int productPrice;
  int productCount;
  int productSize;
  String sku;
  String brand;

  Product(
      {this.productId,
      this.productImage,
      this.productName,
      this.productPrice,
      this.productCount,
      this.productSize,
      this.brand,
      this.sku});

  Product.fromJson(Map<String, dynamic> map) {
    this.id = map[DBClient.dbClient.idColumn];
    this.productId = map[DBClient.dbClient.productIdColumn];
    this.productImage = map[DBClient.dbClient.productImageColumn];
    this.productName = map[DBClient.dbClient.productNameColumn];
    this.productPrice = map[DBClient.dbClient.productPriceColumn];
    this.productCount = map[DBClient.dbClient.productCountColumn];
    this.productSize = map[DBClient.dbClient.productSizeColumn];
  }

  Product.fromDocumet(DocumentSnapshot snapshot) {
    // this.id = snapshot.documentID;
    this.productId = snapshot.documentID;
    // this.productId = snapshot.data[DBClient.dbClient.productIdColumn];
    this.productImage = snapshot.data[DBClient.dbClient.productImageColumn];
    this.productName = snapshot.data[DBClient.dbClient.productNameColumn];
    this.productPrice = snapshot.data[DBClient.dbClient.productPriceColumn];
    this.productCount = snapshot.data[DBClient.dbClient.productCountColumn];
    this.productSize = snapshot.data[DBClient.dbClient.productSizeColumn];
    this.brand = snapshot.data['brand'];
    this.sku = snapshot.data['SKU'];
  }
  Map<String, dynamic> toJson() {
    return {
      DBClient.dbClient.productIdColumn: this.productId,
      DBClient.dbClient.productImageColumn: this.productImage,
      DBClient.dbClient.productNameColumn: this.productName,
      DBClient.dbClient.productPriceColumn: this.productPrice,
      DBClient.dbClient.productCountColumn: this.productCount,
      DBClient.dbClient.productSizeColumn: this.productSize,
    };
  }
}
