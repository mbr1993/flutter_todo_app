import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todo_app/features/dashboard/presentation/pages/dashboard_page.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'features/dashboard/presentation/cubit/bottom_nav_cubit.dart';

void main() async {
  await Hive.initFlutter();

  Box<dynamic> box = await Hive.openBox('myBox');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
      ),
      home: BlocProvider<BottomNavCubit>(
        create: (context) => BottomNavCubit(),
        child: DashboardPage(),
      ),
    );
  }
}
