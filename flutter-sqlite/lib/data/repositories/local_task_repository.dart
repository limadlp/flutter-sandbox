import 'package:sqlite_offline/data/repositories/task_repository.dart';
import 'package:sqlite_offline/data/services/local_database_service.dart';
import 'package:sqlite_offline/domain/models/task/task.dart';

class LocalTaskRepository implements TaskRepository {
  final LocalDatabaseService localDatabaseService;

  LocalTaskRepository({required this.localDatabaseService});

  @override
  Future<int> addTask(Task task) async {
    final id = await localDatabaseService.createTask(task);
    return id ?? 0;
  }

  @override
  Future<bool> deleteTask(int id) async {
    final result = await localDatabaseService.deleteTask(id);
    return result != null;
  }

  @override
  Future<List<Task>> getTasks({bool? isCompleted}) async {
    final result = await localDatabaseService.getTasks(
      isCompleted: isCompleted,
    );
    return result;
  }

  @override
  Future<bool> updateTask(Task task) async {
    final result = await localDatabaseService.updateTask(task);
    return result != null;
  }
}
