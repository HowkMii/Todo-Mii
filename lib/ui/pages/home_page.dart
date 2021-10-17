import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todomii/services/theme_services.dart';
import 'package:todomii/ui/size_config.dart';
import 'package:todomii/ui/widgets/button.dart';
import 'package:todomii/ui/widgets/input_field.dart';
import 'notification_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            ThemeServices().switTheme();
            
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Center(
        child:Flexible(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MyButton(label: 'Add task',onTap: (){},),
              const InputField(label: 'label', title: 'title')
            ],
          ),
      )),
    );
  }
}
