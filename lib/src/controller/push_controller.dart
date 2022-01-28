import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

class PushNotificationController extends GetxController {
  final FirebaseMessaging _messaging = FirebaseMessaging.instance;

  @override
  void onInit() {
    super.onInit();
    _getToken();
  }

  Future<void> _getToken() async {
    try {
      var token = await _messaging.getToken(
          vapidKey:
              'BHMGJJ01lSXAeXRBX_QDYJEVj5MJX6iC1VxkPBTQIP_fRWxOFdjw8_KDrWn3mBXrTXJjT3VniQdcSC1qrTp8hOY');
      print(token);
    } catch (e) {
      print(e);
    }
  }
}
