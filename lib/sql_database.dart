import 'dart:developer';

import 'package:agenda_project/src/models/usuario.dart';
import 'package:sqflite/sqflite.dart';

class SQLDataBase {
  late Database _db;

  static Future<void> createTables(Database database) async {
    database.execute("""CREATE TABLE users(
                              id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
                              email TEXT,
                              name TEXT,
                              password TEXT,
                              createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
                            )
        """);
  }

  static Future<Database> db() async {
    return await openDatabase(
      'my_db.db',
      version: 1,
      onCreate: (Database database, int version) async {
        await createTables(database);
      },
    );
  }

  static Future<int> saveUsuario(Usuario usuario) async {
    final db = await SQLDataBase.db();
    final id = await db.insert('users', usuario.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    return id;
  }

  static Future<List<Map<String, dynamic>>> listUsuarios() async {
    final db = await SQLDataBase.db();
    return db.query('users', orderBy: 'id');
  }

  static Future<List<Map<String, dynamic>>> getUsuarioToMail(
      String mail, String password) async {
    final db = await SQLDataBase.db();
    return db.query('users',
        where: 'mail = ? and password=?',
        orderBy: 'id',
        whereArgs: [mail, password]);
  }
}
