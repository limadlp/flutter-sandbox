import 'package:bloc/bloc.dart';
import 'package:cubit_tdd_todo/src/models/task.dart';
import 'package:cubit_tdd_todo/src/states/board_state.dart';

class BoardCubit extends Cubit<BoardState> {
  BoardCubit() : super(EmptyBoardState());

  Future<void> fetchTasks() async {}

  Future<void> addTask(Task newTask) async {}

  Future<void> removeTask(Task task) async {}

  Future<void> checkTask(Task task) async {}
}
