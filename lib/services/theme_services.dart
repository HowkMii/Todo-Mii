import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class ThemeServices {
  final GetStorage _box = GetStorage();
  final _key = 'isDarkMode';
  bool _loadThemeFromBox(){
    return false;
  }
  ThemeMode get theme =>_loadThemeFromBox()? ThemeMode.dark:ThemeMode.light;
  void switTheme(){

  }
}
