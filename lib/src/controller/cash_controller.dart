import 'package:get/get.dart';

class CashController extends GetxController {
  RxBool checkSort = false.obs;

  void toggleSort(bool value) {
    checkSort(value);
    // print(value);
  }
}
