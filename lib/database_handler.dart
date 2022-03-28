import 'package:billing_app/model/product_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHandler {
  Future<Database> initializeDB() async {
    String path = await getDatabasesPath();
    return openDatabase(
      join(path, 'product.db'),
      onCreate: (database, version) async {
        await database.execute(
          "CREATE TABLE products (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT NOT NULL,price FLOAT NOT NULL,qrCode TEXT,description TEXT,unit TEXT NOT NULL)",
        );
      },
      version: 1,
    );
  }

  Future<int> insertProduct(Product product) async {
    int result = 0;
    final Database db = await initializeDB();
    result = await db.insert('products', product.toMap());
    return result;
  }

  Future<List<Product>> retrieveProducts() async {
    final Database db = await initializeDB();
    final List<Map<String, Object?>> queryResult = await db.query('products');
    return queryResult.map((e) => Product.fromMap(e)).toList();
  }

  Future<void> deleteProduct(int id) async {
    final db = await initializeDB();
    await db.delete(
      'products',
      where: "id = ?",
      whereArgs: [id],
    );
  }

}
