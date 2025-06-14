class Task {
  final int? id;
  final String title;
  final String description;
  final String category;
  final bool isCompleted;

  Task({
    this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.isCompleted,
  });
}
