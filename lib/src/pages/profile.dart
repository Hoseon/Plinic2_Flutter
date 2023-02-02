import 'package:bootpay/bootpay.dart';
import 'package:bootpay/model/extra.dart';
import 'package:bootpay/model/payload.dart';
import 'package:bootpay/model/user.dart' as bootpayuser;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plinic2/constants.dart';
import 'package:plinic2/src/controller/login_controller.dart';
import 'package:plinic2/src/controller/notification_controller.dart';
import 'package:plinic2/src/pages/ble_test.dart';
import 'package:plinic2/src/pages/login.dart';
import 'package:plinic2/src/pages/subscribe/subscribe_manage.dart';
import 'package:plinic2/src/pages/subscribe/subscribe_regist_cart.dart';
import 'package:url_launcher/url_launcher.dart';
// import 'package:flutter_reactive_ble/flutter_reactive_ble.dart' as ble;
// import 'package:plinic2/src/pages/payment.dart';

class Profile extends StatelessWidget {
  Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(() => NotificationController());
    Get.lazyPut(() => LoginController());
    // final flutterReactiveBle = ble.FlutterReactiveBle();

    // const PLINIC_SERVICE = 'FFE0';
    // const UUID_SERVICE = 'FFE0';
    // const SWITCH_CHARACTERISTIC = 'FFE1';
    LoginController.to.toggleIsLoading();
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.userChanges(),
        builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
          if (!snapshot.hasData) {
            return Login();
          } else {
            return Center(
              child: Column(
                children: [
                  SizedBox(height: spacing_xxl2),
                  Text('${snapshot.data?.displayName}님 환영합니다.'),
                  SizedBox(height: 10.0),
                  // TextButton(
                  //   onPressed: () {
                  //     flutterReactiveBle.scanForDevices(
                  //       withServices: <ble.Uuid>[ble.Uuid.parse('FFE0')],
                  //       // scanMode: ble.ScanMode.lowLatency,
                  //     ).listen((device) {
                  //       print('스캔결과 : $device');
                  //       //DiscoveredDevice(id: B023396E-4F90-304A-06B8-CBDCFA73F227, name: Plinic_Single, serviceData: {b000: [0, 0, 0, 0]}, serviceUuids: [ffe0], manufacturerData: [72, 77, 180, 82, 169, 189, 129, 141], rssi: -59)
                  //       //code for handling results
                  //     }, onError: (Object error) {
                  //       print('error');
                  //       //code for handling error
                  //     });
                  //     // flutterBlue.startScan(
                  //     //     withServices: [],
                  //     //     // withDevices: [
                  //     //       // Guid("B023396E-4F90-304A-06B8-CBDCFA73F227")
                  //     //     // ],
                  //     //     timeout: Duration(seconds: 1),
                  //     //     scanMode: ScanMode(1),
                  //     //     allowDuplicates: false);
                  //     // var subscription =
                  //     //     flutterBlue.scanResults.listen((result) {
                  //     //       // print(result);
                  //     //   for (ScanResult r in result) {
                  //     //     print(
                  //     //         '${r.device.name} found! rssi: ${r.rssi} r : ${r.advertisementData}');
                  //     //   }
                  //     // });
                  //     // flutterBlue.stopScan();
                  //   },
                  //   child: Text('BLE 확인'),
                  // ),
                  // StreamBuilder<ble.DiscoveredDevice>(
                  //   stream: flutterReactiveBle.scanForDevices(
                  //     withServices: <ble.Uuid>[ble.Uuid.parse('FFE0')],
                  //     // scanMode: ble.ScanMode.lowLatency,
                  //   ),
                  //   builder: (BuildContext context,
                  //       AsyncSnapshot<ble.DiscoveredDevice> snapshot) {
                  //     // if (snapshot.data == null) {
                  //     //   print("널 체크");
                  //     // } else {
                  //     //   print(snapshot.data);
                  //     // }
                  //     if (snapshot.hasData) {
                  //       // print(snapshot.data!.name);
                  //       return Text('BLE연결 잘됨');
                  //     }
                  //     return CircularProgressIndicator();
                  //   },
                  // ),

                  // StreamBuilder(
                  //   stream: flutterReactiveBle.statusStream,
                  //   builder: (BuildContext context, AsyncSnapshot<ble.BleStatus> snapshot){
                  //     if(snapshot.hasData) {
                  //       print(snapshot.data);
                  //     }
                  //     return CircularProgressIndicator();
                  //   },
                  // ),
                  SizedBox(height: 10.0),
                  TextButton(
                    onPressed: () {
                      // Get.to(()=> Payment());
                    },
                    child: Text('아임포트 확인'),
                  ),
                  SizedBox(height: 10.0),
                  TextButton(
                    onPressed: () async {
                      await FirebaseAuth.instance.signOut();
                    },
                    child: Text('로그아웃'),
                  ),
                  SizedBox(height: spacing_xxl2),
                  // Obx(
                  //   () => NotificationController.to.bleState.value ==
                  //           BluetoothDeviceState.connected
                  //       ? Text(
                  //           'BLE 연결됨',
                  //           style: TextStyle(fontSize: 24),
                  //         )
                  //       : Text(
                  //           'BLE 연결 끊김',
                  //           style: TextStyle(fontSize: 24),
                  //         ),
                  // ),
                  // TextButton(
                  //   onPressed: () {
                  //     NotificationController.to.connectToDevice();
                  //   },
                  //   child: Text('BLE 커넥션'),
                  // ),
                  // SizedBox(height: spacing_xxl2),
                  // TextButton(
                  //   onPressed: () {
                  //     NotificationController.to.bleOff();
                  //   },
                  //   child: Text('BLE 전원 Off'),
                  // ),
                  // SizedBox(height: spacing_xs),
                  // TextButton(
                  //   onPressed: () {
                  //     NotificationController.to.bleSoundOn();
                  //   },
                  //   child: Text('기기 소리 ON'),
                  // ),
                  // SizedBox(height: spacing_xs),
                  // TextButton(
                  //   onPressed: () {
                  //     NotificationController.to.bleSoundOff();
                  //   },
                  //   child: Text('기기 소리 OFF'),
                  // ),
                  TextButton(
                    onPressed: () {
                      goBootpayRequest(context); //본인인증
                      // bootPayBillTest(context); //정기결제
                      // Get.toNamed('/crediCard');
                      // Get.to(SubScribeRegistCard(),
                      //     transition: Transition.native);
                    },
                    child: Text('부트페이 본인인증 테스트'),
                  ),
                  TextButton(
                    onPressed: () {
                      // goBootpayRequest(context); //본인인증
                      // bootPayBillTest(context); //정기결제
                      Get.toNamed('/crediCard');
                      // Get.to(SubScribeRegistCard(),
                      //     transition: Transition.native);
                    },
                    child: Text('부트페이 테스트'),
                  ),
                  // TextButton(
                  //   onPressed: () {
                  //     NotificationController.to.bleStanby();
                  //   },
                  //   child: Text('BLE 케어 대기모드 진입'),
                  // ),
                  // SizedBox(height: 10.0),
                  // TextButton(
                  //   onPressed: () {
                  //     NotificationController.to.bleStanAlone();
                  //   },
                  //   child: Text('BLE 스탠드얼론 모드'),
                  // ),
                  // SizedBox(height: 10.0),
                  // TextButton(
                  //   onPressed: () {
                  //     NotificationController.to.bleCare3min();
                  //   },
                  //   child: Text('BLE 케어 시작하기(3분)'),
                  // ),
                  // SizedBox(height: 10.0),
                  // TextButton(
                  //   onPressed: () {
                  //     NotificationController.to.bleCare6min();
                  //   },
                  //   child: Text('BLE 케어 시작하기(6분)'),
                  // ),
                  // SizedBox(height: 10.0),
                  // TextButton(
                  //   onPressed: () {
                  //     NotificationController.to.bleCare6min();
                  //   },
                  //   child: Text('BLE 케어 시작하기(9분)'),
                  // ),
                  SizedBox(height: 10.0),
                  TextButton(
                      onPressed: () {
                        Get.to(BleTestPage());
                      },
                      child: Text('BLE테스트')),
                  // SizedBox(height: 10.0),
                  // TextButton(
                  //     onPressed: () {
                  //       _launchURL();
                  //     },
                  //     child: Text('URL Luncher Test'))
                ],
              ),
            );
          }
        },
      ),
    );
  }

  _launchURL() async {
    const url = 'https://flutter.dev';
    if (await canLaunch('https://www.naver.com')) {
      await launch('https://www.naver.com');
    } else {
      throw 'Could not launch $url';
    }
  }

  void bootPayBillTest(BuildContext context) async {
    var payload = Payload();
    payload.androidApplicationId = '60e24e465b2948001ddc501b';
    payload.iosApplicationId = '60e24e465b2948001ddc501c';

    payload.pg = 'nicepay';
    payload.method = 'card_rebill';
    //    payload.methods = ['card', 'phone', 'vbank', 'bank'];
    payload.name = 'testUser';
    //    payload.price = 2000.0; //정기결제시 0 혹은 주석
    payload.orderId = DateTime.now().millisecondsSinceEpoch.toString();
    payload.params = {
      "callbackParam1": "value12",
      "callbackParam2": "value34",
      "callbackParam3": "value56",
      "callbackParam4": "value78",
    };

    var bootUser = bootpayuser.User();
    bootUser.username = '추호선';
    bootUser.email = 'chs1025@gmail.com';
    bootUser.area = '인천';
    bootUser.phone = '010-3602-0852';
    bootUser.addr = '인천시 연수구 옥련2동';

    var extra = Extra();
    extra.appScheme = 'bootpayFlutterSample';

    Bootpay().request(
      context: context,
      payload: payload,
      onDone: (String json) {
        print('onDone: $json');
        Get.back();
      },
      onReady: (String json) {
        //flutter는 가상계좌가 발급되었을때  onReady가 호출되지 않는다. onDone에서 처리해주어야 한다.
        print('onReady: $json');
      },
      onCancel: (String json) {
        print('onCancel: $json');
        Get.back();
      },
      onError: (String json) {
        print('onError: $json');
        Get.back();
      },
    );
  }

  void goBootpayRequest(BuildContext context) async {
    var payload = Payload();
    payload.androidApplicationId = '60e24e465b2948001ddc501b';
    payload.iosApplicationId = '60e24e465b2948001ddc501c';

    payload.pg = 'danal';
    payload.method = 'auth';
    payload.name = '본인인증';
    payload.orderId = DateTime.now().millisecondsSinceEpoch.toString();

    var extra = Extra();
    extra.appScheme = 'bootpaySample';

    Bootpay().request(
      context: context,
      payload: payload,
      onDone: (String json) {
        print('onDone: $json');
        Get.back();
      },
      onReady: (String json) {
        //flutter는 가상계좌가 발급되었을때  onReady가 호출되지 않는다. onDone에서 처리해주어야 한다.
        print('onReady: $json');
      },
      onCancel: (String json) {
        print('onCancel: $json');
        Get.back();
      },
      onError: (String json) {
        print('onError: $json');
      },
    );
  }
}

Future bleWriteTest() async {
  // final flutterReactiveBle = ble.FlutterReactiveBle();

  // final characteristic = ble.QualifiedCharacteristic(
  //   deviceId: 'xxxxx-xxxxx-xxxxx-xxxxx-xxxxx-xxxxx',
  //   serviceId: ble.Uuid.parse('FFE0'),
  //   characteristicId: ble.Uuid.parse('FFE1'),
  // );

  // await flutterReactiveBle.writeCharacteristicWithResponse(characteristic,
  //     // value: [0x01, 0x05, 0x55]).then((onValue) {
  //     value: [0x01, 0x05, 0x4F, 0x46, 0x46, 0xFF, 0xE0, 0x03]).then((onValue) {
  //   // print("BLE Success");
  // }).catchError((onError) {
  //   // print("BLE Error");
  // });
}
