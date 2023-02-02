import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:get/get.dart';
import 'package:plinic2/src/component/plinic_dialog_one_button.dart';
import 'package:plinic2/src/controller/profile_controller.dart';
import 'package:plinic2/src/pages/ble_connect/components/timer_text_formatter.dart';
import 'package:plinic2/src/restclient/DeviceLogClient.dart';

class BLEController extends GetxController {
  static BLEController get to => Get.find();
  late BluetoothDevice device;
  late BluetoothState state;
  late BluetoothDeviceState deviceState;
  late BluetoothCharacteristic c;
  late BluetoothCharacteristic notify;
  late Stream<List<int>> listStream;
  FlutterBlue flutterBlue = FlutterBlue.instance;
  var bleState = BluetoothDeviceState.disconnected.obs;
  RxBool connectBle = false.obs;
  RxBool startNotify = false.obs;
  RxBool isBleDisconnect = false.obs; //BLE 연결이 중단되면
  RxBool isBleTimeOff = false.obs; //BLE 연결이 중단되면
  RxInt bleTime = 0.obs; //디바이스 사용시간 저장

  //조책임의 BLE TEST 하기 위해 별도 페이지의 BLE 연결정보를 보여준다
  RxString testBleData = ''.obs;
  RxString testBleId = ''.obs;
  RxString testBleName = ''.obs;

  RxBool isSoundOn = true.obs; //사운드 상태 값 저장
  RxBool isLowBattery = false.obs; // 배터리(부족) 상태 값 저장

  RxBool isNewDevice = false.obs;

  Dio dio = Dio();

  Rx<DeviceLogResponse> deviceLogResponse = DeviceLogResponse().obs;

  @override
  void onInit() {
    super.onInit();
    // initBle();
  }

  @override
  void onClose() async {
    await device.disconnect();
    // bleTime(0);
    // isNewDevice(false);
    // connectBle(false);
    // startNotify(false);
    // isBleDisconnect(false);
    // isBleTimeOff(false);
    super.onClose();
  }

  void startBle(value) {
    connectBle(value);
  }

  Future<void> initBle() async {
    FlutterBlue.instance.state.listen((state) async {
      if (state == BluetoothState.off) {
        //Alert user to turn on bluetooth.
      } else if (state == BluetoothState.on) {
        //if bluetooth is enabled then go ahead.
        //Make sure user's device gps is on.
        scanForDevices();
      }
    });
  }

  void scanForDevices() async {
    flutterBlue.scan().listen((scanResult) async {
      print('BLE Name : ${scanResult.device}');
      if (scanResult.device.name.toString().toLowerCase().contains('ps2')) {
        print('스캔된 BLE Name : ${scanResult.device}');
        //v1플리닉일 경우
        isNewDevice(true);
        device = scanResult.device;
        testBleId(device.id.toString());
        testBleName(device.name.toString());
        stopScanning();
      }

      if (scanResult.device.name
          .toString()
          .toLowerCase()
          .contains('plinic_single')) {
        print('스캔된 BLE Name : ${scanResult.device}');
        //v1플리닉일 경우
        isNewDevice(false);
        device = scanResult.device;
        testBleId(device.id.toString());
        testBleName(device.name.toString());
        stopScanning();
      }

      if (scanResult.device.name.toString().contains('Plinic_Dual')) {
        print('스캔된 BLE Name : ${scanResult.device}');
        //v1플리닉일 경우
        isNewDevice(false);
        device = scanResult.device;
        testBleId(device.id.toString());
        testBleName(device.name.toString());
        stopScanning();
      }
    });
  }

  void forceStopScanning() {
    flutterBlue.stopScan();
    // connectToDevice();
  }

  void stopScanning() {
    flutterBlue.stopScan();
    connectToDevice();
  }

  void connectToDevice() async {
    await device.connect();
    device.state.listen((BluetoothDeviceState onData) {
      if (onData == BluetoothDeviceState.connected) {
        bleState(onData);
      }

      if (onData == BluetoothDeviceState.disconnected) {
        print('BLE종료 됨???');
        v1_disconnect();
        device.disconnect();
        isBleDisconnect(true); //BLE연결이 종료되었다고 알려 줌
        isBleTimeOff(true); //BLE연결이 종료되었다고 알려 줌
        bleState(onData);
      }
    });

    //After connection start dicovering services
    discoverServices();
  }

  void discoverServices() async {
    var services = await device.discoverServices();
    services.forEach((service) {
      // print('---------------------service--------------------');
      service.characteristics.forEach((char) {
        if (char.uuid.toString() == '0000ffe1-0000-1000-8000-00805f9b34fb') {
          print('read찾음');
          isNewDevice(false);
          notify = char;
          setNotify();
        }

        if (char.uuid.toString() == '0000ffe2-0000-1000-8000-00805f9b34fb') {
          // print('write찾음');
          isNewDevice(false);
          c = char;
        }

        //v2기계값 UUID 변경된걸로 접근 2022-02-26  ////////////////////
        if (char.uuid.toString() == '6e400003-b5a3-f393-e0a9-e50e24dcca9e') {
          print('read찾음');
          isNewDevice(true);
          notify = char;
          setNotify();
        }

        if (char.uuid.toString() == '6e400002-b5a3-f393-e0a9-e50e24dcca9e') {
          // print('write찾음');
          c = char;
          isNewDevice(true);
        }
        //v2기계값 UUID 변경된걸로 접근 2022-02-26  ////////////////////
      });
    });
  }

  void setNotify() async {
    // print('set Notify');
    startNotify(true);
    await notify.setNotifyValue(true);
    notify.value.listen((value) {
      print(value);
      // testBleData(value.toString()); //조나현 책임 테스트용 View 데이터 2021-12-07
      // print(testBleData);
      // print('--------- notify start ------------');
      // print(value.toString());
      if (isNewDevice.value == false) {
        //구 기기일때
        var time =
            value[2].toString() + value[3].toString() + value[4].toString();
        //시간 측정용

        var powerCheck = value[5].toString(); //전원체크용
        if (time == '000' || powerCheck == '0') {
          device.disconnect();
          isBleTimeOff(true);
          return;
        }
        if (time != '000' || time != '255255255') {
          bleTime(int.parse(time));
        }
      } else {
        var time =
            value[2].toString() + value[3].toString() + value[4].toString();

        // var timeInt = int.parse(time);
        if (bleTime.value > 0) {
          //2022-02-26 v2기계는 처리속도가 빨라서 0 초부터 데이터를 받아 오고 v1기계는 1초부터 받아와서
          //아래 로직으로 기기를 보강한다.
          //시간 축적이 0보다 크면? 그때 데이터가 있는 상태니깐 정상적이 종료로 판단하여 기기전원을 off한다
          var powerCheck = value[5].toString(); //전원체크용
          if (time == '000' || powerCheck == '0') {
            device.disconnect();
            isBleTimeOff(true);
            return;
          }
        }

        if (!time.contains('000') || !time.contains('255255255')) {
          bleTime(int.parse(time));
          // print('bleTime : ${bleTime.value}');
          // print('time : $time');
        }
      }

      // 사운드 상태 값 저장
      if (value[6].toInt() == 0) {
        isSoundOn(true);
      } else if (value[6].toInt() == 1) {
        isSoundOn(false);
      }

      //배터리 상태 값 저장
      if (value[5].toInt() == 1) {
        isLowBattery(false);
      } else {
        isLowBattery(true);
      }
    }).onError((e) {
      print('BLE Steam Listener Error 발생:: $e');
    });
  }

  Future<void> bleOff() async {
    // 01 05 50 4F 46 46 31 03 2021-10-26 조책임한테 off 데이터 새로운걸로 받음
    // await c.write([0x01, 0x05, 0x4F, 0x46, 0x46, 0xFF, 0xE0, 0x03]);
    // 01 06 50 4F 46 46 D5 chs 03 //2022-02-23
    // await c.write([0x01, 0x05, 0x50, 0x4F, 0x46, 0x46, 0x31, 0x03]);
    await c.write([0x01, 0x06, 0x50, 0x4F, 0x46, 0x46, 0xD5, 0x00, 0x03]);
  }

  void bleSoundOn() async {
    //01 06 42 4F 4E 00 00 chs 03 //2022-02-23
    // 1 6 42 79 78 CE
    await c.write([0x01, 0x06, 0x42, 0x4F, 0x4E, 0x00, 0x00, 0xE6, 0x03]);
  }

  void bleSoundOff() async {
    // 01 06 42 4F 46 46 01 chs 03 //2022-02-23
    // 1 6 42 79 46 46 1 545 DD
    await c.write([0x01, 0x06, 0x42, 0x4F, 0x46, 0x46, 0x01, 0x125, 0x03]);
  }

  Future<void> v1_disconnect() async {
    await device.disconnect();
  }

  Future<DeviceLogResponse> saveDeviceLog() async {
    var client = DeviceLogClient(dio);
    await client
        .saveDeviceLog(DeviceLogRequest(
            uid: ProfileController.to.myProfile.value.uid,
            email: ProfileController.to.myProfile.value.email,
            log: [
          {'time': bleTime.value}
        ]))
        .then((value) {
      print(value);
      deviceLogResponse(value[0]);
    });
    return deviceLogResponse.value;
  }

  Future<DeviceLogResponse> test() async {
    var client = DeviceLogClient(dio);
    await client
        .saveDeviceLog(DeviceLogRequest(
            uid: ProfileController.to.myProfile.value.uid,
            email: ProfileController.to.myProfile.value.email,
            log: [
          {'time': bleTime.value}
        ]))
        .then((value) {
      print(value);
      deviceLogResponse(value[0]);
    });
    return deviceLogResponse.value;
  }

  Future<void> savedDialog(context, DeviceLogResponse deviceLogResponse) async {
    await showAnimatedDialog(
      context: context,
      barrierDismissible: false,
      animationType: DialogTransitionType.fade,
      curve: Curves.fastOutSlowIn,
      builder: (BuildContext context) {
        return PlinicDialogOneButton(
          title:
              '오늘의 사용 ${TimerTextFormatter.format(deviceLogResponse.pointsum!)}',
          content: '케어가 종료되었습니다.\n월간 플리닉으로 기록을 확인해보세요',
          buttonText: '확인',
          buttonClick: () async {
            Get.back();
            await Get.offAllNamed('/tabs');
          },
        );
      },
    );
  }
}
