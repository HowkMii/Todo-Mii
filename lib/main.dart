import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get_storage/get_storage.dart';
import 'package:todomii/db/db_helper.dart';
import 'package:todomii/services/theme_services.dart';
import 'package:todomii/ui/theme.dart';
import 'ui/pages/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DBHelper.initDb();
  await GetStorage.init();
  runApp(const MyApp());
  //NotifyHelper().initializeNotification();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: Themes.light,
      darkTheme: Themes.Dark,
      themeMode: ThemeServices().theme,-
      title: 'Mii Todo',
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}
