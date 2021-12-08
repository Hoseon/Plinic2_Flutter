import 'package:flutter_blue/flutter_blue.dart';
import 'package:get/get.dart';

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
  RxInt bleTime = 0.obs; //디바이스 사용시간 저장

  //조책임의 BLE TEST 하기 위해 별도 페이지의 BLE 연결정보를 보여준다
  RxString testBleData = ''.obs;
  RxString testBleId = ''.obs;
  RxString testBleName = ''.obs;

  RxBool isSoundOn = true.obs; //사운드 상태 값 저장
  RxBool isLowBattery = false.obs; // 배터리(부족) 상태 값 저장

  @override
  void onInit() {
    super.onInit();
    // initBle();
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
      print('-----scan start-------');
      print(scanResult.device);
      print('-----scan end-------');
      if (scanResult.device.name == 'Plinic_Single') {
        //Assigning bluetooth device
        device = scanResult.device;
        // print('device name : ' + device.name);
        testBleId(device.id.toString());
        testBleName(device.name.toString());
        // print('device name : ' + device.id.toString());
        //After that we stop the scanning for device
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
        // print('BLE종료 됨???');
        isBleDisconnect(true); //BLE연결이 종료되었다고 알려 줌
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
        // print(char);
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
    // print('set Notify');
    startNotify(true);
    await notify.setNotifyValue(true);
    notify.value.listen((value) {
      // print(value);
      testBleData(value.toString()); //조나현 책임 테스트용 View 데이터 2021-12-07
      print(testBleData);
      // print('--------- notify start ------------');
      // print(value.toString());
      var time =
          value[2].toString() + value[3].toString() + value[4].toString();
      bleTime(int.parse(time));

      // 사운드 상태 값 저장
      if (value[6].toInt() == 0) {
        isSoundOn(true);
      } else if (value[6].toInt() == 1) {
        isSoundOn(false);
      }

      //배터리 상태 값 저장
      if (value[4].toInt() == 1) {
        isLowBattery(true);
      } else {
        isLowBattery(false);
      }

      // print(bleTime.value);
      // var timeInt = int.parse(time);
      // print(timeInt);
      // print(value[2].toString() + value[3].toString() + value[4].toString());
      // print('--------- notify end ------------');
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
}
