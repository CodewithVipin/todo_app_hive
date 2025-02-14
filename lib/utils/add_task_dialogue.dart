import 'package:flutter/material.dart';

class AddTaskDialogue extends StatelessWidget {
  final void Function()? onSave;
  final TextEditingController controller;
  final void Function()? onCancel;
  const AddTaskDialogue(
      {super.key,
      required this.onSave,
      required this.controller,
      required this.onCancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: TextField(
        controller: controller,
      ),
      actions: [
        MaterialButton(
          onPressed: onSave,
          child: Text('Save'),
        ),
        MaterialButton(
          onPressed: onCancel,
          child: Text('Cancel'),
        )
      ],
    );
  }
}
