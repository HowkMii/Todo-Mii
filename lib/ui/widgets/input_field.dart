import 'package:flutter/material.dart';

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
      margin: const EdgeInsets.only(left: 30),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color:primaryClr,
      ),
      child: Row(
        children: [
          TextField(),
        ],
      ),

    );
  }
}
