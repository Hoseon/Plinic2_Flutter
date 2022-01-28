import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:is_first_run/is_first_run.dart';
import 'package:plinic2/constants.dart';
import 'package:plinic2/src/controller/notification_controller.dart';
import 'package:plinic2/src/pages/check_login.dart';
import 'package:plinic2/src/pages/check_state.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  bool? isFirst;

  @override
  void initState() {
    super.initState();
    isFirstCheck();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      //파이어베이스 연동
      future: Firebase.initializeApp(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.hasError) {
          return Center(child: Text('Firebase Load Error'));
        }
        if (snapshot.connectionState == ConnectionState.done) {
          // Get.put<NotificationController>(NotificationController(),
          //     permanent: true);
          print('앱 처음사용 유무: $isFirst');
          if (isFirst!) {
            //최초 로그인시에 권한, 인트로 화면을 보여줌
            return CheckState();
          } else {
            //최초 로그인이 아니라면 바로 로그인 화면으로 이동함
            return CheckLogin();
            // Get.offAll(() => CheckLogin(), transition: Transition.noTransition);
          }
        }
        return Scaffold(
          backgroundColor: white,
          body: Center(child: CircularProgressIndicator()),
        );
      },
    );
  }

  void isFirstCheck() async {
    isFirst = await IsFirstRun.isFirstRun();
  }
}
