import 'dart:isolate';

class AlarmConfig{
  static const String isolateName = 'isolate';
  static final ReceivePort port = ReceivePort();
}