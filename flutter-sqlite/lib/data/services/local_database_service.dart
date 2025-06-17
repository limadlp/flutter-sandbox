import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqlite_offline/domain/models/task/task.dart';

class LocalDatabaseService {
  static Database? _database;

  Future<void> init() async {
    print('veio aqui');
    final path = await getDatabasesPath();
    final dbPath = join(path, 'tasks.db');
    //await deleteDatabase(dbPath);
    _database = await openDatabase(dbPath, version: 1, onCreate: (db, version) {
      debugPrint("Banco de dados criado!");
      db.execute('''
        CREATE TABLE Tasks(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          title TEXT NOT NULL,
          description TEXT,
          category TEXT,
          isCompleted INTEGER DEFAULT 0
        )
      ''');
      debugPrint("Tabela Tasks criada!");
      print("veio aqui tambẽm");
    });
  }

  Future<int?> createTask(Task task) async {
    final id = await _database?.insert('Tasks', task.toMap());
    debugPrint("Task created with id: $id");
    return id;
  }
}
