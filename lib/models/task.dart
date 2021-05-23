enum TaskPriority { LOW, NORMAL, HIGH, URGENT }

class Task {
  final String id;
  final String title;
  final DateTime createdAt;
  final bool isFinished;
  final TaskPriority priority;

  Task(this.id, this.title, this.createdAt, this.isFinished,
      this.priority); //positional arguments
}
