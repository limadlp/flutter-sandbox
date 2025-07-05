import 'package:flutter_test/flutter_test.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:sqlite_offline/data/services/local_database_service.dart';
import 'package:sqlite_offline/domain/models/task/task.dart';

void main() {
  late final LocalDatabaseService localDatabaseService;

  setUpAll(
    () async {
      sqfliteFfiInit();
      databaseFactory = databaseFactoryFfi;
      localDatabaseService = LocalDatabaseService();

      await localDatabaseService.init(
        inMemoryDatabase: true,
      );
    },
  );

  test(
    'Banco de dados deve inicializar corretamente',
    () async {
      expect(localDatabaseService.database?.isOpen, isTrue);
    },
  );

  test(
    'Deverá criar uma task na tabela',
    () async {
      final task = Task(
        title: 'Test Task',
        description: 'This is a test task',
        category: 'Work',
        isCompleted: false,
        priority: 'medium',
      );

      final result = await localDatabaseService.createTask(task);

      expect(
        result,
        isNot(equals(null)),
      );
    },
  );

  test('Deverá listar os itens salvos', () async {
    final task = Task(
      title: 'Lavar louça',
      description: 'This is a test task',
      category: 'Home',
      isCompleted: false,
      priority: 'high',
    );

    await localDatabaseService.createTask(task);
    final result = await localDatabaseService.getTasks();

    expect(result.length, equals(2));
  });

  test('Deverá listar os itens completados', () async {
    final task = Task(
      title: 'Varrer a casa',
      description: 'This is a test task',
      category: 'Home',
      isCompleted: true,
      priority: 'high',
    );

    await localDatabaseService.createTask(task);
    final result = await localDatabaseService.getTasks(isCompleted: true);

    expect(result.length, equals(1));
  });

  test('Deverá atualizar uma task', () async {
    final task = Task(
      title: 'Estudar Flutter',
      description: 'This is a test task',
      category: 'Education',
      isCompleted: false,
      priority: 'medium',
    );

    final taskId = await localDatabaseService.createTask(task);
    final newTask = await localDatabaseService.getTaskById(taskId!);
    expect(newTask?.title, equals(task.title));

    final editedTask = Task(
      id: newTask?.id,
      title: 'Estudar Swift',
      description: newTask!.description,
      category: newTask.category,
      isCompleted: !newTask.isCompleted,
      priority: newTask.priority,
    );

    final result = await localDatabaseService.updateTask(editedTask);

    expect(result, isNot(equals(null)));

    final newEditedTask = await localDatabaseService.getTaskById(taskId);
    expect(newEditedTask?.title, equals(editedTask.title));
  });

  test('Deverá deletar uma task', () async {
    final task = Task(
      title: 'Comprar pão',
      description: 'This is a test task',
      category: 'Shopping',
      isCompleted: false,
      priority: 'low',
    );

    final taskId = await localDatabaseService.createTask(task);
    final result = await localDatabaseService.deleteTask(taskId!);

    expect(result, isNot(equals(null)));

    final deletedTask = await localDatabaseService.getTaskById(taskId);
    expect(deletedTask, isNull);
  });
}
