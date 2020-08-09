import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBClient {
  DBClient._();
  static final DBClient dbClient = DBClient._();
  Database database;

  final String productTableName = 'products';
  final String idColumn = 'id';
  final String productIdColumn = 'productId';
  final String productImageColumn = 'productImage';
  final String productNameColumn = 'productName';
  final String productPriceColumn = 'productPrice';
  final String productCountColumn = 'productCount';
  final String productSizeColumn = 'productSize';

  initDatabase() async {
    if (database == null) {
      database = await connectToDatabase();
      return database;
    } else {
      return database;
    }
  }

  Future<Database> connectToDatabase() async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String path = join(appDocDir.path, "productDb.db");
    Database database = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        db.execute('''CREATE TABLE $productTableName(
          $idColumn INTEGER PRIMARY KEY AUTOINCREMENT,
          $productIdColumn TEXT NOT NULL,
          $productImageColumn TEXT NOT NULL,
          $productNameColumn TEXT NOT NULL,
          $productPriceColumn INTEGER NOT NULL,
          $productCountColumn INTEGER NOT NULL,
          $productSizeColumn INTEGER NOT NULL
        )''');
      },
    );
    return database;
  }

  Future<int> insertNewProduct(Map<String, dynamic> map) async {
    try {
      database = await initDatabase();
      int rowIndex = await database.insert(productTableName, map);
      print(rowIndex);
      return rowIndex;
    } catch (error) {
      throw 'database error form insert function $error';
    }
  }

  Future<List<Map<String, dynamic>>> getAllProducts() async {
    try {
      database = await initDatabase();
      List<Map<String, dynamic>> results =
          await database.query(productTableName);
      return results;
    } catch (error) {
      throw 'database error $error';
    }
  }

  deleteProduct(int id) async {
    try {
      database = await initDatabase();
      int rows = await database
          .delete(productTableName, where: '$idColumn = ?', whereArgs: [id]);
      return rows;
    } catch (error) {
      throw 'database error $error';
    }
  }

  deleteAllProducts() async {
    try {
      database = await initDatabase();
      int rows = await database.delete(productTableName);
      return rows;
    } catch (error) {
      throw 'database error $error';
    }
  }

  // Future<List<Map<String, dynamic>>> getCompleteTasks() async {
  //   try {
  //     database = await initDatabase();
  //     List<Map<String, dynamic>> results = await database.query(taskTableName,
  //         where: '$taskIsCompleteColumn = ?', whereArgs: [1]);
  //     return results;
  //   } catch (error) {
  //     throw 'database error $error';
  //   }
  // }

  // Future<List<Map<String, dynamic>>> getInCompleteTasks() async {
  //   try {
  //     database = await initDatabase();
  //     List<Map<String, dynamic>> results = await database.query(taskTableName,
  //         where: '$taskIsCompleteColumn = ?', whereArgs: [0]);
  //     return results;
  //   } catch (error) {
  //     throw 'database error $error';
  //   }
  // }

  // Future<int> updateTask(Map<String, dynamic> map, int id) async {
  //   try {
  //     database = await initDatabase();
  //     int rows = await database.update(taskTableName, map,
  //         where: '$taskIdColumn = ?', whereArgs: [id]);
  //     return rows;
  //   } catch (error) {
  //     throw 'database error $error';
  //   }
  // }

}
