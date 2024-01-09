import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todo_app/data/database.dart';
import 'package:flutter_todo_app/features/dashboard/presentation/cubit/bottom_nav_cubit.dart';
import 'package:flutter_todo_app/features/dashboard/presentation/widgets/add_task_dialog.dart';
import 'package:flutter_todo_app/features/dashboard/presentation/widgets/todo_tile.dart';
import 'package:hive/hive.dart';

import 'package:iconly/iconly.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final List<Widget> _list = [
    Container(color: Colors.red[50]),
    Container(color: Colors.amber[50]),
  ];

  //reference hive box
  final Box<dynamic> _myBox = Hive.box('myBox');
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
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavCubit, int>(
      builder: (BuildContext context, state) {
        return Scaffold(
          appBar: _dashboardAppBar(),
          body: _list[state],
          floatingActionButton: dashboardFAB(),
          bottomNavigationBar: NavigationBar(
            selectedIndex: context.watch<BottomNavCubit>().state,
            onDestinationSelected: (value) {
              context.read<BottomNavCubit>().changeSelectedIndex(value);
            },
            destinations: [
              NavigationDestination(
                icon: Icon(state == 0 ? IconlyBold.home : IconlyLight.home),
                label: 'Home',
              ),
              NavigationDestination(
                icon: Icon(state == 1 ? IconlyBold.setting : IconlyLight.setting),
                label: 'Settings',
              ),
            ],
          ),
        );
      },
    );
  }

  // Floating Action Button
  FloatingActionButton dashboardFAB() {
    return FloatingActionButton(
      onPressed: () {
        showDialog<void>(
          context: context,
          builder: (context) {
            return AddTaskDialog(
              controller: _controller,
              cancel: () => Navigator.of(context).pop(),
              onSave: saveNewTask,
            );
          },
        );
      },
      child: const Icon(Icons.add),
    );
  }

  // App Bar - Dashboard Widget
  AppBar _dashboardAppBar() {
    return AppBar(
      leading: const Icon(Icons.menu),
      elevation: 0,
      // backgroundColor: Colors.amber,
      title: const Text('TO DO'),
      centerTitle: true,
    );
  }

  Widget _todoListView() => Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              'You have ${db.todoList.length} tasks to do!',
              style: const TextStyle(fontSize: 20),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: db.todoList.length,
              itemBuilder: (context, index) {
                return ToDoTile(
                  taskName: db.todoList[index][0] as String,
                  taskComplete: db.todoList[index][1] as bool,
                  onChanged: (value) => checkBoxChanged(value, index),
                  deleteFunction: (context) => deleteTask(index),
                  delete: () => deleteTask(index),
                );
              },
            ),
          ),
        ],
      );

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.todoList[index][1] = value;
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

  void deleteTask(int index) {
    setState(() {
      db.todoList.removeAt(index);
    });
    db.updateData();
  }
}
