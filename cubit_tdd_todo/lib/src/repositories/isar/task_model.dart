import 'package:isar/isar.dart';

part 'task_model.g.dart';

@collection
class TaskModel {
  Id id = Isar.autoIncrement;
  String description = '';
  bool check = false;

  TaskModel({
    this.id = Isar.autoIncrement,
    this.description = '',
    this.check = false,
  });
}
