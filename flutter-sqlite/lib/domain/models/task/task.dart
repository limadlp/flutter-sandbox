class Task {
  final int? id;
  final String title;
  final String description;
  final String category;
  final String priority;
  final String? responsibleName;
  final bool isCompleted;

  Task({
    this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.priority,
    required this.isCompleted,
    this.responsibleName,
  });

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      id: map['id'] as int?,
      title: map['title'] as String,
      description: map['description'] as String,
      category: map['category'] as String,
      priority: map['priority'] ?? '',
      responsibleName: map['name'],
      isCompleted: (map['isCompleted'] as int) == 1,
    );
  }

  Map<String, dynamic> toMap({int? responsibleId}) {
    return {
      'id': id,
      'title': title,
      'description': description,
      'category': category,
      'priority': priority,
      'isCompleted': isCompleted ? 1 : 0,
      'responsibleId': responsibleId,
    };
  }
}
