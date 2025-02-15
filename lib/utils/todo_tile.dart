import 'package:flutter/material.dart';

class TodoTile extends StatelessWidget {
  final bool isChecked;
  final void Function(bool?)? istaskCompleted;
  final String exerciseName;
  final void Function()? onTappedContainer;

  const TodoTile({
    super.key,
    required this.isChecked,
    required this.istaskCompleted,
    required this.exerciseName,
    required this.onTappedContainer,
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
                ? Colors.green[700] // Subtle green for completion ✅
                : Theme.of(context).cardColor, // Default dark mode tile
          ),
          child: Row(
            children: [
              Checkbox(
                activeColor:
                    Theme.of(context).primaryColor, // Theme-based accent color
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
                        ? Colors.white70
                        : Colors.white, // Lighter for readability
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
