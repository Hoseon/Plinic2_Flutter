import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';

class NotificationController extends GetxController {
  static NotificationController get to => Get.find();
  final FirebaseMessaging _messaging = FirebaseMessaging.instance;
  late BluetoothDevice device;
  late BluetoothState state;
  late BluetoothDeviceState deviceState;
  late BluetoothCharacteristic c;
  late BluetoothCharacteristic notify;
  late Stream<List<int>> listStream;
  FlutterBlue flutterBlue = FlutterBlue.instance;
  var bleState = BluetoothDeviceState.disconnected.obs;

  // final flutterReactiveBle = FlutterReactiveBle();

  @override
  void onInit() {
    super.onInit();
    _initNotification();
    _getToken();
  }

  Future<void> _initNotification() async {
    FlutterBlue.instance.state.listen((state) async {
      if (state == BluetoothState.off) {
        //Alert user to turn on bluetooth.
      } else if (state == BluetoothState.on) {
        //if bluetooth is enabled then go ahead.
        //Make sure user's device gps is on.
        scanForDevices();
      }
    });

    var settings = await _messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: true,
      criticalAlert: true,
      provisional: true,
      sound: true,
    );

    final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    final initSettingsAndroid =
        AndroidInitializationSettings('mipmap/ic_launcher');
    final initSettingsIOS = IOSInitializationSettings(
      requestSoundPermission: false,
      requestBadgePermission: false,
      requestAlertPermission: false,
    );
    final initSettings = InitializationSettings(
      android: initSettingsAndroid,
      iOS: initSettingsIOS,
    );
    await flutterLocalNotificationsPlugin.initialize(
      initSettings,
    );

    const androidPlatformChannelSpecifics = AndroidNotificationDetails(
        'your channel id', 'your channel name', 'your channel description',
        importance: Importance.high, priority: Priority.high, showWhen: true);
    const platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);

    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      print(
          '1------------------------firebase foreground message start --------------------------------');
      print(message.data);
      print(
          '1--------------------- firebase foreground message end -----------------------');
      print(
          '2------------------------firebase foreground message start --------------------------------');
      print(message.notification?.title);
      print(message.notification?.body);
      await flutterLocalNotificationsPlugin.show(0, message.notification?.title,
          message.notification?.body, platformChannelSpecifics,
          payload: 'item x');
      print(
          '2--------------------- firebase foreground message end -----------------------');
      if (message.notification != null) {
        print('Message also contained a notification: ${message.notification}');
      }
    });

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('User granted permission');
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      print('User granted provisional permission');
    } else {
      print('User declined or has not accepted permission');
    }
    print('User granted permission: ${settings.authorizationStatus}');
  }

  void scanForDevices() async {
    flutterBlue.scan().listen((scanResult) async {
      print('-----scan start-------');
      print(scanResult.device);
      print('-----scan end-------');
      if (scanResult.device.name == 'Plinic_Single') {
        // if (scanResult.device.name == 'CL555TWA') {
        final flutterLocalNotificationsPlugin =
            FlutterLocalNotificationsPlugin();
        final initSettingsAndroid =
            AndroidInitializationSettings('mipmap/ic_launcher');
        final initSettingsIOS = IOSInitializationSettings(
          requestSoundPermission: false,
          requestBadgePermission: false,
          requestAlertPermission: false,
        );
        final initSettings = InitializationSettings(
          android: initSettingsAndroid,
          iOS: initSettingsIOS,
        );
        await flutterLocalNotificationsPlugin.initialize(
          initSettings,
        );

        const androidPlatformChannelSpecifics = AndroidNotificationDetails(
            'your channel id', 'your channel name', 'your channel description',
            importance: Importance.high,
            priority: Priority.high,
            showWhen: true);
        const platformChannelSpecifics =
            NotificationDetails(android: androidPlatformChannelSpecifics);
        await flutterLocalNotificationsPlugin.show(
            0, '플리닉을 켜주셨네요??', '열심히 문질러 주세요', platformChannelSpecifics,
            payload: 'item x');

        print('found device');
        // print(scanResult.device);
        //Assigning bluetooth device
        device = scanResult.device;
        //After that we stop the scanning for device
        stopScanning();
      }
    });
  }

  void stopScanning() {
    flutterBlue.stopScan();
    connectToDevice();
    // scanSubscription.cancel();
  }

  void connectToDevice() async {
//flutter_blue makes our life easier
    await device.connect();
    device.state.listen((BluetoothDeviceState onData) {
      if (onData == BluetoothDeviceState.connected) {
        bleState(onData);
      }

      if (onData == BluetoothDeviceState.disconnected) {
        bleState(onData);
      }
    });

//After connection start dicovering services
    discoverServices();
  }

  void discoverServices() async {
    var services = await device.discoverServices();
    services.forEach((service) {
      print('---------------------service--------------------');
      // print(services);
      service.characteristics.forEach((char) {
        print(char);
        //0000ffe1-0000-1000-8000-00805f9b34fb
        // if (char.uuid.toString() == '6e400003-b5a3-f393-e0a9-e50e24dcca9e') {
        if (char.uuid.toString() == '0000ffe1-0000-1000-8000-00805f9b34fb') {
          print('read찾음');
          notify = char;
          setNotify();
        }
        // if (char.uuid.toString() == '0000ffe2-0000-1000-8000-00805f9b34fb') {
        if (char.uuid.toString() == '0000ffe2-0000-1000-8000-00805f9b34fb') {
          print('write찾음');
          c = char;
        }
      });
    });
  }

  void setNotify() async {
    print('set Notify');
    await notify.setNotifyValue(true);
    notify.value.listen((value) {
      print('--------- notify start ------------');
      // print(value.toString());
      var time =
          value[2].toString() + value[3].toString() + value[4].toString();
      var timeInt = int.parse(time);
      print(timeInt);
      // print(value[2].toString() + value[3].toString() + value[4].toString());

      print('--------- notify end ------------');
    });
  }

  void bleOff() async {
    // 01 05 50 4F 46 46 31 03 2021-10-26 조책임한테 off 데이터 새로운걸로 받음
    // await c.write([0x01, 0x05, 0x4F, 0x46, 0x46, 0xFF, 0xE0, 0x03]);
    await c.write([0x01, 0x05, 0x50, 0x4F, 0x46, 0x46, 0x31, 0x03]);
  }

  void bleSoundOn() async {
    await c.write([0x01, 0x05, 0x42, 0x4F, 0x4E, 0x00, 0xE5, 0x03]);
  }

  void bleSoundOff() async {
    await c.write([0x01, 0x05, 0x42, 0x4F, 0x46, 0x46, 0x23, 0x03]);
  }

  void bleCare3min() async {
    // if (deviceState == BluetoothDeviceState.connected) {
    // await c.write([0x24, 0x41, 0x44, 0x01, 0x02, 0x01, 0x01]);
    // await c.write([0x24, 0x41, 0x44, 0x01, 0x02, 0x03, 0x01]);
    // await c.write([0x24, 0x41, 0x44, 0x01, 0x02, 0x04, 0x01]);
    await c.write([0x24, 0x41, 0x44, 0x01, 0x02, 0x05, 0x01]);
    // await c.write([0x24414401020101]);
    // }
  }

  void bleCare6min() async {
    // if (deviceState == BluetoothDeviceState.connected) {
    // await c.write([0x24, 0x41, 0x44, 0x01, 0x02, 0x01, 0x01]);
    // await c.write([0x24, 0x41, 0x44, 0x01, 0x02, 0x03, 0x01]);
    // await c.write([0x24, 0x41, 0x44, 0x01, 0x02, 0x04, 0x01]);
    await c.write([0x24, 0x41, 0x44, 0x01, 0x02, 0x05, 0x02]);
    // await c.write([0x24414401020101]);
    // }
  }

  void bleCare9min() async {
    // if (deviceState == BluetoothDeviceState.connected) {
    // await c.write([0x24, 0x41, 0x44, 0x01, 0x02, 0x01, 0x01]);
    // await c.write([0x24, 0x41, 0x44, 0x01, 0x02, 0x03, 0x01]);
    // await c.write([0x24, 0x41, 0x44, 0x01, 0x02, 0x04, 0x01]);
    await c.write([0x24, 0x41, 0x44, 0x01, 0x02, 0x05, 0x03]);
    // await c.write([0x24414401020101]);
    // }
  }

  void bleStanby() async {
    // if (deviceState == BluetoothDeviceState.connected) {
    await c.write([0x24, 0x41, 0x44, 0x01, 0x02, 0x01, 0x01]);
    // await c.write([0x24414401020201]);
    // }
  }

  void bleStanAlone() async {
    // if (deviceState == BluetoothDeviceState.connected) {
    await c.write([0x24, 0x41, 0x44, 0x01, 0x02, 0x02, 0x01]);
    // await c.write([0x24414401020301]);
    // }
  }

  void disconnect() async {
    await device.disconnect();
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
