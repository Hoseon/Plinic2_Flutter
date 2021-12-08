import 'package:get/get.dart';

class FaqController extends GetxController {
  RxInt tabIndex = 1.obs;

  void updateTabIndex(index) {
    tabIndex(index);
    print(tabIndex);
  }


}