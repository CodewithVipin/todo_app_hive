import 'package:flutter/material.dart';

class EditTaskDialogue extends StatelessWidget {
  final void Function()? onEdit;
  final TextEditingController controller;
  final void Function()? onCancel;
  const EditTaskDialogue(
      {super.key,
      required this.onEdit,
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
          onPressed: onEdit,
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
