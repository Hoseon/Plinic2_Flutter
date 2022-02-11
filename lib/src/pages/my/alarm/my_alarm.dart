import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plinic2/constants.dart';
import 'package:plinic2/src/component/common_text.dart';
import 'package:plinic2/src/component/custom_appbar.dart';
import 'package:plinic2/src/component/loading.dart';
import 'package:plinic2/src/controller/my/MyAlarmController.dart';
import 'package:plinic2/src/controller/profile_controller.dart';

class MyAlarmPage extends GetView<MyAlarmController> {
  const MyAlarmPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put<MyAlarmController>(MyAlarmController());
    return Scaffold(
      backgroundColor: white,
      appBar: CustomAppbar('알림관리'),
      body: mainInit(),
    );
  }

  Widget mainInit() {
    return GetX<MyAlarmController>(
      init: Get.put<MyAlarmController>(
          MyAlarmController(uid: ProfileController.to.myProfile.value.uid!)),
      builder: (MyAlarmController myAlarmController) {
        if (myAlarmController.pushData.value.uid != null &&
            myAlarmController.marketData.value.uid != null) {
          //데이터가 있는지 확인
          return mainBody();
        }
        return LoadingPage();
      },
    );
  }

  Column mainBody() {
    return Column(
      children: [
        ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: spacing_xl),
          title: regularTextCommon('서비스 이용관리', 14),
          subtitle: Text('공지사항 및 서비스 이용 알림',
              style: TextStyle(
                fontFamily: 'NotoSans',
                color: grey_1,
                fontSize: 12,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
              )),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Obx(
                () => Switch(
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    activeColor: white,
                    activeTrackColor: primary,
                    value: controller.pushYN.value,
                    onChanged: (value) {
                      MyAlarmController.to.updateUserPush(value);
                    }),
              ),
            ],
          ),
        ),
        ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: spacing_xl),
          title: regularTextCommon('마케팅 수신동의', 14),
          subtitle: Text('이벤트 및 프로모션 정보 알림',
              style: TextStyle(
                fontFamily: 'NotoSans',
                color: grey_1,
                fontSize: 12,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
              )),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Obx(
                () => Switch(
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    activeColor: white,
                    activeTrackColor: primary,
                    value: controller.marketYN.value,
                    onChanged: (value) {
                      MyAlarmController.to.updateMarketUserPush(value);
                    }),
              ),
            ],
          ),
        )
      ],
    );
  }
}
