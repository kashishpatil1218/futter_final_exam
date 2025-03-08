import 'dart:developer';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as path;

import '../core/task_modal.dart';

class DbServices {
  // SINGLE TONE OBJECT
  DbServices._();

  static final DbServices dbServices = DbServices._();
  Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    } else {
      _database = await initDatabase();
      return _database!;
    }
  }

  // DELETE DATABASE
  Future<void> deleteDb() async {
    final filePath = await getDatabasesPath();
    final dbPath = path.join(filePath, 'myDb.db');
    await deleteDatabase(dbPath);
  }

  // INIT DATABASE
  Future<Database> initDatabase() async {
    final filePath = await getDatabasesPath();
    final dbPath = path.join(filePath, 'myDb.db');

    return await openDatabase(
      dbPath,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''CREATE TABLE tasks (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            title TEXT NOT NULL,
            description TEXT,
            status INTEGER NOT NULL DEFAULT 0,
            dueDate TEXT,
            priority TEXT
          )''');
      },
    );
  }

  // INSERT
  Future<void> insertRecord(Task task) async {
    final db = await database;
    int result = await db.insert('tasks', Task.toMap(task),
        conflictAlgorithm: ConflictAlgorithm.replace);
    log(result == 0 ? "Failed to insert!!!!" : "inserted...");
  }

  // UPDATE
  Future<void> updateRecord(Task task) async {
    final db = await database;
    await db.update(
      'tasks',
      Task.toMap(task),
      where: 'id = ?',
      whereArgs: [task.id],
    );
  }

  // DELETE
  Future<void> deleteRecord(int id) async {
    final db = await database;
    await db.delete('tasks', where: 'id = ?', whereArgs: [id]);
  }

  // TODO : READ
  Future<List<Map<String, dynamic>>> fetchAllRecord() async {
    final db = await database;
    return await db.query('tasks');
  }
}
