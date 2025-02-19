import 'package:cubit_tdd_todo/src/models/task.dart';

abstract class BoardRepository {
  Future<List<Task>> fetch();
  Future<List<Task>> update(List<Task> tasks);
}
