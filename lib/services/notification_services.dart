import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotifyHelper {
  static const AndroidInitializationSettings InitializationSettingsAndroid =
      AndroidInitializationSettings('app_icon');
  Future onDidReceiveLocalNotification(
      int id, String body, String payload) async {}
}
