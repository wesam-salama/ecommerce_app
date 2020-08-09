import 'package:e_commerce/models/product_model.dart';
import 'package:e_commerce/repository/db_repository.dart';
import 'package:flutter/material.dart';

class DBProvider extends ChangeNotifier {
  List<Product> allProducts = [];

  Future<List<Product>> setAllLists() async {
    List<Product> products = await DBRepository.dbRepository.getAllProduct();
    this.allProducts = products;
    // this.completeTasks = await DBRepository.dbRepository.getCompleteData();
    // this.inCompleteTasks = await DBRepository.dbRepository.getInCompleteData();
    notifyListeners();

    return products;
  }

  insertNewTask(Product product) async {
    await DBRepository.dbRepository.insertNewProduct(product);
    setAllLists();
  }

  Future<List<Product>> getallOrders() async {
    List<Product> p = await DBRepository.dbRepository.getAllProduct();

    return p;
  }

  // updateTask(Task task) async {
  //   await DBRepository.dbRepository.updateTask(task);
  //   setAllLists();
  // }

  deleteTask(Product product) async {
    await DBRepository.dbRepository.deleteProduct(product);
    setAllLists();
  }

  deleteAllTasks() async {
    await DBRepository.dbRepository.deleteAllProducts();
    setAllLists();
  }
}
