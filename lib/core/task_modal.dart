class Task {
  String? title, description, dueDate, priority;
  int? status;
  int? id;

  Task({
    required this.title,
    this.id,
    required this.description,
    required this.dueDate,
    required this.priority,
    this.status,
  });

  factory Task.fromJson(Map map) {
    return Task(
      title: map['title'],
      id: map['id'],
      description: map['description'],
      dueDate: map['dueDate'],
      priority: map['priority'],
      status: map['status'],
    );
  }

  static Map<String, Object?> toMap(Task task) => {
    'id': task.id,
    'title': task.title,
    'description': task.description,
    'dueDate': task.dueDate,
    'priority': task.priority,
    'Status': task.status,
  };
}
