import 'package:flutter/material.dart';
import 'package:flutter_application_2/main.dart';
import 'package:flutter_application_2/models/task_class.dart';

class TaskDetails extends StatelessWidget {
  const TaskDetails(
      {Key? key,
      required this.title,
      required this.description,
      required this.date,
      required this.task,
      required this.callback})
      : super(key: key);
  final Task task;
  final String title;
  final String description;
  final String date;
  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color(0xfffffbfb),
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Color.fromRGBO(238, 111, 87, 1.0),
        ),
        title: const Text(
          "Task Details",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(28.0, 0, 10, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                flex: 1,
                child:
                    Center(child: Image.asset("images/shopping-list 1.png"))),
            const Text(
              "Title ",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              width: 351,
              height: 65,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: const Color(0xfff1eeee),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              "Description ",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              width: 351,
              height: 155,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: const Color(0xfff1eeee),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(17, 13, 10, 13),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Text(
                    description,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              "Date ",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              width: 351,
              height: 65,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: const Color(0xfff1eeee),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                child: Text(
                  date,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                // Assuming 'task' is the current task you are displaying details for
                // Remove the task, trigger the callback, and close the details screen
                taskService().tasks.remove(task);
                callback();
                Navigator.pop(context);
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                  const Color.fromRGBO(238, 111, 87, 1),
                ),
                shape: MaterialStateProperty.all<OutlinedBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              child: Container(
                width: double.infinity,
                child: const Center(
                  child: Text(
                    'Mark as Done',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
