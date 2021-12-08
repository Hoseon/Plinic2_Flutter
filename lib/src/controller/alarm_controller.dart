import 'package:get/get.dart';

class AlarmController extends GetxController {
  RxBool isToggle = true.obs;
  RxBool switchToggle1 = true.obs;
  RxBool switchToggle2 = true.obs;
  RxBool switchToggle3 = true.obs;
  RxInt currentTab = 0.obs;

  void changeToggle(value) {
    isToggle(value);
  }

  void changeTab(value) {
    currentTab(value);
  }

  void changeToggle1(value) {
    switchToggle1(value);
  }

  void changeToggle2(value) {
    switchToggle2(value);
  }

  void changeToggle3(value) {
    switchToggle3(value);
  }
}
