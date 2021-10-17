import 'package:flutter/material.dart';
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,style: titleStyle,),
        Container(
          padding: const EdgeInsets.only(top: 8),
          margin: const EdgeInsets.only(left: 16),

         /*decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: Colors.grey,

            ),
            
          ),*/
          child: Row(
            children: [
              Expanded(child: TextFormField(
                controller: controller,
                autofocus: false,
                decoration: InputDecoration(
                  hintText: hint,
                  hintStyle: subtitleStyle,
                  enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: context.theme.backgroundColor)) ,
                  focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: context.theme.backgroundColor))

                ),
              )),
              widget?? Container(),
            ],
          ),

        ),
      ],
    );
  }
}
