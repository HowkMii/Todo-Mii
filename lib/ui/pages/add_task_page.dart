import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:todomii/controllers/task_controller.dart';
import 'package:todomii/ui/theme.dart';
import 'package:todomii/ui/widgets/button.dart';
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
      appBar: _appBar(),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [ 
              
              InputField(
              hint: 'Enter title here', 
              title: 'Title',
              controller: _titleController,
              ),

              InputField(
              hint: 'Enter note here', 
              title: 'Note',
              controller: _noteController,
              ), 
              InputField(
              hint: DateFormat.yMd().format(_selectDate), 
              title: 'Date',
              widget: IconButton(onPressed: (){},icon:Icon(Icons.calendar_today_outlined, color: Colors.grey,)),
              ), 
              Row(
                children: [
                  Expanded(
                    child: InputField(
                    hint: _startTime, 
                    title: 'Start Time',
                    widget: IconButton(onPressed: (){},icon:Icon(Icons.access_time_rounded, color: Colors.grey,)),
                                ),
                  ),
                  const SizedBox(width:20),
                   Expanded(
                    child: InputField(
                    hint: _endtTime, 
                    title: 'End Time',
                    widget: IconButton(onPressed: (){},icon:Icon(Icons.access_time_rounded, color: Colors.grey,)),
                                ),
                  ),
           
                ],

              ), 
              InputField(
              hint:  '$_selectedRemind minutes early', 
              title: 'Remind',
              widget:Row(
                children: [
                  DropdownButton(
                    dropdownColor: Colors.blueGrey,
                    borderRadius: BorderRadius.circular(10),
                    items: remindList.map<DropdownMenuItem<String>>((value) => DropdownMenuItem<String>(value:value.toString(),child: Text('$value',style:const TextStyle(color:Colors.white ),)),).toList(),
                    icon: Icon(Icons.keyboard_arrow_down,color:Colors.grey),
                    iconSize: 32,
                    elevation: 4,
                    underline: Container(
                      height: 0,
                      
                    ),
                    style: subtitleStyle,
                    onChanged:(String? newValue){
                      setState(() {
                        _selectedRemind=int.parse(newValue!);
                      });
                    } ,
                  ),const SizedBox(width: 6,) 
                ],
              ),

              ),
               const SizedBox(height: 18,),
               InputField(
              hint:  '$_selectedRepeat', 
              title: 'Repeat',
              widget:Row(
                children: [
                  DropdownButton(
                    dropdownColor: Colors.blueGrey,
                    borderRadius: BorderRadius.circular(10),
                    items: repeatList.map<DropdownMenuItem<String>>((String value) => DropdownMenuItem<String>(value:value,child: Text(value,style:const TextStyle(color:Colors.white ),)),).toList(),
                    icon: Icon(Icons.keyboard_arrow_down,color:Colors.grey),
                    iconSize: 32,
                    elevation: 4,
                    underline: Container(
                      height: 0,
                      
                    ),
                    style: subtitleStyle,
                    onChanged:(String? newValue){
                      setState(() {
                        _selectedRepeat=newValue!;
                      });
                    } ,
                  ), const SizedBox(width: 6,) 
                ],
              ),

              ),
              const SizedBox(height: 18,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _colorPalette(),
                  MyButton(label: 'Create Task',
                  onTap: (){
                    Get.back();
                  },)

                ],
              )
            ],
            

          ),
        ),
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      /*centerTitle: true,
      title: Text('Add Task',style:headingStyle ,),*/
       leading: IconButton(
          onPressed: ()=>Get.back(),
          icon: Icon(Icons.arrow_back_ios,size: 24,color: primaryClr,),
        ),
        elevation: 0,
        backgroundColor: context.theme.backgroundColor,
        centerTitle: true,
        actions: [
          
        ],
       
    );
  }

  Column _colorPalette() {
    return Column(
                  children: [
                    
                    const SizedBox(height: 8,),
                    Wrap(
                      children:  List<Widget>.generate(4, (index) => 
                        GestureDetector(
                          onTap: (){
                            setState(() {
                              _selectedColor= index;
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(right:8.0),
                            child: CircleAvatar(
                              child:_selectedColor==index?  Icon(Icons.done,size: 16,color: Colors.white,):null,
                              backgroundColor: index ==0?
                                primaryClr: 
                                index==1?
                                pinkClr: index==2? orangeClr:primaryClr,
                                radius:14,
                                
                            ),
                          ),
                        ),
                      ),
                        
                     
                    ),

                  ],
                );
  }
}
