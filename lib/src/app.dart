import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plinic2/constants.dart';
import 'package:plinic2/src/controller/notification_controller.dart';
import 'package:plinic2/src/pages/check_state.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.hasError) {
          return Center(child: Text('Firebase Load Error'));
        }
        if (snapshot.connectionState == ConnectionState.done) {
          // Get.put<NotificationController>(NotificationController(),
          //     permanent: true);
          return CheckState();
        }
        return Scaffold(
          backgroundColor: white,
          body: Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
