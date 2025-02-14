import 'package:flutter/material.dart';

class TodoTile extends StatelessWidget {
  final bool isChecked;
  final void Function(bool?)? istaskCompleted;
  final String exerciseName;
  final void Function()? onTappedContainer;

  const TodoTile(
      {super.key,
      required this.isChecked,
      required this.istaskCompleted,
      required this.exerciseName,
      required this.onTappedContainer});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15),
      child: GestureDetector(
        onTap: onTappedContainer,
        child: Container(
          padding: EdgeInsets.all(24),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: isChecked ? Colors.grey[400] : Colors.yellow,
          ),
          child: Row(
            children: [
              Checkbox(
                  activeColor: Colors.black,
                  checkColor: Colors.yellow,
                  value: isChecked,
                  onChanged: istaskCompleted),
              Text(
                exerciseName,
                style: TextStyle(
                    decoration: isChecked ? TextDecoration.lineThrough : null),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
