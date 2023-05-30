import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {

  final bool? isChecked;
  final String? taskTitle;
  final Function(bool?)? checkboxCallback;
  final Function()? lonPressCallback;

  const TaskTile({super.key, this.isChecked, this.taskTitle, this.checkboxCallback, this.lonPressCallback});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: lonPressCallback,
      title: Text(
        taskTitle!,
        style: TextStyle(decoration: isChecked! ? TextDecoration.lineThrough : null),
      ),
      trailing: Checkbox(
        activeColor: Colors.purple,
        value: isChecked!,
        onChanged: checkboxCallback,
      ),
    );
  }
}

