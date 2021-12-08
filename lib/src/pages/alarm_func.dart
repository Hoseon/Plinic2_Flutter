// import 'dart:io';
// import 'dart:isolate';
// import 'dart:math';
// import 'dart:ui';

// import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
// import 'package:flutter/material.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:plinic2/src/config/alarm_config.dart';

// class AlarmFunc extends StatefulWidget {
//   @override
//   _AlarmFuncState createState() => _AlarmFuncState();
// }

// class _AlarmFuncState extends State<AlarmFunc> {
//   int _counter = 0;
//   @override
//   void initState() {
//     if(Platform.isAndroid){
//       Permission.reminders.request();
//       AndroidAlarmManager.initialize();
//       AlarmConfig.port.listen((_){
//         print("-------------------------------------Alarm Listen");
//         _incrementCounter();
//       });
//     }
//     super.initState();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: TextButton(
//         child: Text("알람 : ${this._counter}"),
//         onPressed: () async{
//           if(Platform.isAndroid){
//             int vid = Random().nextInt(pow(2, 31).toInt());
//             print("---------------------------------------SETTINGS : $vid");
//             bool check = await AndroidAlarmManager.periodic(
//               const Duration(seconds: 3),
//               vid,
//               callback,
//             );
//             print("---------------------------------AndroidAlarmManager Start ? $check");
//           }
//         },
//       ),
//     );
//   }
//   void _incrementCounter(){
//     print("----------------------------------------Func Start");
//     setState(() {
//       _counter++;
//     });
//     return;
//   }
//   static SendPort? uiSendPort;

//   static Future<void> callback() async{
//     print('---------------------------------------Alarm fired!');
//     uiSendPort ??= IsolateNameServer.lookupPortByName(AlarmConfig.isolateName);
//     uiSendPort?.send(null);
//   }

// }