import 'package:get/get.dart';

class ShopController extends GetxController {
  static ShopController get to => Get.find();
  RxInt currentShopTab = 0.obs;

  void changeCurrentTab(int index) {
    currentShopTab(index);
    print(index);
  }
}
