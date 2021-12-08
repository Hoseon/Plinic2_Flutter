import 'dart:async';

import 'package:flutter/material.dart';
import 'package:plinic2/constants.dart';
import 'package:plinic2/src/pages/ble_connect/components/timer_text_formatter.dart';

class TimerText extends StatefulWidget {
  TimerText({this.stopwatch});
  final Stopwatch? stopwatch;

  @override
  TimerTextState createState() => TimerTextState(stopwatch: stopwatch!);
}

class TimerTextState extends State<TimerText> {
  late Timer timer;
  Stopwatch? stopwatch;

  TimerTextState({this.stopwatch}) {
    timer = Timer.periodic(Duration(milliseconds: 30), callback);
  }

  void callback(Timer timer) {
    if (stopwatch!.isRunning) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    var timerTextStyle = const TextStyle(
      fontFamily: 'Roboto',
      color: white,
      fontSize: 40,
      fontWeight: FontWeight.w700,
      fontStyle: FontStyle.normal,
    );
    var formattedTime =
        TimerTextFormatter.format(stopwatch!.elapsedMilliseconds);
    return Text(formattedTime, style: timerTextStyle);
  }
}
