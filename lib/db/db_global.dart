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

  //Opcion 1
  getAllLibrosRaw() async {
    final db = await getDatabase;
    final List res = await db!.rawQuery("Select * from Libro");
    print(res);
  }

  //Opcion 2
  getAllLibros() async {
    final db = await getDatabase;
    final res = await db!.query("Libro");
    print(res);
  }

  Future<int> insertLibroRaw(int id, String desc,String autor,String url) async {
    final db = await getDatabase;
    final int res = await db!.rawInsert(
        "INSERT INTO Libro(id, descripcionLibro, autor, urlImage) VALUES ($id,'$desc','$autor','$url')");
    print(res);
    return res;
  }

  Future<int> insertLibro(int id, String desc, String autor, String url) async {
    final db = await getDatabase;
    final int res = await db!.insert(
      "Libro",
      {
        "id": id,
        "descripcionLibro": desc,
        "autor": autor,
        "urlImage": url
      },
    );
    print(res);
    return res;
  }

  updateLibroRaw() async {
    final db = await getDatabase;
    final res = await db!.rawUpdate(
        "UPDATE Libro set urlImage = 'https://bibliotecaresumen.com/wp-content/uploads/la-ciudad1.jpg' WHERE id = 2");
    print(res);
  }

  updateLibro() async {
    final db = await getDatabase;
    final res = await db!.update(
      "Libro",
      {
        "urlImage": "www.myimage.com/"
      },where: "id=3"
    );
    print(res);
  }
  
  deleteLibroRaw()async{
    final db = await getDatabase;
    final res = await db!.rawDelete("DELETE FROM Libro WHERE id = 2");
    print(res);
  }

  deleteLibro()async{
    final db = await getDatabase;
    final res = await db!.delete("Libro", where: "id = 1");
    print(res);
  }
  
}
