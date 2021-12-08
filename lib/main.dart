import 'dart:io';

// import 'package:background_fetch/background_fetch.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:plinic2/constants.dart';
import 'package:plinic2/src/controller/network_controller.dart';
import 'package:plinic2/src/controller/profile_controller.dart';
import 'package:plinic2/src/controller/tabs_controller.dart';
import 'package:plinic2/src/routes/app_pages.dart';
import 'package:plinic2/src/splash.dart';

// void backgroundFetchHeadlessTask(HeadlessTask task) async {
//   String taskId = task.taskId;
//   bool isTimeout = task.timeout;
//   if (isTimeout) {
//     // This task has exceeded its allowed running-time.
//     // You must stop what you're doing and immediately .finish(taskId)
//     // print("[BackgroundFetch] Headless task timed-out: $taskId");
//     BackgroundFetch.finish(taskId);
//     return;
//   }
//   print('[BackgroundFetch] Headless event received.');
//   // Do your work here...
//   final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
//   final initSettingsAndroid =
//       AndroidInitializationSettings('mipmap/ic_launcher');
//   final initSettingsIOS = IOSInitializationSettings(
//     requestSoundPermission: false,
//     requestBadgePermission: false,
//     requestAlertPermission: false,
//   );
//   final initSettings = InitializationSettings(
//     android: initSettingsAndroid,
//     iOS: initSettingsIOS,
//   );
//   await flutterLocalNotificationsPlugin.initialize(
//     initSettings,
//   );

//   const androidPlatformChannelSpecifics = AndroidNotificationDetails(
//       'your channel id', 'your channel name', 'your channel description',
//       importance: Importance.high, priority: Priority.high, showWhen: true);
//   const platformChannelSpecifics =
//       NotificationDetails(android: androidPlatformChannelSpecifics);
//   await flutterLocalNotificationsPlugin.show(
//       0, '백그라운드 테스트??', '15분 지났나? 잘되나?', platformChannelSpecifics,
//       payload: 'item x');
//   BackgroundFetch.finish(taskId);
// }

void main() async {
  // runApp(MyApp()); 2021-08-25 테이블 캘린터 날짜 셋팅을 위한 주석
  await initializeDateFormatting().then((_) => runApp(MyApp()));
  // BackgroundFetch.registerHeadlessTask(backgroundFetchHeadlessTask);
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // bool _enabled = true;
  // int _status = 0;
  // List<DateTime> _events = [];
  @override
  void initState() {
    super.initState();
    _checkPermissions();
    // initPlatformState();
    // _onClickEnable(true);
    // _onClickStatus();
  }

  // void _onClickEnable(enabled) {
  //   setState(() {
  //     _enabled = enabled;
  //   });
  //   if (enabled) {
  //     BackgroundFetch.start().then((int status) {
  //       print('[BackgroundFetch] start success: $status');
  //     }).catchError((e) {
  //       print('[BackgroundFetch] start FAILURE: $e');
  //     });
  //   } else {
  //     BackgroundFetch.stop().then((int status) {
  //       print('[BackgroundFetch] stop success: $status');
  //     });
  //   }
  // }

  // void _onClickStatus() async {
  //   int status = await BackgroundFetch.status;
  //   print('[BackgroundFetch] status: $status');
  //   setState(() {
  //     _status = status;
  //   });
  // }

  // Future<void> initPlatformState() async {
  //   // Configure BackgroundFetch.
  //   int status = await BackgroundFetch.configure(
  //       BackgroundFetchConfig(
  //           minimumFetchInterval: 1,
  //           stopOnTerminate: false,
  //           enableHeadless: true,
  //           requiresBatteryNotLow: false,
  //           requiresCharging: false,
  //           requiresStorageNotLow: false,
  //           requiresDeviceIdle: false,
  //           requiredNetworkType: NetworkType.NONE), (String taskId) async {
  //     // <-- Event handler
  //     // This is the fetch-event callback.
  //     print("[BackgroundFetch] Event received $taskId");
  //     setState(() {
  //       _events.insert(0, new DateTime.now());
  //     });
  //     // IMPORTANT:  You must signal completion of your task or the OS can punish your app
  //     // for taking too long in the background.
  //     BackgroundFetch.finish(taskId);
  //   }, (String taskId) async {
  //     // <-- Task timeout handler.
  //     // This task has exceeded its allowed running-time.  You must stop what you're doing and immediately .finish(taskId)
  //     print("[BackgroundFetch] TASK TIMEOUT taskId: $taskId");
  //     BackgroundFetch.finish(taskId);
  //   });
  //   print('[BackgroundFetch] configure success: $status');
  //   setState(() {
  //     _status = status;
  //   });

  //   // If the widget was removed from the tree while the asynchronous platform
  //   // message was in flight, we want to discard the reply rather than calling
  //   // setState to update our non-existent appearance.
  //   if (!mounted) return;
  // }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      locale: Get.deviceLocale,
      defaultTransition: Transition.fadeIn,
      initialRoute: Routes.INITIAL,
      getPages: AppPages.pages,
      title: 'Plinic 2.0',
      theme: ThemeData.light().copyWith(
          primaryColor: primaryColor,
          primaryColorDark: primary_dark,
          primaryColorLight: primary_light),
      home: SplashPage(),
      initialBinding: BindingsBuilder(() {
        Get.put<ProfileController>(ProfileController(), permanent: true);
        Get.put<TabsController>(TabsController(), permanent: true);
        Get.put<NetworkController>(NetworkController(), permanent: true);
      }),
    );
  }
}

void _checkPermissions() async {
  if (Platform.isAndroid) {
    if (await Permission.contacts.request().isGranted) {}
    var statuses = await [
      Permission.location,
      Permission.bluetooth,
      Permission.photos,
      Permission.photosAddOnly,
      Permission.reminders,
      Permission.systemAlertWindow
    ].request();
    // print(statuses[Permission.location]);
    // print(statuses[Permission.bluetooth]);
  }

  if (Platform.isIOS) {
    if (await Permission.contacts.request().isGranted) {}
    Map<Permission, PermissionStatus> statuses = await [
      Permission.location,
      Permission.bluetooth,
      Permission.photos,
      Permission.photosAddOnly,
      Permission.reminders,
      Permission.systemAlertWindow
    ].request();
    // print(statuses[Permission.location]);
    // print(statuses[Permission.bluetooth]);
  }
}
