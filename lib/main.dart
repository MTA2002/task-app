import 'package:flutter/material.dart';
import 'package:flutter_application_2/pages/spash.dart';
import 'package:flutter_application_2/services/task_service.dart';

void main() {
  runApp(const MyTaskApp());
}

TaskService taskService() => TaskService();

class MyTaskApp extends StatelessWidget {
  const MyTaskApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: const Color.fromRGBO(238, 111, 87, 1.0)),
      debugShowCheckedModeBanner: false,
      home: const Splash(),
    );
  }
}
