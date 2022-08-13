import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/models/tasks_data.dart';
import 'package:todoey/widgets/task_tile.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TasksData>(
      builder: (context, taskData, child) {
        return ListView.builder(
          padding: EdgeInsets.symmetric(
            horizontal: 20.0,
          ),
          itemBuilder: (context, index) {
            return TaskTile(
              taskTitle: taskData.tasks[index].name,
              isChecked: taskData.tasks[index].isDone,
              checkboxCallBack: (newCheckboxState) {
                taskData.setToggle(index);
              },
              onLongPress: () {
                taskData.deleteTask(index);
              },
            );
          },
          itemCount: taskData.tasks.length,
        );
      },
    );
  }
}
