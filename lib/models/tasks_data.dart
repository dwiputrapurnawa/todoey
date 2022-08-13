import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:todoey/models/task.dart';

class TasksData extends ChangeNotifier {
  List<Task> _tasks = [
    Task(name: 'Buy a milk'),
    Task(name: 'Buy a coke'),
    Task(name: 'Buy a bread'),
  ];

  void addTask(String name) {
    _tasks.add(Task(name: name));
    notifyListeners();
  }

  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  void setToggle(int index) {
    _tasks[index].toggleIsDone();
    notifyListeners();
  }

  void deleteTask(int index) {
    _tasks.removeAt(index);
    notifyListeners();
  }

  int get taskCount {
    return _tasks.length;
  }
}
