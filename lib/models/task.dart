enum TaskPriority { LOW, NORMAL, HIGH, URGENT }

class Task {
  final String id;
  final String title;
  final DateTime createdAt;
  final bool isFinished;
  final TaskPriority priority;

  Task(
    this.id,
    this.title,
    this.createdAt,
    this.isFinished,
    this.priority,
  );

  Map toMap() {
    return {
      'id': this.id,
      'title': this.title,
      'createdAt': this.createdAt.toIso8601String(),
      'isFinished': this.isFinished,
      'priority': this.priority.toString().split('.')[1],
    };
  }

  Task.fromMap(Map map)
      : this.id = map['id'],
        this.title = map['title'],
        this.createdAt = DateTime.parse(map['createdAt']),
        this.isFinished = map['isFinished'],
        this.priority = _getPriority(map['priority']);

  static TaskPriority _getPriority(String priority) {
    switch (priority) {
      case 'NORMAL':
        return TaskPriority.NORMAL;
      case 'HIGH':
        return TaskPriority.HIGH;
      case 'URGENT':
        return TaskPriority.URGENT;
      default:
        return TaskPriority.LOW;
    }
  }
}
