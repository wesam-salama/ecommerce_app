import 'package:e_commerce/models/product_model.dart';
import 'package:e_commerce/repository/db_client.dart';

class DBRepository {
  DBRepository._();
  static final DBRepository dbRepository = DBRepository._();

  insertNewProduct(Product product) async {
    await DBClient.dbClient.insertNewProduct(product.toJson());
  }

  Future<List<Product>> getAllProduct() async {
    List<Map<String, dynamic>> results =
        await DBClient.dbClient.getAllProducts();
    List<Product> tasks = results.map((e) => Product.fromJson(e)).toList();
    return tasks;
  }

  Future<int> deleteProduct(Product product) async {
    int x = await DBClient.dbClient.deleteProduct(product.id);
    return x;
  }

  deleteAllProducts() async {
    await DBClient.dbClient.deleteAllProducts();
  }

  // Future<List<Task>> getCompleteData() async {
  //   List<Map<String, dynamic>> results =
  //   await DBClient.dbClient.getCompleteTasks();
  //   List<Task> tasks = results.map((e) => Task.fromJson(e)).toList();
  //   return tasks;
  // }

  // Future<List<Task>> getInCompleteData() async {
  //   List<Map<String, dynamic>> results =
  //   await DBClient.dbClient.getInCompleteTasks();
  //   List<Task> tasks = results.map((e) => Task.fromJson(e)).toList();
  //   return tasks;
  // }

  // Future<int> updateTask(Task task) async {
  //   task.toggleTask();
  //   int x = await DBClient.dbClient.updateTask(task.toJson(), task.id);
  //   return x;
  // }

}
