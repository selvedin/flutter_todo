class Task {
  final String id = DateTime.now().toIso8601String();
  final String title;
  final DateTime createdAt;
  bool isFinished = false;

  Task(this.title, this.createdAt); //positional arguments
}
