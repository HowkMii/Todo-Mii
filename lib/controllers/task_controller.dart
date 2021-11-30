import 'package:get/get.dart';
import 'package:todomii/models/task.dart';

class TaskController extends GetxController {
  final RxList<Task> taskList = <Task>[].obs;
  addTask({Task? task}) {}
  getTasks() {}
}
