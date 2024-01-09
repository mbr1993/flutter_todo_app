import 'package:hive_flutter/hive_flutter.dart';

class ToDoDatabase {
  List<dynamic> todoList = [];

  //reference our box
  final Box<dynamic> _myBox = Hive.box('myBox');

  //run this method if it is a first time ever opening this app
  void createInitialData() {
    todoList = [
      ['Reading a book', false],
      ['Create your first task', false],
    ];
  }

  //load the data from database
  void loadData() {
    todoList = _myBox.get('TODOLIST') as List<dynamic>;
  }

  //update the database
  void updateData() {
    _myBox.put('TODOLIST', todoList);
  }
}
