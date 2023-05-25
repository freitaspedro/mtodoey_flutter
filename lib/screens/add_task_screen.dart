import 'package:flutter/material.dart';
import 'package:mtodoey_flutter/constants.dart';
import 'package:mtodoey_flutter/models/task.dart';
import 'package:mtodoey_flutter/models/task_data.dart';
import 'package:provider/provider.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {

    String newTaskTitle = "";

    return Container(
      color: const Color(0xff757575),
      child: Container(
        padding: const EdgeInsets.all(20.0),
        decoration: kBoxDecoration,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(
              height: 20.0,
            ),
            TextField(
              autofocus: true,
              textAlign: TextAlign.center,
              onChanged: (newValue) {
                newTaskTitle = newValue;
              },
              decoration: kTextFieldDecoration.copyWith(
                  hintText: 'Type your task here'
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            ElevatedButton(
              onPressed: () {
                context.read<TaskData>().addTask(newTaskTitle);
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple
              ),
              child: const Text('Add'),
            ),
          ],
        ),
      ),
    );
  }
}
