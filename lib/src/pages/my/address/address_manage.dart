import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:get/get.dart';
import 'package:plinic2/constants.dart';
import 'package:plinic2/src/component/custom_appbar.dart';
import 'package:plinic2/src/component/plinic_dialog_two_button.dart';
import 'package:plinic2/src/controller/profile_controller.dart';
import 'package:plinic2/src/pages/my/address/address.dart';

class AddressManagePage extends StatelessWidget {
  const AddressManagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar('배송지관리'),
      bottomNavigationBar: bottomButton(context),
      backgroundColor: Colors.white,
      body: ListView.builder(
        itemCount: 3,
        itemBuilder: (_, index) {
          if (index == 0) {
            return Column(
              children: [
                SizedBox(height: spacing_xl),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
                  child: Row(
                    children: [
                      Text(
                        '배송지',
                        style: TextStyle(
                          fontFamily: 'NotoSansKR',
                          color: Color(0xff000000),
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                      SizedBox(width: spacing_xxs),
                      Text('11',
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            color: Color(0xff000000),
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            fontStyle: FontStyle.normal,
                          ))
                    ],
                  ),
                ),
              ],
            );
          }
          return AddressCard(
            isDefault: true,
            name: Get.find<ProfileController>().myProfile.value.name.toString(),
            address: '서울특별시 송파구 송파대로 453, 레이크빌 빌딩 402호',
            phoneNumber: '010-1234-5678',
          );
        },
      ),
    );
  }

  ConstrainedBox bottomButton(BuildContext context) {
    return ConstrainedBox(
      constraints:
          BoxConstraints.tightFor(width: Get.mediaQuery.size.width, height: 60),
      child: ElevatedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
                borderRadius: BorderRadius.zero, side: BorderSide.none),
          ),
          elevation: MaterialStateProperty.all(0.0),
          backgroundColor: MaterialStateProperty.all(primaryColor),
        ),
        onPressed: () {
          Get.to(() => AddressPage(), transition: Transition.native);
        },
        child: Text(
          '배송지 추가',
          style: TextStyle(
            fontFamily: 'NotoSansKR',
            color: Color(0xffffffff),
            fontSize: 14,
            fontWeight: FontWeight.w700,
            fontStyle: FontStyle.normal,
          ),
        ),
      ),
    );
  }
}

class AddressCard extends StatelessWidget {
  const AddressCard({
    Key? key,
    this.isDefault,
    this.name,
    this.address,
    this.phoneNumber,
  }) : super(key: key);

  final bool? isDefault;
  final String? name;
  final String? address;
  final String? phoneNumber;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: spacing_xxl2),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    child: Text(
                      name.toString(),
                      style: TextStyle(
                        fontFamily: 'NotoSansKR',
                        color: Color(0xff000000),
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.normal,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  SizedBox(width: spacing_xxs),
                  if (isDefault == true)
                    Container(
                      alignment: Alignment.center,
                      width: 52,
                      height: 20,
                      decoration: BoxDecoration(
                        color: Color(0xff3b6693),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text('기본 배송지',
                          style: TextStyle(
                            fontFamily: 'NotoSansKR',
                            color: white,
                            fontSize: 9,
                            fontWeight: FontWeight.w700,
                            fontStyle: FontStyle.normal,
                          )),
                    )
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: spacing_m),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
          child: Row(
            children: [
              Text(
                address.toString(),
                style: TextStyle(
                  fontFamily: 'NotoSansKR',
                  color: Color(0xff000000),
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: spacing_xs),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
          child: Row(
            children: [
              Text(
                phoneNumber.toString(),
                style: TextStyle(
                  fontFamily: 'NotoSansKR',
                  color: Color(0xff000000),
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: spacing_m),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Theme(
                data: ThemeData(splashColor: Colors.red),
                child: Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                        overlayColor:
                            MaterialStateProperty.resolveWith((states) {
                          return states.contains(MaterialState.pressed)
                              ? grey_2
                              : null;
                        }),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.white),
                        elevation: MaterialStateProperty.all(0.0),
                        side: MaterialStateProperty.all(
                            BorderSide(color: grey_2))),
                    child: Text('수정',
                        style: TextStyle(
                          fontFamily: 'NotoSansKR',
                          color: black,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                        )),
                  ),
                ),
              ),
              SizedBox(width: spacing_xxs),
              Expanded(
                child: ElevatedButton(
                  onPressed: () async {
                    await showAnimatedDialog(
                      context: context,
                      barrierDismissible: true,
                      animationType: DialogTransitionType.slideFromBottomFade,
                      curve: Curves.fastOutSlowIn,
                      builder: (BuildContext context) {
                        return PlinicDialogTwoButton(
                          button1Text: '삭제할께요',
                          button2Text: '취소',
                          title: '알림',
                          content: '배송지를 삭제하시겠습니까?',
                          button1Click: () {
                            Get.back();
                          },
                          button2Click: () {
                            Get.back();
                          },
                        );
                      },
                    );
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(primary_light),
                    elevation: MaterialStateProperty.all(0.0),
                  ),
                  child: Text('삭제',
                      style: TextStyle(
                        fontFamily: 'NotoSansKR',
                        color: white,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      )),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: spacing_xxl),
        Divider(
          color: grey_3,
          thickness: 15,
        )
      ],
    );
  }

  void twoButton() {}
}
