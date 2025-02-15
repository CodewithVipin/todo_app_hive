import 'package:flutter/material.dart';
import 'package:todo_app_hive/utils/todo_tile.dart';
import 'package:todo_app_hive/utils/add_task_dialogue.dart';

class HomePage extends StatefulWidget {
  final VoidCallback toggleTheme; // Function to switch theme

  const HomePage({super.key, required this.toggleTheme});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController textController = TextEditingController();

  List<Map<String, dynamic>> tasks = [
    {'title': 'Make tutorial', 'isChecked': false},
    {'title': 'Do exercise', 'isChecked': false},
    {'title': 'Did you exercise?', 'isChecked': false},
  ];

  void checkTapped(int index) {
    setState(() {
      tasks[index]['isChecked'] = !tasks[index]['isChecked'];
    });
  }

  void addNewTask() {
    String newTask = textController.text.trim();

    if (newTask.isNotEmpty) {
      setState(() {
        tasks.add({'title': newTask, 'isChecked': false});
      });
      textController.clear();
      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Task cannot be empty')),
      );
    }
  }

  void addTask() {
    showDialog(
      context: context,
      builder: (context) => AddTaskDialogue(
        onCancel: () => Navigator.pop(context),
        controller: textController,
        onSave: addNewTask,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: const Text('TO DO'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.brightness_6), // Theme switch icon
            onPressed: widget.toggleTheme,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addTask,
        backgroundColor: Theme.of(context).primaryColor,
        child: const Icon(Icons.add),
      ),
      body: tasks.isEmpty
          ? const Center(child: Text('No tasks available'))
          : ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) => TodoTile(
                onTappedContainer: () => checkTapped(index),
                isChecked: tasks[index]['isChecked'],
                istaskCompleted: (_) => checkTapped(index),
                exerciseName: tasks[index]['title'],
              ),
            ),
    );
  }
}
