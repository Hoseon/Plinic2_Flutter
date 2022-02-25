import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:is_first_run/is_first_run.dart';
import 'package:kakao_flutter_sdk/all.dart';
import 'package:plinic2/constants.dart';
import 'package:plinic2/src/controller/notification_controller.dart';
import 'package:plinic2/src/controller/push_controller.dart';
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

    // FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  }

  // Future<void> _firebaseMessagingBackgroundHandler(
  //     RemoteMessage message) async {
  //   print('푸시 백그라운드 처리 Handling a background message: ${message.messageId}');
  // }

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
          //파이어베이스가 연결되면은 푸시토큰 정보를 얻어 온다.
          Get.put<PushNotificationController>(PushNotificationController(),
              permanent: true);
          if (isFirst == null) {
            //안드로이드는 null로 오기 때문에 null처리 안드로이드null은 최초임
            FirebaseAuth.instance.signOut();
            return CheckState();
          } else if (isFirst!) {
            //최초 로그인시에 권한, 인트로 화면을 보여줌
            FirebaseAuth.instance.signOut();
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
