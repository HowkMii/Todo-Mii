import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:intl/intl.dart';
import 'package:todomii/models/task.dart';

class TaskController extends GetxController {
  final taskList = <Task>[
    Task(
        id: 5,
        title: 'daiki',
        note: 'somthing',
        isCompleted: 1,
        startTime: DateFormat('hh:mm a')
            .format(DateTime.now().add(const Duration(minutes: 1))),
        color: 0),
  ];
  addTask({Task? task}) {}
  getTasks() {}
}
