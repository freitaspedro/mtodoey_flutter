import 'package:flutter/material.dart';

class TaskTile extends StatefulWidget {
  const TaskTile({
    super.key,
  });

  @override
  State<TaskTile> createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> {
  bool? isChecked = false;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        'This is a task',
        style: TextStyle(decoration: isChecked! ? TextDecoration.lineThrough : null),
      ),
      trailing: TaskCheckbox(
          checkboxState: isChecked!,
          toggleCheckboxState: (bool? checkboxState) {
            setState(() {
              isChecked = checkboxState;
            });
          },
      ),
    );
  }
}

class TaskCheckbox extends StatelessWidget {

  final bool checkboxState;
  final Function(bool?)? toggleCheckboxState;

  const TaskCheckbox({required this.checkboxState, this.toggleCheckboxState, super.key});

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      activeColor: Colors.purple,
      value: checkboxState,
      onChanged: toggleCheckboxState,
    );
  }
}