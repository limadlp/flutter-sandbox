import 'package:bloc/bloc.dart';
import 'package:cubit_tdd_todo/src/models/task.dart';
import 'package:cubit_tdd_todo/src/repositories/board_repository.dart';
import 'package:cubit_tdd_todo/src/states/board_state.dart';

class BoardCubit extends Cubit<BoardState> {
  final BoardRepository repository;

  BoardCubit(this.repository) : super(EmptyBoardState());

  Future<void> fetchTasks() async {
    emit(LoadingBoardState());

    try {
      final tasks = await repository.fetch();
      emit(GettedTasksBoardState(tasks: tasks));
    } catch (e) {
      emit(FailureBoardState('Error'));
    }
  }

  Future<void> addTask(Task newTask) async {}

  Future<void> removeTask(Task task) async {}

  Future<void> checkTask(Task task) async {}
}
