import 'package:flutter/material.dart';
import 'package:todomii/ui/size_config.dart';

import '../theme.dart';

class InputField extends StatelessWidget {
  const InputField({Key? key, required this.label, required this.title, this.controller, this.widget}) : super(key: key);
  final String label;
  final String title;
  final TextEditingController? controller;
  final Widget? widget;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 8),
      margin: const EdgeInsets.only(left: 14),
      width: 45,
      height: 52,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.grey,

        ),
        color:primaryClr,
      ),
      child: TextFormField(),

    );
  }
}
