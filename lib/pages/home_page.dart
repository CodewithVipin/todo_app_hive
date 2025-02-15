import 'package:flutter/material.dart';
import 'package:todo_app_hive/utils/edit_task_dialogue.dart';
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

  // Toggle task completion
  void checkTapped(int index) {
    setState(() {
      tasks[index]['isChecked'] = !tasks[index]['isChecked'];
    });
  }

  // Edit an existing task
  void onEdit(int index) {
    String newTask = textController.text.trim();

    if (newTask.isNotEmpty) {
      setState(() {
        tasks[index] = {
          'title': newTask,
          'isChecked': tasks[index]['isChecked']
        }; // Correct way to update
      });
      textController.clear();
      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Task cannot be empty')),
      );
    }
  }

  // Add a new task
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

  // Show add task dialog
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

  // Show edit task dialog
  void editTask(int index) {
    textController.text = tasks[index]['title']; // Set existing text

    showDialog(
      context: context,
      builder: (context) => EditTaskDialogue(
        onEdit: () => onEdit(index), // Pass index to edit function
        controller: textController,
        onCancel: () => Navigator.pop(context),
      ),
    );
  }

  // Delete a task
  void deleteTask(int index) {
    setState(() {
      tasks.removeAt(index);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Task deleted successfully')),
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
            icon: const Icon(Icons.brightness_6), // Theme switch icon
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
                deleteTask: () =>
                    deleteTask(index), // ✅ Now deletes the correct task
                editTask: () => editTask(index),
                onTappedContainer: () => checkTapped(index),
                isChecked: tasks[index]['isChecked'],
                istaskCompleted: (_) => checkTapped(index),
                exerciseName: tasks[index]['title'],
              ),
            ),
    );
  }
}
