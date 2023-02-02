import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:plinic2/src/component/appbar_title.dart';

class CustomAppbar extends StatelessWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;

  final String? appBarTitle;

  const CustomAppbar(
    this.appBarTitle, {
    Key? key,
  })  : preferredSize = const Size.fromHeight(57.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: AppbarTitle(title: appBarTitle.toString()),
      centerTitle: true,
      elevation: 0.0,
      backgroundColor: Colors.white,
      leading: IconButton(
        icon: Icon(LineIcons.arrowLeft),
        onPressed: () {
          Get.back();
        },
        color: Colors.black,
      ),
    );
  }
}
