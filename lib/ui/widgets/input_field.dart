import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:todomii/ui/size_config.dart';

import '../theme.dart';

class InputField extends StatelessWidget {
  const InputField({Key? key, required this.hint, required this.title, this.controller, this.widget}) : super(key: key);
  final String hint;
  final String title;
  final TextEditingController? controller;
  final Widget? widget;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const  EdgeInsets.only(top: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,style: titleStyle,),
          Container(
            padding: const EdgeInsets.only(top: 8),
            margin: const EdgeInsets.only(left: 14),

           decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: Colors.grey,

              ),
              
            ),
            child: Row(
              children: [
                Expanded(child: TextFormField(
                  controller: controller,
                  readOnly: widget!=null? true:false,
                  autofocus: false,
                  cursorColor: Get.isDarkMode? Colors.grey[100]:Colors.grey[700] ,
                  style: subtitleStyle,
                  
                  decoration: InputDecoration(
                    
                    hintText: hint,
                    hintStyle: subtitleStyle,
                    
                    enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: context.theme.backgroundColor,width: 0)) ,
                    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: context.theme.backgroundColor,width:0 ))

                  ),
                )),
                widget?? Container(),
              ],
            ),

          ),
        ],
      ),
    );
  }
}
