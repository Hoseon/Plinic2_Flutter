import 'package:get/get.dart';

class CareController extends GetxController {
  RxInt careCurrentIndex = 0.obs;

  void updateCurrentIndex(index) {
    careCurrentIndex(index);
  }
}
