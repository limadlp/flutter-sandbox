import 'package:flutter/material.dart';

import '../../../../domain/models/task/task.dart';
import '../../../../domain/use_cases/task/add_task_use_case.dart';
import '../../../../domain/use_cases/task/delete_task_use_case.dart';
import '../../../../domain/use_cases/task/get_task_use_case.dart';
import '../../../../domain/use_cases/task/update_task_use_case.dart';

class TaskViewModel extends ChangeNotifier {
  TaskViewModel({
    required AddTaskUseCase addTaskUseCase,
    required GetTasksUseCase getTasksUseCase,
    required UpdateTaskUseCase updateTaskUseCase,
    required DeleteTaskUseCase deleteTaskUseCase,
  })  : _addTaskUseCase = addTaskUseCase,
        _getTasksUseCase = getTasksUseCase,
        _updateTaskUseCase = updateTaskUseCase,
        _deleteTaskUseCase = deleteTaskUseCase;

  final AddTaskUseCase _addTaskUseCase;
  final GetTasksUseCase _getTasksUseCase;
  final UpdateTaskUseCase _updateTaskUseCase;
  final DeleteTaskUseCase _deleteTaskUseCase;

  List<Task>? _tasks;
  List<Task>? get tasks => _tasks;

  Future<void> loadTasks({bool? isCompleted}) async {
    _tasks = await _getTasksUseCase(isCompleted: isCompleted);
    notifyListeners();
  }

  Future<void> addTask(
    String title,
    String description,
    String category,
    String priority,
  ) async {
    final task = Task(
      title: title,
      description: description,
      category: category,
      priority: priority,
      isCompleted: false,
    );
    await _addTaskUseCase(task);
    await loadTasks();
  }

  Future<void> toggleTaskStatus(
    Task task, {
    bool? isCompleted,
  }) async {
    final updatedTask = Task(
      id: task.id,
      title: task.title,
      description: task.description,
      category: task.category,
      isCompleted: !task.isCompleted,
      priority: task.priority,
    );
    await _updateTaskUseCase(updatedTask);
    await loadTasks(isCompleted: isCompleted);
  }

  Future<void> updateTask(
    Task task, {
    bool? isCompleted,
  }) async {
    await _updateTaskUseCase(task);
    await loadTasks(isCompleted: isCompleted);
  }

  Future<void> deleteTask(int id) async {
    await _deleteTaskUseCase(id);
    await loadTasks();
  }
}
