import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
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

void main() async {
  // runApp(MyApp()); 2021-08-25 테이블 캘린터 날짜 셋팅을 위한 주석
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  await initializeDateFormatting().then((_) => runApp(MyApp()));
}

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();

  print(
      'Handling a background message-------------------------: ${message.messageId}');
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    _checkPermissions();
  }

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
