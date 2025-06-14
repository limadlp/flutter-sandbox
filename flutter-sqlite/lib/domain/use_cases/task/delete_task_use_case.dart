import 'package:flutter/foundation.dart';

import '../../../data/repositories/task_repository.dart';

/// Use Case para excluir uma tarefa
class DeleteTaskUseCase {
  DeleteTaskUseCase(this._repository);

  final TaskRepository _repository;

  Future<bool> call(int id) async {
    try {
      return await _repository.deleteTask(id);
    } catch (e) {
      debugPrint('Erro ao excluir tarefa: $e');
      rethrow;
    }
  }
}
