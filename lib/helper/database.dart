import 'dart:io';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart'
    show Database, getDatabasesPath, openDatabase;

class DatabaseService {
  late Database db;

  Future<String> _getDatabasePath(String dbName) async {
    var databasePath = await getDatabasesPath();
    var path = join(databasePath, dbName);

    if (await Directory(dirname(path)).exists()) {
    } else {
      await Directory(dirname(path)).create(recursive: true);
    }
    return path;
  }

  Future<void> initDatabase() async {
    var path = await _getDatabasePath('todolist.db');
    db = await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future<void> _onCreate(Database db, int version) async {
    _createUser(db);
  }

  Future<void> _createUser(Database db) async {
    const sqlUser = '''
      CREATE TABLE users (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        email TEXT,
        nohp TEXT,
        created_at TEXT,
        updated_at TEXT
      )
    ''';

    await db.transaction((txn) async {
      await txn.execute(sqlUser);
    });
  }
}
