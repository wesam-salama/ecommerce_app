import 'package:e_commerce/models/orderFromFS.dart';
import 'package:e_commerce/models/order_model.dart';
import 'package:e_commerce/models/product_model.dart';
import 'package:e_commerce/providers/auth_provider.dart';
import 'package:e_commerce/repository/fire_store_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class FirestoeProvider extends ChangeNotifier {
  // String userId;
  // String address;
  // List<Product> products;
  // setUserId
  insertOrderToFireStore(List<Product> product, BuildContext context) async {
    List<Map> maps = product.map((e) => e.toJson()).toList();
    Map<String, dynamic> map = {};
    map['products'] = maps;
    map['userName'] = 'wesam';
    map['address'] = 'gaza';
    map['UID'] = Provider.of<AuthProvider>(context, listen: false).user.uid;
    await FireStoeRepository.fires.createOrder(map, context);
  }

  Future<List<Product>> getProduct() async {
    List<Product> product = await FireStoeRepository.fires.getProduct();
    return product;
  }

  Future<List<OrderFromFS>> getOrders(BuildContext context) async {
    List<OrderFromFS> orders =
        await FireStoeRepository.fires.getOrders(context);
    return orders;
  }
}
