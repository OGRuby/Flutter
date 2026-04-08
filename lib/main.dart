import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final List<Task> tasks = [
    Task(title: "Przygotować prezentację", deadline: "jutro", done: false, priority: "wysoki"),
    Task(title: "Oddać raport z laboratoriów", deadline: "dzisiaj", done: true, priority: "wysoki"),
    Task(title: "Powtórzyć widgety Flutter", deadline: "w piątek", done: false, priority: "średni"),
    Task(title: "Napisać notatki do kolokwium", deadline: "w weekend", done: false, priority: "niski"),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("KrakFlow")),
        body: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Masz dziś ${tasks.length} zadania"),
              SizedBox(height: 16),
              Text(
                "Dzisiejsze zadania",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              Expanded(
                child: ListView.builder(
                  itemCount: tasks.length,
                  itemBuilder: (context, index) {
                    final task = tasks[index];
                    return TaskCard(
                      title: task.title,
                      subtitle: "termin: ${task.deadline} | priorytet: ${task.priority}",
                      icon: task.done ? Icons.check_circle : Icons.radio_button_unchecked,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Task {
  final String title;
  final String deadline;
  final bool done;
  final String priority;

  Task({
    required this.title,
    required this.deadline,
    required this.done,
    required this.priority,
  });
}

class TaskCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;

  const TaskCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(icon),
        title: Text(title),
        subtitle: Text(subtitle),
      ),
    );
  }
}