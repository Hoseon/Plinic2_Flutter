import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:plinic2/src/controller/profile_controller.dart';

class PushNotificationController extends GetxController {
  final FirebaseMessaging messaging = FirebaseMessaging.instance;

  @override
  void onInit() {
    super.onInit();
    initNotification();
    _getToken();
  }

  void initNotification() async {
    var settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
    print('User granted permission: ${settings.authorizationStatus}');

    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      // print('1-------firebase foreground message start ------');
      // print(message.notification?.title);
      print('1--firebase foreground message end --');
      print('2---firebase foreground message start ---');
      print(message.notification?.title);
      print(message.notification?.body);
      // await flutterLocalNotificationsPlugin.show(0, message.notification?.title,
      //     message.notification?.body, platformChannelSpecifics,
      //     payload: 'item x');
      // print(
      //     '2--------------------- firebase foreground message end -----------------------');
      // if (message.notification != null) {
      //   print('Message also contained a notification: ${message.notification}');
      // }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) async {
      print('메세지 눌러서 열렸을때 앱');
      print(message.notification?.title);
      print(message.notification?.body);
    });
    // FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  }

  Future<void> _getToken() async {
    try {
      var token = await messaging.getToken(
          vapidKey:
              'BHMGJJ01lSXAeXRBX_QDYJEVj5MJX6iC1VxkPBTQIP_fRWxOFdjw8_KDrWn3mBXrTXJjT3VniQdcSC1qrTp8hOY');
      print('Plinic2 User Token : $token');
      ProfileController.to.setPushToken(token);
    } catch (e) {
      print(e);
    }
  }

  // Future<void> _firebaseMessagingBackgroundHandler(
  //     RemoteMessage message) async {
  //   print('푸시 백그라운드 처리 Handling a background message: ${message.messageId}');
  // }
}
