import 'package:flutter/material.dart';

class AddTaskDialog extends StatelessWidget {
  AddTaskDialog({required this.controller, required this.cancel, required this.onSave, super.key});

  final TextEditingController controller;
  final VoidCallback onSave;
  final VoidCallback cancel;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
                hintText: 'Add a new task',
                contentPadding: EdgeInsets.all(8),
              ),
            ),
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              myButton(text: 'Cancel', onPressed: cancel),
              const SizedBox(width: 10),
              myButton(text: 'Save', onPressed: onSave),
            ],
          )
        ],
      ),
    );
  }

  Widget myButton({required String text, required VoidCallback onPressed}) {
    return MaterialButton(
      color: Colors.amber,
      onPressed: onPressed,
      child: Text(text),
    );
  }
}
