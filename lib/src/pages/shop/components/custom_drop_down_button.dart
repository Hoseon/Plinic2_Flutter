import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plinic2/constants.dart';
import 'package:plinic2/src/controller/product_detail_controller.dart';

class CustomDropDownButton extends StatelessWidget {
  const CustomDropDownButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(DropDownList(), transition: Transition.fadeIn, opaque: false);
      },
      child: Text('기본메뉴'),
    );
  }
}

class DropDownList extends GetView<ProductDetailController> {
  const DropDownList({Key? key}) : super(key: key);

  Widget _dropDownList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: DropDownMenu.values
          .map((menu) => GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Container(
                  padding: EdgeInsets.symmetric(
                      vertical: 10, horizontal: spacing_xl),
                  child: Text(menu.name),
                ),
              ))
          .toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        child: Stack(
          children: [
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              top: 0,
              child: GestureDetector(
                onTap: Get.back,
                child: Container(
                  color: Colors.transparent,
                ),
              ),
            ),
            Positioned(
              left: 0,
              top: controller.dropdownPositionY,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                  color: Colors.white,
                ),
                child: Container(width: Get.size.width, child: _dropDownList()),
              ),
            )
          ],
        ),
      ),
    );
  }
}
