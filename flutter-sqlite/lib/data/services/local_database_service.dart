import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class LocalDatabaseService {
  static Database? _database;

  Future<void> init() async {
    databaseFactory = databaseFactoryFfi;
    final path = await getDatabasesPath();
    final dbPath = join(path, 'tasks.db');

    _database = await openDatabase(dbPath, version: 1, onCreate: (db, version) {
      debugPrint("Banco de dados criado!");
    });
  }
}
