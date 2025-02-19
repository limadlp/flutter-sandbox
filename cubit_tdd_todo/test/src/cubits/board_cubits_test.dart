import 'package:cubit_tdd_todo/src/cubits/board_cubit.dart';
import 'package:cubit_tdd_todo/src/models/task.dart';
import 'package:cubit_tdd_todo/src/repositories/board_repository.dart';
import 'package:cubit_tdd_todo/src/states/board_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class BoardRepositoryMock extends Mock implements BoardRepository {}

void main() {
  late BoardRepositoryMock repository = BoardRepositoryMock();
  late BoardCubit cubit;
  setUp(() {
    repository = BoardRepositoryMock();
    cubit = BoardCubit(repository);
  });

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

  group('addTask |', () {
    test('it should add a task', () async {
      when(() => repository.update(any())).thenAnswer((_) async => [
          
        ],
      );
      expect(cubit.stream, emitsInOrder([isA<GettedTasksBoardState>()]));
      const task = Task(id: 1, description: 'description');
      await cubit.addTask(task);
      final state = cubit.state as GettedTasksBoardState;
      expect(state.tasks.length, 1);
      expect(state.tasks, [task]);
    });

    test('It should return an error state on failure', () async {
      when(() => repository.update(any())).thenThrow(Exception('error'));
      expect(cubit.stream, emitsInOrder([isA<FailureBoardState>()]));
      const task = Task(id: 1, description: 'description');
      await cubit.addTask(task);
    });
  });

  group('removeTask |', () {
    test('it should remove a task', () async {
      when(() => repository.update(any())).thenAnswer((_) async => [
          
        ],
      );
      const task = Task(id: 1, description: 'description');
      cubit.addTasks([task]);
      expect((cubit.state as GettedTasksBoardState).tasks.length, 1);

      expect(cubit.stream, emitsInOrder([isA<GettedTasksBoardState>()]));

      await cubit.removeTask(task);
      final state = cubit.state as GettedTasksBoardState;
      expect(state.tasks.length, 0);
      expect(state.tasks, []);
    });

    test('It should return an error state on failure', () async {
      when(() => repository.update(any())).thenThrow(Exception('error'));

      const task = Task(id: 1, description: 'description');
      cubit.addTasks([task]);
      expect(cubit.stream, emitsInOrder([isA<FailureBoardState>()]));

      await cubit.removeTask(task);
    });
  });

  group('checkTask |', () {
    test('it should check a task', () async {
      when(() => repository.update(any())).thenAnswer((_) async => [
          
        ],
      );
      const task = Task(id: 1, description: 'description');
      cubit.addTasks([task]);
      expect((cubit.state as GettedTasksBoardState).tasks.length, 1);

      expect(cubit.stream, emitsInOrder([isA<GettedTasksBoardState>()]));
      expect((cubit.state as GettedTasksBoardState).tasks.first.check, false);

      await cubit.checkTask(task);
      final state = cubit.state as GettedTasksBoardState;
      expect(state.tasks.length, 1);
      expect(state.tasks.first.check, true);
    });

    test('It should return an error state on failure', () async {
      when(() => repository.update(any())).thenThrow(Exception('error'));

      const task = Task(id: 1, description: 'description');
      cubit.addTasks([task]);
      expect(cubit.stream, emitsInOrder([isA<FailureBoardState>()]));

      await cubit.removeTask(task);
    });
  });
}
