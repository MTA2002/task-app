import 'package:flutter/material.dart';
import 'package:flutter_application_2/models/task_class.dart';
import 'package:flutter_application_2/pages/task_details.dart';

class MyTaskCard extends StatelessWidget {
  const MyTaskCard(
      {super.key,
      required this.task,
      required this.color,
      required this.callback});
  final Task task;
  final Color color;
  final VoidCallback callback;
  @override
  Widget build(BuildContext context) {
    List<String> months = [
      "Jan",
      "Feb",
      "Mar",
      "Apr",
      "May",
      "Jun",
      "Jul",
      "Aug",
      "Sept",
      "Oct",
      "Nov",
      "Dec"
    ];
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TaskDetails(
              title: task.title,
              description: task.description,
              date:
                  "${months[task.deadline.month - 1]} ${task.deadline.day}, ${task.deadline.year}",
              task: task,
              callback: callback,
            ),
          ),
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        color: const Color.fromARGB(255, 255, 255, 255),
        elevation: 5,
        child: SizedBox(
          width: 380,
          height: 100,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(18.0, 10, 18, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 59,
                  height: 57,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.grey.shade50),
                  child: Center(
                      child: Text(
                    task.title[0],
                    style: const TextStyle(
                        fontSize: 23, fontWeight: FontWeight.w500),
                  )),
                ),
                Text(
                  task.title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Column(
                  children: [
                    Text(
                      "${months[task.deadline.month - 1]} ${task.deadline.day}, ${task.deadline.year}",
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    )
                  ],
                ),
                VerticalDivider(
                  thickness: 6,
                  color: color,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
