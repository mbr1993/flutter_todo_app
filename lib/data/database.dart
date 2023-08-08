import 'package:hive_flutter/hive_flutter.dart';

class ToDoDatabase {
  List todoList = [];

  //reference our box
  final _myBox = Hive.box('myBox');

  //run this method if it is a first time ever opening this app
  createInitialData() {
    todoList = [
      ['Reading a book', false],
      ['Create your first task', false],
    ];
  }

  //load the data from database
  loadData() {
    todoList = _myBox.get('TODOLIST');
  }

  //update the database
  updateData() {
    _myBox.put('TODOLIST', todoList);
  }
}
