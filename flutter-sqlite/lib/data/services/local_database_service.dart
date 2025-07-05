import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqlite_offline/domain/models/task/task.dart';

class LocalDatabaseService {
  static Database? _database;

  Future<void> init() async {
    final path = await getDatabasesPath();
    final dbPath = join(path, 'tasks.db');
    //await deleteDatabase(dbPath);
    _database =
        await openDatabase(dbPath, version: 3, onCreate: (db, version) async {
      debugPrint("Banco de dados criado!");
      await db.execute('''
        CREATE TABLE Tasks(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          title TEXT NOT NULL,
          description TEXT,
          category TEXT,
          isCompleted INTEGER DEFAULT 0
        )
      ''');

      debugPrint("Tabela Tasks criada!");

      if (version >= 2) {
        await addPriorityColumnToTasks(db);
      }

      if (version >= 3) {
        await createResponsibileTable(db);
      }
    }, onUpgrade: (db, oldVersion, newVersion) async {
      if (oldVersion < 2) {
        await addPriorityColumnToTasks(db);
      }
      if (oldVersion < 3) {
        await createResponsibileTable(db);
        debugPrint("Tabela responsibles criada!");
      }
    }, onDowngrade: (db, oldVersion, newVersion) {
      debugPrint("Downgrading from version $oldVersion to $newVersion");
    });
  }

  Future<void> addPriorityColumnToTasks(Database db) async {
    await db.execute(
      'ALTER TABLE Tasks ADD COLUMN priority TEXT DEFAULT "medio"',
    );
    debugPrint("Priority column added to Tasks table.");
  }

  Future<void> createResponsibileTable(Database db) async {
    await db.execute(
      '''CREATE TABLE responsibles (
              id INTEGER PRIMARY KEY AUTOINCREMENT,
              name TEXT NOT NULL
          )''',
    );
    debugPrint("Responsibles table created.");
    await db.execute(
      'ALTER TABLE tasks ADD COLUMN responsibleId INTEGER REFERENCES responsibiles(id)',
    );
    debugPrint("responsibleId column added to Tasks table.");
  }

  Future<int?> createTask(Task task) async {
    int? responsibleId;
    if (task.responsibleName != null) {
      final responsibles = await _database?.query(
        'responsibles',
        where: 'name LIKE ?',
        whereArgs: [task.responsibleName],
      );

      if (responsibles != null && responsibles.isNotEmpty) {
        responsibleId = responsibles.first['id'] as int;
      } else {
        responsibleId = await _database?.insert(
          'responsibles',
          {'name': task.responsibleName},
        );
      }
    }

    final id = await _database?.insert(
        'Tasks', task.toMap(responsibleId: responsibleId));
    debugPrint("Task created with id: $id");
    return id;
  }

  Future<List<Task>> getTasks({bool? isCompleted}) async {
    List<String> where = [];
    List whereArgs = [];

    if (isCompleted != null) {
      where.add('isCompleted = ?');
      whereArgs.add(isCompleted ? 1 : 0);
    }

    final whereString = where.isNotEmpty ? where.join(' AND ') : null;

    // final result = await _database?.query(
    //   'Tasks',
    //   whereArgs: whereArgs,
    //   where: whereString,
    // );
    final result = await _database?.rawQuery(
      '''
        SELECT tasks.*, responsibles.name
        FROM tasks
        LEFT JOIN responsibles
        ON tasks.responsibleId = responsibles.id
        ${whereString ?? ''}
      ''',
      whereArgs,
    );

    final tasks = result?.map((e) => Task.fromMap(e)).toList();
    return tasks ?? [];
  }

  Future<int?> updateTask(Task task) async {
    final result = await _database?.update(
      'Tasks',
      task.toMap(),
      where: 'id = ?',
      whereArgs: [task.id],
    );
    return result;
  }

  Future<int?> deleteTask(int taskId) async {
    final result = await _database?.delete(
      'Tasks',
      where: 'id = ?',
      whereArgs: [taskId],
    );
    return result;
  }
}
