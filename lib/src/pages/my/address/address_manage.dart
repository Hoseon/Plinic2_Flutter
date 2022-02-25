import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:plinic2/constants.dart';
import 'package:plinic2/src/component/custom_appbar.dart';
import 'package:plinic2/src/component/loading.dart';
import 'package:plinic2/src/component/plinic_dialog_two_button.dart';
import 'package:plinic2/src/controller/my/myAddress_controller.dart';
import 'package:plinic2/src/controller/profile_controller.dart';
import 'package:plinic2/src/pages/my/address/address.dart';
import 'package:plinic2/src/pages/my/address/address_update.dart';
import 'package:plinic2/src/restclient/UserClient.dart';

class AddressManagePage extends StatelessWidget {
  const AddressManagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar('배송정보관리'),
      bottomNavigationBar: bottomButton(context),
      backgroundColor: Colors.white,
      // body: mainBody(),
      body: initAddress(),
    );
  }

  Widget initAddress() {
    return GetX<MyAddressController>(
      init: Get.put<MyAddressController>(MyAddressController()),
      builder: (MyAddressController myAddressController) {
        if (myAddressController.isLoading.value == false) {
          if (myAddressController.userAddress.isNotEmpty) {
            return mainBody(myAddressController);
            // Text('데이터 있음 ${myAddressController.userAddress.length}');
          }
          if (myAddressController.userAddress.isEmpty) {
            return emptyAddress();
          }
        }
        return LoadingPage();
      },
    );
  }

  Widget emptyAddress() {
    return Column(
      children: [
        SizedBox(height: spacing_l),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
          child: Row(
            children: [
              Icon(LineIcons.commentDots, size: 20),
              SizedBox(width: 5.5),
              Text(
                '등록된 배송정보가 존재하지 않습니다.',
                style: TextStyle(
                  fontFamily: 'NotoSans',
                  color: black,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget mainBody(MyAddressController myAddressController) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                '배송지',
                style: TextStyle(
                  fontFamily: 'NotoSans',
                  color: black,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                ),
              ),
              SizedBox(width: 3),
              Text(
                myAddressController.userAddress.length.toString(),
                style: TextStyle(
                  fontFamily: 'NotoSans',
                  color: black,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.normal,
                ),
              ),
            ],
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          primary: false,
          itemCount: myAddressController.userAddress.length,
          itemBuilder: (_, index) {
            return AddressCard(
                id: myAddressController.userAddress[index].id!,
                isDefault: myAddressController.userAddress[index].isDefault,
                name: myAddressController.userAddress[index].toName!,
                address:
                    '${myAddressController.userAddress[index].address1}  ${myAddressController.userAddress[index].address2}',
                phoneNumber: '${myAddressController.userAddress[index].phone}',
                userAddress: myAddressController.userAddress[index]);
          },
        ),
      ],
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
          '배송정보 추가 하기',
          style: TextStyle(
            fontFamily: 'NotoSans',
            color: white,
            fontSize: 16,
            fontWeight: FontWeight.w400,
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
    required this.userAddress,
    required this.id,
    this.isDefault,
    this.name,
    this.address,
    this.phoneNumber,
  }) : super(key: key);

  final String? id, name, address, phoneNumber;
  final bool? isDefault;
  final UserAddress? userAddress;

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
              Container(
                width: Get.mediaQuery.size.width * 0.85,
                child: Text(
                  address.toString(),
                  style: TextStyle(
                    fontFamily: 'NotoSansKR',
                    color: Color(0xff000000),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
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
                    onPressed: () {
                      MyAddressController.to.preUpdateValue(userAddress!);
                      Get.to(() => AddressUpdatePage(
                            userAddress: userAddress!,
                          ));
                    },
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
                      animationType: DialogTransitionType.fade,
                      curve: Curves.fastOutSlowIn,
                      builder: (BuildContext context) {
                        return PlinicDialogTwoButton(
                          button1Text: '삭제할께요',
                          button2Text: '취소',
                          title: '알림',
                          content: '배송지를 삭제하시겠습니까?',
                          button1Click: () {
                            MyAddressController.to.deleteUserAddress(id);
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
        // SizedBox(height: spacing_xxl),
        // Divider(
        //   color: grey_3,
        //   thickness: 15,
        // )
      ],
    );
  }

  void twoButton() {}
}
