import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_application_2/custom widgets/my_task_card.dart';
import 'package:flutter_application_2/models/task_class.dart';
import 'package:flutter_application_2/pages/add_task.dart';
import 'package:flutter_application_2/main.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Task> tasks = taskService().tasks;
  void refreshPage() {
    setState(() {
      tasks = taskService().tasks;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(
                Icons.menu,
                color: Color.fromRGBO(238, 111, 87, 1.0),
                size: 40, // Changing Drawer Icon Size
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        centerTitle: true,
        backgroundColor: const Color(0xfffffbfb),
        elevation: 0,
        title: const Text(
          "Todo List",
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.w700, color: Colors.black),
        ),
      ),
      drawer: const Drawer(
        backgroundColor: Color.fromRGBO(
          238,
          111,
          87,
          1.0,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(18.0, 0, 10, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
                child:
                    SvgPicture.asset("images/stickman-with-todo-list 1.svg")),
            const Text(
              "Tasks list",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              flex: 1,
              child: myTasks(),
            ),
            Center(
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AddTask(callback: refreshPage)),
                  );
                },
                child: Container(
                  width: 256,
                  height: 39,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: const Color(0xffee6f57)),
                  child: const Center(
                    child: Text(
                      "Create task",
                      style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.w700,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }

  Widget myTasks() {
    if (taskService().tasks.isNotEmpty) {
      return ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          Task task = tasks[index];
          return Column(
            children: [
              MyTaskCard(
                task: task,
                color: Colors.red,
                callback: refreshPage,
              ),
              const SizedBox(height: 16.0), // Adjust the height as needed
            ],
          );
        },
      );
    }
    return const Text(
      "No Tasks Yet",
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
    );
  }
}
