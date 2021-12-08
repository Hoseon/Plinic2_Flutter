import 'package:get/get.dart';
import 'package:plinic2/src/controller/ble/ble_controller.dart';

class BleBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<BLEController>(BLEController());
  }
}
