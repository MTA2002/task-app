import 'package:flutter_application_2/models/task_class.dart';

class TaskService {
  // A list to store all tasks
  static List<Task> _tasks = [
    Task(
      title: "UI/UX App\nDesign",
      description:
          'Create a stunning and user-friendly UI/UX design for our new mobile app. Pay attention to the latest design trends, ensuring a seamless and visually appealing experience for our users. Consider the overall user journey, including onboarding, navigation, and key interactions. The design should reflect our brand identity and enhance the overall aesthetic of the application. Be creative and innovative in your approach, and don\'t forget to prioritize a responsive and accessible design.',
      deadline: DateTime.now().add(const Duration(days: 14)),
    ),
    Task(
      title: "Backend API\nDevelopment",
      description:
          'Implement the backend API for our new mobile app. Design and develop robust and scalable APIs to handle user authentication, data retrieval, and other key functionalities. Ensure security best practices are followed, and implement necessary endpoints for seamless communication between the app and the server. Conduct thorough testing and documentation to ensure a reliable and efficient backend system.',
      deadline: DateTime.now().add(const Duration(days: 14)),
    ),
    Task(
      title: "Feature\nImplementation",
      description:
          'Implement a new feature for our mobile app. Collaborate with the design team to bring creative concepts to life. Write clean and maintainable code, considering performance and user experience. Conduct thorough testing to identify and fix any bugs or issues. Work closely with the QA team to ensure the feature meets quality standards and aligns with the overall app vision.',
      deadline: DateTime.now().add(const Duration(days: 21)),
    ),
    Task(
      title: "User Testing\nand Feedback",
      description:
          'Organize user testing sessions for our mobile app. Gather feedback from a diverse group of users to understand their experience and identify areas for improvement. Analyze user feedback and collaborate with the development and design teams to implement necessary changes. Prioritize user satisfaction and usability in the app, aiming for a positive and engaging user experience.',
      deadline: DateTime.now().add(const Duration(days: 30)),
    ),
  ];

  // Getter to access the list of tasks
  List<Task> get tasks => _tasks;

  // Method to add a new task
  void addTask(Task task) {
    _tasks.add(task);
    print(_tasks.length);
  }
}
