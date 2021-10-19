import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:todomii/controllers/task_controller.dart';
import 'package:todomii/ui/theme.dart';
import 'package:todomii/ui/widgets/input_field.dart';

class AddTaskPage extends StatefulWidget {
  const AddTaskPage({Key? key}) : super(key: key);

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  final TaskController _taskController = Get.put(TaskController());
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();
  DateTime _selectDate = DateTime.now();
  String _startTime = DateFormat('hh:mm a').format(DateTime.now()).toString();
  String _endtTime = DateFormat('hh:mm a').format(DateTime.now().add(const Duration(minutes: 15))).toString();
  int _selectedRemind = 5;
  List<int> remindList =[5,10,15,20];
  String _selectedRepeat ='None';
  List<String> repeatList = ['None','Daily','Weekly','Monthly'];
  int _selectedColor = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text('Add Task',style:headingStyle ,),
              InputField(
              hint: 'Enter title here', 
              title: 'Title',
              controller: _titleController,
              ),

              InputField(
              hint: 'Enter note here', 
              title: 'Note',
              controller: _titleController,
              ),
              InputField(
              hint: DateFormat.yMd().format(_selectDate), 
              title: 'Date',
              widget: IconButton(onPressed: (){},icon:Icon(Icons.calendar_today_outlined)),
              ),
            ],
            

          ),
        ),
      ),
    );
  }
}
