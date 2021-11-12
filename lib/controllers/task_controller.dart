import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:todomii/models/task.dart';

class TaskController extends GetxController {
  final taskList = <Task>[
    Task(
        title: 'daiki',
        note: 'somthing',
        isCompleted: 1,
        startTime: '22:22',
        endTime: '23:22',
        color: 0),
    Task(
        title: 'daiki',
        note: 'somthing',
        isCompleted: 1,
        startTime: '22:22',
        endTime: '23:22',
        color: 1),
    Task(
        title: 'daiki',
        note: 'somthing',
        isCompleted: 0,
        startTime: '22:22',
        endTime: '23:22',
        color: 2),
    Task(
        title: 'daiki',
        note: 'somthing',
        isCompleted: 0,
        startTime: '22:22',
        endTime: '23:22',
        color: 1)
  ];
  getTasks() {}
}
