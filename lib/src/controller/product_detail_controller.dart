import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum DropDownMenu { DEFAULT, MENU1, MENU2, MENU3 }
enum DropDownCuponMenu { DEFAULT, MENU1, MENU2, MENU3 }

extension DropDownMenuExtensioin on DropDownMenu {
  String get name {
    switch (this) {
      case DropDownMenu.DEFAULT:
        return '옵션을 선택해주세요';
      case DropDownMenu.MENU1:
        return '토너 + 스킨';
      case DropDownMenu.MENU2:
        return '토너 + 토너';
      case DropDownMenu.MENU3:
        return '스킨 + 스킨';
    }
  }
}

extension DropDownCuponMenuExtensioin on DropDownCuponMenu {
  String get name {
    switch (this) {
      case DropDownCuponMenu.DEFAULT:
        return '옵션을 선택해주세요';
      case DropDownCuponMenu.MENU1:
        return '아메리카노';
      case DropDownCuponMenu.MENU2:
        return '카페라떼(+1,000원)';
      case DropDownCuponMenu.MENU3:
        return '콜드브루(+1,500원)';
    }
  }
}

class ProductDetailController extends GetxController {
  Rx<DropDownMenu> currentItem = DropDownMenu.DEFAULT.obs;
  Rx<DropDownCuponMenu> currentCuponItem = DropDownCuponMenu.DEFAULT.obs;

  final dropKey = GlobalKey();

  static ProductDetailController get to => Get.find();

  RxInt currentTab = 0.obs;
  RxBool more = false.obs;

  void changeTab(index) {
    currentTab(index);
  }

  void changeMore(value) {
    more(value);
  }

  void changeDropDownSearchMenu(itemIndex) {
    var selectedItem =
        DropDownMenu.values.where((menu) => menu.index == itemIndex).first;
    currentItem(selectedItem);
  }

  void changeDropDownCuponMenu(itemIndex) {
    var selectedCuponItem =
        DropDownCuponMenu.values.where((menu) => menu.index == itemIndex).first;
    currentCuponItem(selectedCuponItem);
  }

  double get dropdownPositionY {
    var box = dropKey.currentContext!.findRenderObject()!;
    var translation = box.getTransformTo(null).getTranslation();
    return box.paintBounds
        .shift(Offset(translation.x, translation.y))
        .bottomCenter
        .dy;
  }
}
