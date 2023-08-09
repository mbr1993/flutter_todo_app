import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoTile extends StatelessWidget {
  final String taskName;
  final bool taskComplete;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunction;
  VoidCallback delete;

  ToDoTile(
      {super.key,
      required this.taskName,
      required this.taskComplete,
      required this.deleteFunction,
      required this.onChanged,
      required this.delete});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 16, left: 16, top: 24),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              icon: Icons.delete,
              backgroundColor: Colors.red,
              onPressed: deleteFunction,
              borderRadius: BorderRadius.circular(16),
            ),
          ],
        ),
        child: Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.amber[50],
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              Checkbox(value: taskComplete, onChanged: onChanged),
              Expanded(
                child: Text(
                  taskName,
                  style: TextStyle(
                      decoration: taskComplete
                          ? TextDecoration.lineThrough
                          : TextDecoration.none),
                ),
              ),
              IconButton(
                alignment: AlignmentDirectional.topEnd,
                onPressed: delete,
                icon: Icon(Icons.delete_sweep_outlined),
              )
            ],
          ),
        ),
      ),
    );
  }
}
