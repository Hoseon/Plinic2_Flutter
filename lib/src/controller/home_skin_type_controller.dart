import 'package:get/get.dart';

class HomeSkinTypeController extends GetxController {
  static HomeSkinTypeController get to => Get.find();

  RxInt currentTab = 0.obs;

  void changeTab(int index) {
    currentTab(index);
  }
}
