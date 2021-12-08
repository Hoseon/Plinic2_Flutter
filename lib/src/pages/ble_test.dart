import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:get/get.dart';
import 'package:plinic2/constants.dart';
import 'package:plinic2/src/component/custom_appbar.dart';
import 'package:plinic2/src/controller/ble/ble_controller.dart';

class BleTestPage extends GetView<BLEController> {
  const BleTestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(BLEController());
    BLEController.to.initBle();
    return Scaffold(
      appBar: CustomAppbar('V2 BLE 테스트'),
      body: Obx(
        () => Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('BLE 연결상태'),
              BLEController.to.bleState.value == BluetoothDeviceState.connected
                  ? Text(
                      'BLE 연결됨',
                      // style: TextStyle(fontSize: 24),
                    )
                  : Text(
                      'BLE 연결 끊김',
                      // style: TextStyle(fontSize: 24),
                    ),
              Divider(),
              Text('연결된 BLE Name'),
              Text(controller.testBleName.value),
              Divider(),
              Text('연결된 BLE id'),
              Text(controller.testBleId.value),
              Divider(),
              Text('전송 데이터'),
              Text(controller.testBleData.value),
              SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('BLE명령'),
                ],
              ),
              SizedBox(height: spacing_xl),
              Container(
                alignment: Alignment.center,
                child: TextButton(
                  onPressed: () {
                    controller.bleOff();
                  },
                  child: Text('전원 Off'),
                ),
              ),
              SizedBox(height: spacing_xl),
              Container(
                alignment: Alignment.center,
                child: TextButton(
                  onPressed: () {
                    controller.bleSoundOn();
                  },
                  child: Text('Sound(Beep) On'),
                ),
              ),
              SizedBox(height: spacing_xl),
              Container(
                alignment: Alignment.center,
                child: TextButton(
                  onPressed: () {
                    controller.bleSoundOff();
                  },
                  child: Text('Sound(Beep) Off'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
