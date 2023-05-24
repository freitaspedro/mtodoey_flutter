import 'package:flutter/material.dart';
import 'package:mtodoey_flutter/constants.dart';

class AddTaskScreen extends StatelessWidget {

  final Function addTaskCallback;

  const AddTaskScreen({super.key, required this.addTaskCallback});

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
                addTaskCallback(newTaskTitle);
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
