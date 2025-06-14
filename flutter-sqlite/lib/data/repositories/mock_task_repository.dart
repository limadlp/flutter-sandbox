import '../../domain/models/task/task.dart';
import 'task_repository.dart';

class MockTaskRepository implements TaskRepository {
  final List<Task> _mockDb = [];
  int _idCounter = 1; // Simula IDs auto incrementais

  @override
  Future<int> addTask(Task task) async {
    final newTask = Task(
      id: _idCounter++, // Simula o auto incremento do ID
      title: task.title,
      description: task.description,
      category: task.category,
      isCompleted: task.isCompleted,
    );
    _mockDb.add(newTask);
    return newTask.id!; // Retorna o ID da nova tarefa
  }

  // Obter todas as tarefas
  @override
  Future<List<Task>> getTasks() async {
    // Simula um pequeno atraso para imitar o comportamento de um banco de dados
    await Future.delayed(const Duration(milliseconds: 200));
    return _mockDb.toList(); // Retorna uma cópia da lista
  }

  // Atualizar uma tarefa existente
  @override
  Future<bool> updateTask(Task task) async {
    final index = _mockDb.indexWhere((t) => t.id == task.id);
    if (index != -1) {
      _mockDb[index] = task;
      return true;
    }
    return false;
  }

  // Excluir uma tarefa pelo ID
  @override
  Future<bool> deleteTask(int id) async {
    final index = _mockDb.indexWhere((t) => t.id == id);
    if (index != -1) {
      _mockDb.removeAt(index);
      return true;
    }
    return false;
  }
}
