import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plinic2/constants.dart';
import 'package:plinic2/src/controller/product_detail_controller.dart';

class CustomShopDropDownMenuCupon extends GetView<ProductDetailController> {
  const CustomShopDropDownMenuCupon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Padding(
        padding: EdgeInsets.symmetric(horizontal: spacing_xl),
        child: InputDecorator(
          decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
              contentPadding: EdgeInsets.symmetric(horizontal: spacing_xs)),
          child: DropdownButtonHideUnderline(
            child: DropdownButton(
              // iconEnabledColor: primary,
              // iconDisabledColor: primary,
              // dropdownColor: primary,
              value: controller.currentCuponItem.value.index,
              onChanged: (value) {
                controller.changeDropDownCuponMenu(value);
              },
              items: DropDownCuponMenu.values
                  .map((menu) => DropdownMenuItem(
                        value: menu.index,
                        onTap: () {},
                        child: Text(
                          menu.name,
                          style: TextStyle(
                            fontFamily: 'NotoSansKR',
                            color: grey_1,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                      ))
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }
}
