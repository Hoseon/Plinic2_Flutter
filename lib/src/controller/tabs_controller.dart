import 'package:get/get.dart';

// enum RouteName { Home, Care, Community, Shop, Temp }
enum RouteName { Care, My }

class TabsController extends GetxService {
  //앱이 꺼지기 전까지 서비스가 유지되어야 하기 때문에 GetxService로 했다
  static TabsController get to => Get.find();
  RxInt currentIndex = 0.obs;

  void changePageIndex(int index) {
    currentIndex(index);
  }
}
