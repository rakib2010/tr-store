import 'package:sqflite_common_ffi/sqflite_ffi.dart'; 
import 'package:path/path.dart';




class DBHelper {
  static Future<Database> initializeDatabase() async {
    
    databaseFactory = databaseFactoryFfi;

    final String path = join(await getDatabasesPath(), 'tr_store.db');

    return openDatabase(
      path,
      version: 1,
      onCreate: (database, version) async {
        await database.execute('''
          CREATE TABLE IF NOT EXISTS cart (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            productId INTEGER,
            quantity INTEGER
          )
        ''');
      },
    );
  }
}