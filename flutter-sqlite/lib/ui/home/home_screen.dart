import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sqlite_offline/data/services/local_database_service.dart';
import 'package:sqlite_offline/domain/models/task/task.dart';
import 'package:sqlite_offline/ui/home/widgets/header_widget.dart';

import 'view_models/task/task_view_model.dart';
import 'widgets/add_task_button_widget.dart';
import 'widgets/task_card_widget.dart';
import 'widgets/task_header_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<void> showTaskModal({
    required BuildContext context,
    Task? existingTask, // Caso seja uma edição, a tarefa será passada aqui
    required void Function(String title, String description, String category)
        onSubmit,
  }) async {
    final formKey = GlobalKey<FormState>();
    final TextEditingController titleController =
        TextEditingController(text: existingTask?.title ?? '');
    final TextEditingController descriptionController =
        TextEditingController(text: existingTask?.description ?? '');
    final TextEditingController categoryController =
        TextEditingController(text: existingTask?.category ?? '');

    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
            left: 16.0,
            right: 16.0,
            top: 16.0,
          ),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  existingTask == null ? 'Adicionar Tarefa' : 'Editar Tarefa',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12.0),

                // Campo Título
                TextFormField(
                  controller: titleController,
                  decoration: const InputDecoration(
                    labelText: 'Título',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira o título';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 12.0),

                // Campo Descrição
                TextFormField(
                  controller: descriptionController,
                  decoration: const InputDecoration(
                    labelText: 'Descrição',
                    border: OutlineInputBorder(),
                  ),
                  maxLines: 2,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira a descrição';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 12.0),

                // Campo Categoria
                TextFormField(
                  controller: categoryController,
                  decoration: const InputDecoration(
                    labelText: 'Categoria',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira a categoria';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),

                // Botão de Salvar
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24.0,
                          vertical: 12.0,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        )),
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        onSubmit(
                          titleController.text,
                          descriptionController.text,
                          categoryController.text,
                        );
                        Navigator.pop(context);
                      }
                    },
                    child: const Text(
                      'Salvar',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 12.0),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> initDatabase() async {
    final service = Provider.of<LocalDatabaseService>(
      context,
      listen: false,
    );

    await service.init();
    taskViewModel.loadTasks();
  }

  late final taskViewModel = Provider.of<TaskViewModel>(
    context,
    listen: true,
  );

  bool? filterIsCompleted;

  @override
  void initState() {
    super.initState();
    initDatabase();
    Future.microtask(
      () {
        taskViewModel.loadTasks();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const HeaderWidget(),
          const SliverToBoxAdapter(child: TaskHeader()),
          const SliverToBoxAdapter(child: SizedBox(height: 20)),
          SliverToBoxAdapter(
            child: AddTaskButton(
              onPressed: () {
                showTaskModal(
                  context: context,
                  onSubmit: (title, description, category) {
                    taskViewModel.addTask(title, description, category);
                  },
                );
              },
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 20)),
          SliverToBoxAdapter(
              child: Row(
            children: [
              TextButton(
                onPressed: () {
                  if (filterIsCompleted == true) {
                    filterIsCompleted = null;
                    taskViewModel.loadTasks();
                  } else {
                    filterIsCompleted = true;
                    taskViewModel.loadTasks(isCompleted: true);
                  }
                },
                child: Text(
                  'Finalizadas',
                  style: TextStyle(
                    color:
                        filterIsCompleted == true ? Colors.amber : Colors.black,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  if (filterIsCompleted == false) {
                    filterIsCompleted = null;
                    taskViewModel.loadTasks();
                  } else {
                    filterIsCompleted = false;
                    taskViewModel.loadTasks(isCompleted: false);
                  }
                },
                child: Text(
                  'Não Finalizadas',
                  style: TextStyle(
                    color:
                        filterIsCompleted == true ? Colors.amber : Colors.black,
                  ),
                ),
              ),
            ],
          )),
          const SliverToBoxAdapter(child: SizedBox(height: 20)),
          if (taskViewModel.tasks == null)
            const SliverToBoxAdapter(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            )
          else if (taskViewModel.tasks!.isEmpty)
            const SliverFillRemaining(
              child: Center(child: Text('Sem dados cadastrados')),
            )
          else
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              sliver: SliverList.builder(
                itemCount: taskViewModel.tasks!.length,
                itemBuilder: (context, index) {
                  final task = taskViewModel.tasks![index];
                  return TaskCard(
                    task: task,
                    onToggleStatus: () => taskViewModel.toggleTaskStatus(
                      task,
                      isCompleted: filterIsCompleted,
                    ),
                    onEdit: () {
                      showTaskModal(
                        context: context,
                        existingTask: task,
                        onSubmit: (title, description, category) {
                          final updatedTask = Task(
                            id: task.id,
                            title: title,
                            description: description,
                            category: category,
                            isCompleted: task.isCompleted,
                          );
                          taskViewModel.updateTask(
                            updatedTask,
                            isCompleted: filterIsCompleted,
                          );
                        },
                      );
                    },
                    onDelete: () => taskViewModel.deleteTask(task.id!),
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
}
