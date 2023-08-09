import 'package:flutter/material.dart';
import 'package:flutter_todo_app/data/database.dart';
import 'package:flutter_todo_app/utils/alert_dialog_add_task.dart';
import 'package:flutter_todo_app/utils/todo_tile.dart';
import 'package:hive_flutter/hive_flutter.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //reference hive box
  final _myBox = Hive.box('myBox');
  ToDoDatabase db = ToDoDatabase();

  final _controller = TextEditingController();

  @override
  void initState() {
    // if this is the first time opening the app, then create default data
    if (_myBox.get('TODOLIST') == null) {
      db.createInitialData();
    } else {
      db.loadData();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[100],
      appBar: AppBar(
        centerTitle: false,
        elevation: 0,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('TO DO'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
          itemCount: db.todoList.length,
          itemBuilder: (context, index) {
            return ToDoTile(
              taskName: db.todoList[index][0],
              taskComplete: db.todoList[index][1],
              onChanged: (value) => checkBoxChanged(value, index),
              deleteFunction: (context) => deleteTask(index),
              delete: () => deleteTask(index),
            );
          }),
    );
  }

  createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return AddTaskDialog(
          controller: _controller,
          cancel: () => Navigator.of(context).pop(),
          onSave: saveNewTask,
        );
      },
    );
  }

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.todoList[index][1] = !db.todoList[index][1];
    });
    db.updateData();
  }

  void saveNewTask() {
    setState(() {
      db.todoList.add([_controller.text, false]);
      Navigator.of(context).pop();
    });
    db.updateData();
  }

  deleteTask(int index) {
    setState(() {
      db.todoList.removeAt(index);
    });
    db.updateData();
  }
}
