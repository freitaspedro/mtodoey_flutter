import 'package:flutter/material.dart';
import 'package:mtodoey_flutter/widgets/task_tile.dart';
import 'package:mtodoey_flutter/models/task_data.dart';
import 'package:provider/provider.dart';

class TasksList extends StatelessWidget {
  const TasksList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            final task = taskData.tasks[index];
            return Dismissible(
              key: UniqueKey(),
              background: Container(
                padding: const EdgeInsets.all(10.0),
                color: Colors.red,
                child: const Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'DELETE',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              direction: DismissDirection.endToStart,
              onDismissed: (direction) {
                taskData.deleteTask(task);
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Item deleted"))
                );
              },
              child: TaskTile(
                taskTitle: task.name,
                isChecked: task.isDone,
                checkboxCallback: (checkboxState) {
                  taskData.updateTask(task);
                },
              )
            );
          },
          itemCount: taskData.taskCount,
        );
      },
    );
  }
}