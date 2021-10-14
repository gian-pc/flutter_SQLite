import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBGlobalManager {
  static Database? _mydatabase;
  static final DBGlobalManager db = DBGlobalManager._();
  DBGlobalManager._();

  // Saber y obtener una base de datos existentes
  Future<Database?> get getDatabase async {
    if (_mydatabase != null) return _mydatabase;
    _mydatabase = await initDB(); // Método para crear la base de datos
    return _mydatabase;
  }

  Future<Database> initDB() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentDirectory.path, "BibliotecaDB.db");
    return await openDatabase(
      path,
      version: 1,
      onOpen: (db) {},
      onCreate: (Database db, int version) async {
        await db.execute(
            "CREATE TABLE Libro(id INTEGER PRIMARY KEY,descripcionLibro TEXT,autor TEXT, urlImage TEXT)");
      },
    );
  }
  insertLibroRaw() async{
    final db = await getDatabase;
    final int res = await db!.rawInsert("INSERT INTO Libro(id, descripcionLibro, autor, urlImage) VALUES (1,'La Fiesta del Chivo','Mario Vargas Llosa','https://images-na.ssl-images-amazon.com/images/I/51RQv5UxNgL._SX304_BO1,204,203,200_.jpg')");
    print(res);
    return res;
  }
}

