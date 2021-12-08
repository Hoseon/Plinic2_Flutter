import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plinic2/constants.dart';
import 'package:plinic2/src/controller/product_detail_controller.dart';

class CustomShopDropDownMenu extends GetView<ProductDetailController> {
  const CustomShopDropDownMenu({Key? key}) : super(key: key);

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
              value: controller.currentItem.value.index,
              onChanged: (value) {
                controller.changeDropDownSearchMenu(value);
              },
              items: DropDownMenu.values
                  .map((menu) => DropdownMenuItem(
                        value: menu.index,
                        onTap: () {},
                        child: Text(menu.name,
                            style: TextStyle(
                              fontFamily: 'NotoSansKR',
                              color: grey_1,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                            )),
                      ))
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }
}
