import 'package:flutter/material.dart';

class TodoTile extends StatelessWidget {
  final bool isChecked;
  final void Function(bool?)? istaskCompleted;
  final String exerciseName;
  final void Function()? onTappedContainer;
  final void Function()? editTask; // ✅ Fix: Remove `BuildContext`
  final void Function()? deleteTask;

  const TodoTile({
    super.key,
    required this.isChecked,
    required this.deleteTask,
    required this.istaskCompleted,
    required this.exerciseName,
    required this.onTappedContainer,
    required this.editTask, // ✅ Fix: Changed function signature
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: GestureDetector(
        onTap: onTappedContainer,
        child: Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: isChecked
                ? Colors.green[700] // ✅ Green for completed tasks
                : Theme.of(context).cardColor, // Use theme-based card color
          ),
          child: Row(
            children: [
              Checkbox(
                activeColor: Theme.of(context).primaryColor,
                checkColor: Colors.black,
                value: isChecked,
                onChanged: istaskCompleted,
              ),
              Expanded(
                child: Text(
                  exerciseName,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 17,
                    decoration: isChecked ? TextDecoration.lineThrough : null,
                    color: isChecked
                        ? Theme.of(context).textTheme.bodyMedium!.color
                        : Theme.of(context).textTheme.bodyLarge!.color,
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.edit, color: Colors.white70),
                onPressed: editTask, // ✅ Now it works properly
              ),
              IconButton(
                icon: const Icon(Icons.delete, color: Colors.redAccent),
                onPressed: deleteTask, // ✅ Now it works properly
              ),
            ],
          ),
        ),
      ),
    );
  }
}
