import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:todomii/controllers/task_controller.dart';
import 'package:todomii/models/task.dart';
import 'package:todomii/services/notification_services.dart';
import 'package:todomii/services/theme_services.dart';
import 'package:todomii/ui/size_config.dart';
import 'package:todomii/ui/theme.dart';
import 'package:todomii/ui/widgets/button.dart';
import 'package:todomii/ui/widgets/input_field.dart';
import 'package:todomii/ui/widgets/task_tile.dart';
import 'add_task_page.dart';
import 'notification_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late NotifyHelper notifyHelper;
  @override
  void initState() {
    super.initState();
    notifyHelper = NotifyHelper();
    notifyHelper.requestIOSPermissiion();
    //notifyHelper.requestAndroidPermissiion();
    notifyHelper.initializeNotification();
  }

  final TaskController _taskController = Get.put(TaskController());
  DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        backgroundColor: context.theme.backgroundColor,
        appBar: _appbarr(context),
        body: Column(
          children: [
            _addTaskBar(),
            _addDateBar(),
            const SizedBox(height: 6),
            _showTasks()
          ],
        ));
  }

  AppBar _appbarr(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: () {
          ThemeServices().switTheme();
          notifyHelper.displayNotification(title: 'theme change', body: 'yo');
          notifyHelper.scheduledNotification();
        },
        icon: Icon(
          Get.isDarkMode
              ? Icons.wb_sunny_outlined
              : Icons.nightlight_round_outlined,
          size: 24,
          color: Get.isDarkMode ? Colors.white : darkGreyClr,
        ),
      ),
      elevation: 0,
      backgroundColor: context.theme.backgroundColor,
      centerTitle: true,
    );
  }

  _addTaskBar() {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 10, top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                DateFormat.yMMMMd().format(DateTime.now()),
                style: subheadingStyle,
              ),
              Text(
                'Today',
                style: headingStyle,
              )
            ],
          ),
          MyButton(
            label: '+ Add Task',
            onTap: () async {
              await Get.to(() => const AddTaskPage());
              ThemeServices().switTheme();
              //_taskController.getTasks();
            },
          )
        ],
      ),
    );
  }

  _addDateBar() {
    return Container(
      margin: const EdgeInsets.only(top: 9, left: 20),
      child: DatePicker(
        //_selectedDate,
        DateTime.now(),
        width: 70,
        height: 100,
        initialSelectedDate: DateTime.now(),
        selectedTextColor: Colors.white,
        selectionColor: primaryClr,
        dayTextStyle: GoogleFonts.lato(
            textStyle: const TextStyle(
                fontSize: 16, fontWeight: FontWeight.w600, color: Colors.grey)),
        dateTextStyle: GoogleFonts.lato(
            textStyle: const TextStyle(
                fontSize: 20, fontWeight: FontWeight.w600, color: Colors.grey)),
        monthTextStyle: GoogleFonts.lato(
            textStyle: const TextStyle(
                fontSize: 12, fontWeight: FontWeight.w600, color: Colors.grey)),
        onDateChange: (newDate) {
          setState(() {
            _selectedDate = newDate;
          });
        },
      ),
    );
  }

//_taskController.taskList.isEmpty
  _showTasks() {
    return Expanded(
      child: TaskTile(Task(
          title: 'daiki',
          note: 'somthing',
          isCompleted: 0,
          startTime: '22:22',
          endTime: '23:22',
          color: 1)),
      /*child: Obx(() {
      if (true) {
        return _noTaskMsg();
      } else {
        return Container(height: 0);
      }
    })*/
    );
  }

  _noTaskMsg() {
    return Stack(
      children: [
        AnimatedPositioned(
          duration: const Duration(milliseconds: 2000),
          child: SingleChildScrollView(
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              alignment: WrapAlignment.center,
              direction: SizeConfig.orientation == Orientation.landscape
                  ? Axis.horizontal
                  : Axis.vertical,
              children: [
                SizeConfig.orientation == Orientation.landscape
                    ? const SizedBox(
                        height: 6,
                      )
                    : const SizedBox(
                        height: 220,
                      ),
                SvgPicture.asset(
                  'images/task.svg',
                  color: primaryClr.withOpacity(0.5),
                  height: 90,
                  semanticsLabel: 'Task',
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 30.0, vertical: 10),
                  child: Text(
                      'You do not have any tasks yet! \n add new tasks to make your days productive.',
                      style: subtitleStyle,
                      textAlign: TextAlign.center),
                ),
                SizeConfig.orientation == Orientation.landscape
                    ? const SizedBox(
                        height: 120,
                      )
                    : const SizedBox(
                        height: 180,
                      ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
