
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

class ReminderService {
  static final FlutterLocalNotificationsPlugin notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static Future<void> initNotifications() async {
    const androidSettings = AndroidInitializationSettings('@mipmap/ic_launcher');
    const iOSSettings = IOSInitializationSettings();
    const initSettings = InitializationSettings(android: androidSettings, iOS: iOSSettings);
    await notificationsPlugin.initialize(initSettings);
  }

  static Future<void> showNotification(String title, String body) async {
    const androidDetails = AndroidNotificationDetails(
      'channel_id',
      'channel_name',
      channelDescription: 'channel_description',
      importance: Importance.max,
      priority: Priority.high,
      color: Color(0xFF00FF00),
      playSound: true,
    );
    const iOSDetails = IOSNotificationDetails();
    const platformDetails = NotificationDetails(android: androidDetails, iOS: iOSDetails);
    await notificationsPlugin.show(0, title, body, platformDetails);
  }

  static Future<void> saveLastOdometer(int km) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('last_odometer', km);
  }

  static Future<int> getLastOdometer() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt('last_odometer') ?? 0;
  }
}
