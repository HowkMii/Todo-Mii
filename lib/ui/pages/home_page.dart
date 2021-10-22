import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:todomii/controllers/task_controller.dart';
import 'package:todomii/services/theme_services.dart';
import 'package:todomii/ui/size_config.dart';
import 'package:todomii/ui/theme.dart';
import 'package:todomii/ui/widgets/button.dart';
import 'package:todomii/ui/widgets/input_field.dart';
import 'add_task_page.dart';
import 'notification_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TaskController _taskController = Get.put(TaskController());

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: _appbarr(context),
      body: Column(
        children: [
          _addTaskBar(),
          //_addDateBar(),
          const SizedBox(height: 6),
          //_showTasks()
        ],
      )
    );
  }

  AppBar _appbarr(BuildContext context) {
    return AppBar(
        leading: IconButton(
        onPressed: (){
            ThemeServices().switTheme();
        },
        icon: Icon(Get.isDarkMode? Icons.wb_sunny_outlined:Icons.nightlight_round_outlined,size: 24,color: Get.isDarkMode?Colors.white : darkGreyClr,),),
        elevation: 0,
        backgroundColor: context.theme.backgroundColor,
        centerTitle: true,
      
    );
  }

  _addTaskBar() {
    return Container(
      margin: const EdgeInsets.only(left: 20,right: 10,top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(DateFormat.yMMMMd().format(DateTime.now()),style: subheadingStyle,),
              Text('Today',style: headingStyle,)
            ],
          ),
          MyButton(
            label: '+ Add Task',
            onTap: ()async{
              await Get.to(()=>const AddTaskPage());
              _taskController.getTasks();
            },)
        ],
      ),
    );
  }

  _addDateBar() {}

  _showTasks() {}
}
