import 'package:flutter/foundation.dart';

import '../../../data/repositories/task_repository.dart';
import '../../models/task/task.dart';

/// Use Case para atualizar uma tarefa
class UpdateTaskUseCase {
  UpdateTaskUseCase(this._repository);

  final TaskRepository _repository;

  Future<bool> call(Task task) async {
    try {
      return await _repository.updateTask(task);
    } catch (e) {
      debugPrint('Erro ao atualizar tarefa: $e');
      rethrow;
    }
  }
}
