import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:flutter_application_2/main.dart';
import 'package:flutter_application_2/models/task_class.dart';

class AddTask extends StatelessWidget {
  const AddTask({super.key, required this.callback});
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
          "Create a New Task",
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.w500, color: Colors.black),
        ),
      ),
      body: FormScreen(callback: callback),
    );
  }
}

class FormScreen extends StatefulWidget {
  const FormScreen({super.key, required this.callback});
  final VoidCallback callback;
  @override
  State<StatefulWidget> createState() {
    return FormScreenState();
  }
}

class FormScreenState extends State<FormScreen> {
  String _title = "";
  DateTime _dueDate = DateTime.now();
  String _description = "";

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildTitle() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Main Task Name',
          style: TextStyle(
            color: Color.fromRGBO(238, 111, 87, 1.0),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8), // Adjust the spacing as needed
        TextFormField(
          decoration: InputDecoration(
            hintText: "Your Task Name",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          validator: (String? value) {
            if (value != null) {
              if (value.isEmpty) {
                return 'Description is Required';
              }

              return null;
            }
          },
          onSaved: (String? value) {
            if (value != null) {
              _title = value;
            }
          },
        ),
        const SizedBox(
          height: 20,
        )
      ],
    );
  }

  Widget _buildDueDate() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Due Date',
          style: TextStyle(
            color: Color.fromRGBO(238, 111, 87, 1.0),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8), // Adjust the spacing as needed
        GestureDetector(
          onTap: () {
            _pickDueDate(context);
          },
          child: AbsorbPointer(
            child: TextFormField(
              decoration: InputDecoration(
                suffixIcon: const Icon(
                  Icons.date_range,
                  color: Color.fromRGBO(
                    238,
                    111,
                    87,
                    1.0,
                  ),
                ),
                hintText: "Select Due Date",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              controller: TextEditingController(
                text: _dueDate != null ? _dueDate!.toLocal().toString() : '',
              ),
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Due Date is Required';
                }

                // You can add additional validation logic for the due date if needed

                return null;
              },
              onSaved: (String? value) {
                if (value != null && value.isNotEmpty) {
                  _dueDate = DateTime.parse(value);
                }
              },
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }

  void _pickDueDate(BuildContext context) async {
    DateTime selectedDate = DateTime.now();
    DateTime? pickedDate = await DatePicker.showDatePicker(
      context,
      showTitleActions: true,
      minTime: DateTime.now(),
      maxTime: DateTime(2100, 12, 31),
      currentTime: selectedDate,
      locale: LocaleType.en,
    );
    if (pickedDate != null && pickedDate != selectedDate) {
      setState(() {
        _dueDate = pickedDate;
      });
    }
  }

  Widget _buildDescription() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Description',
          style: TextStyle(
            color: Color.fromRGBO(238, 111, 87, 1.0),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8), // Adjust the spacing as needed
        TextFormField(
          decoration: InputDecoration(
            hintText: "Your Description Name",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          validator: (String? value) {
            if (value != null) {
              if (value.isEmpty) {
                return 'Description is Required';
              }

              return null;
            }
          },
          onSaved: (String? value) {
            if (value != null) {
              _description = value;
            }
          },
        ),
        const SizedBox(
          height: 20,
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _buildTitle(),
              _buildDueDate(),
              _buildDescription(),
              const SizedBox(height: 100),
              TextButton(
                onPressed: () {
                  if (!_formKey.currentState!.validate()) {
                    return;
                  }
                  _formKey.currentState!.save();
                  taskService().addTask(
                    Task(
                        title: _title,
                        description: _description,
                        deadline: _dueDate),
                  );
                  widget.callback();
                  Navigator.pop(context);
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    const Color.fromRGBO(238, 111, 87, 1),
                  ),
                  shape: MaterialStateProperty.all<OutlinedBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                ),
                child: Container(
                  width: 200,
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  child: const Center(
                    child: Text(
                      'Add Task',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
