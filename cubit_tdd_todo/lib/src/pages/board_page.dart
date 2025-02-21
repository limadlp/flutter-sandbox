import 'package:cubit_tdd_todo/src/cubits/board_cubit.dart';
import 'package:cubit_tdd_todo/src/models/task.dart';
import 'package:cubit_tdd_todo/src/states/board_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BoardPage extends StatefulWidget {
  const BoardPage({super.key});

  @override
  State<BoardPage> createState() => _BoardPageState();
}

class _BoardPageState extends State<BoardPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<BoardCubit>().fetchTasks();
    });
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<BoardCubit>();
    final state = cubit.state;
    Widget body = Container();

    if (state is EmptyBoardState) {
      body = const Center(
        key: Key('EmptyState'),
        child: Text('Adicione uma nova Task'),
      );
    } else if (state is GettedTasksBoardState) {
      final tasks = state.tasks;
      body = ListView.builder(
        key: Key('GettedState'),
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          final task = tasks[index];
          return Dismissible(
            key: Key(task.id.toString()),
            onDismissed: (direction) {
              cubit.removeTask(task);
            },

            child: CheckboxListTile(
              title: Text(task.description),
              value: task.check,
              onChanged: (value) {
                cubit.checkTask(task);
              },
            ),
          );
        },
      );
    } else if (state is FailureBoardState) {
      body = const Center(
        key: Key('FailureState'),
        child: Text('Erro ao buscar as tasks'),
      );
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Tasks')),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          addTaskDialog();
        },
      ),
      body: body,
    );
  }

  void addTaskDialog() {
    showDialog(
      context: context,
      builder: (ctx) {
        final cubit = context.read<BoardCubit>();
        final textController = TextEditingController();
        return AlertDialog(
          title: const Text('Adicionar Task'),
          content: TextField(controller: textController),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(ctx).pop();
              },
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                final task = Task(id: -1, description: textController.text);
                cubit.addTask(task);
                Navigator.of(ctx).pop();
              },
              child: const Text('Adicionar'),
            ),
          ],
        );
      },
    );
  }
}
