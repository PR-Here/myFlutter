import 'dart:developer';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'model/remider_model.dart';
import 'app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:timezone/data/latest_10y.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:flutter_dropdown_alert/dropdown_alert.dart';

FlutterLocalNotificationsPlugin notificationsPlugin =
    FlutterLocalNotificationsPlugin();
Future<void> main() async {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  initializeTimeZones();
  await GetStorage.init();

  await Hive.initFlutter();
  Hive.registerAdapter(
    ReminderModelAdapter(),
  );

  AndroidInitializationSettings androidSettings =
      const AndroidInitializationSettings(
    '@mipmap/ic_launcher',
  );
  DarwinInitializationSettings iosSettings = const DarwinInitializationSettings(
    requestAlertPermission: true,
    requestBadgePermission: true,
    requestSoundPermission: true,
    requestCriticalPermission: true,
  );

  InitializationSettings initializationSettings =
      InitializationSettings(android: androidSettings, iOS: iosSettings);

  bool? initialized =
      await notificationsPlugin.initialize(initializationSettings);

  log('Notification $initialized');
  await AndroidAlarmManager.initialize();
  log('AndroidAlarmManager');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sabriye',
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      builder: (context, child) => Stack(
        children: [
          child!,
          DropdownAlert()
        ],
      ),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
