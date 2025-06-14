import 'package:sqlite_offline/domain/models/task/task.dart';

abstract class TaskRepository {
  Future<int> addTask(Task task);
  Future<List<Task>> getTasks();
  Future<bool> updateTask(Task task);
  Future<bool> deleteTask(int id);
}
