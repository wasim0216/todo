import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'To-Do App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TodoListPage(),
    );
  }
}

class TodoListPage extends StatefulWidget {
  @override
  _TodoListPageState createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  // List to hold the tasks
  List<String> tasks = [];

  // Text editing controller for the input field
  TextEditingController taskController = TextEditingController();

  // Function to add a new task
  void addTask() {
    setState(() {
      if (taskController.text.isNotEmpty) {
        tasks.add(taskController.text);
        taskController.clear();
      }
    });
  }

  // Function to remove a task
  void removeTask(int index) {
    setState(() {
      tasks.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("To-Do List"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Input field to add a new task
            TextField(
              controller: taskController,
              decoration: InputDecoration(
                labelText: "Enter a task",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            // Button to add the task
            ElevatedButton(
              onPressed: addTask,
              child: Text("Add Task"),
            ),
            SizedBox(height: 20),
            // Displaying the list of tasks
            Expanded(
              child: ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(tasks[index]),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () => removeTask(index),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
