import 'package:cubit_tdd_todo/src/cubits/board_cubit.dart';
import 'package:cubit_tdd_todo/src/models/task.dart';
import 'package:cubit_tdd_todo/src/repositories/board_repository.dart';
import 'package:cubit_tdd_todo/src/states/board_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class BoardRepositoryMock extends Mock implements BoardRepository {}

void main() {
  final repository = BoardRepositoryMock();
  final cubit = BoardCubit(repository);
  tearDown(() => reset(repository));

  group('fetchTasks |', () {
    test('it should get all tasks', () async {
      when(() => repository.fetch()).thenAnswer(
        (_) async => [
          const Task(id: 1, description: 'description', check: false),
        ],
      );
      expect(
        cubit.stream,
        emitsInOrder([isA<LoadingBoardState>(), isA<GettedTasksBoardState>()]),
      );
      await cubit.fetchTasks();
    });

    test('It should return an error state on failure', () async {
      when(() => repository.fetch()).thenThrow(Exception('error'));
      expect(
        cubit.stream,
        emitsInOrder([isA<LoadingBoardState>(), isA<FailureBoardState>()]),
      );
      await cubit.fetchTasks();
    });
  });
}
