import 'package:get/get.dart';
import 'package:plinic2/src/controller/network_controller.dart';
import 'package:plinic2/src/controller/profile_controller.dart';
import 'package:plinic2/src/controller/tabs_controller.dart';

class TabsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TabsController>(() => TabsController());
    Get.lazyPut<NetworkController>(() => NetworkController());
    Get.lazyPut<NetworkController>(() => NetworkController());
    Get.lazyPut<ProfileController>(() => ProfileController());
  }
}
