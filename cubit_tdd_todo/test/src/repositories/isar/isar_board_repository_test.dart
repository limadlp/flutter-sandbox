import 'package:cubit_tdd_todo/src/models/task.dart';
import 'package:cubit_tdd_todo/src/repositories/board_repository.dart';
import 'package:cubit_tdd_todo/src/repositories/isar/isar_board_repository.dart';
import 'package:cubit_tdd_todo/src/repositories/isar/isar_datasource.dart';
import 'package:cubit_tdd_todo/src/repositories/isar/task_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class IsarDataSourceMock extends Mock implements IsarDatasource {}

void main() {
  late IsarDataSourceMock datasource;
  late BoardRepository repository;

  setUp(() {
    datasource = IsarDataSourceMock();
    repository = IsarBoardRepository(datasource);
  });

  test('fetch', () async {
    when(
      () => datasource.getTasks(),
    ).thenAnswer((_) async => [TaskModel()..id = 1]);
    final tasks = await repository.fetch();
    expect(tasks.length, 1);
  });

  test('update', () async {
    when(() => datasource.deleteAllTasks()).thenAnswer((_) async => []);
    when(() => datasource.putAllTasks(any())).thenAnswer((_) async => []);
    final tasks = await repository.update([
      Task(id: -1, description: 'description'),
      Task(id: 2, description: 'description'),
    ]);
    expect(tasks.length, 2);
  });
}
