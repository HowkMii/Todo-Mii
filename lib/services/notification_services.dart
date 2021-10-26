import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';

class NotifyHelper {
  static const AndroidInitializationSettings InitializationSettingsAndroid =
      AndroidInitializationSettings('app_icon');
  Future onDidReceiveLocalNotification(
      int id, String body, String payload) async {
    Get.dialog(Text(body));
  }
}
