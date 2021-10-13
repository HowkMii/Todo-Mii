import 'package:flutter/material.dart';
import 'ui/pages/notification_screen.dart';
import 'ui/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Mii Todo',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
