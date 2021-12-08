import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:plinic2/constants.dart';
import 'package:plinic2/src/component/appbar_title.dart';
import 'package:plinic2/src/component/plinic_dialog_one_button.dart';
import 'package:plinic2/src/component/plinic_dialog_two_button.dart';
import 'package:plinic2/src/controller/profile_controller.dart';
import 'package:plinic2/src/model/user_model.dart';

class EditProfilePage extends StatelessWidget {
  EditProfilePage({Key? key}) : super(key: key);
  late UserModel myProfile;

  late TextEditingController controller1;
  late TextEditingController controller2;
  late TextEditingController controller3;

  @override
  Widget build(BuildContext context) {
    myProfile = Get.find<ProfileController>().myProfile.value;
    controller1 = TextEditingController(text: myProfile.name);
    controller2 = TextEditingController();
    controller3 = TextEditingController(text: myProfile.email);
    myProfile = Get.find<ProfileController>().myProfile.value;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          title: AppbarTitle(title: '프로필관리'),
          backgroundColor: Colors.white,
          elevation: 0.3,
          leading: IconButton(
            icon: Icon(LineIcons.arrowLeft, color: Colors.black),
            onPressed: () {
              Get.back();
            },
          ),
          // actions: [
          //   IconButton(
          //       icon: Icon(Icons.brightness_low_rounded), onPressed: () {})
          // ],
          actionsIconTheme: IconThemeData(
            color: Colors.black,
          ),
        ),
        bottomNavigationBar: bottomButton(context),
        body: mainBody(context, controller1, controller2, controller3));
  }

  GestureDetector mainBody(
      BuildContext context,
      TextEditingController controller1,
      TextEditingController controller2,
      TextEditingController controller3) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: SingleChildScrollView(
        child: Container(
          width: Get.mediaQuery.size.width,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: spacing_xl,
              ),
              Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.bottomRight,
                children: [
                  myProfile.avataUrl == null
                      ? Image.asset('assets/images/profile-big.png')
                      : Container(
                          width: 100,
                          height: 100,
                          child: CircleAvatar(
                            radius: 50,
                            backgroundImage:
                                NetworkImage(myProfile.avataUrl.toString()),
                          ),
                        ),
                  Positioned(
                    right: -10,
                    bottom: -10,
                    child: Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Color(0xff9a5cf4)),
                      child: InkWell(
                        splashColor: grey_1,
                        child: IconButton(
                          icon: Icon(
                            Icons.photo_camera,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            print('camera');
                          },
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 53),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: spacing_xxl),
                child: Form(
                  child: Theme(
                    data: ThemeData(
                        primaryColor: grey_1,
                        inputDecorationTheme: InputDecorationTheme(
                            labelStyle: TextStyle(fontSize: 15.0))),
                    child: Container(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('닉네임',
                                    style: TextStyle(
                                      fontFamily: 'NotoSansKR',
                                      color: black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                      fontStyle: FontStyle.normal,
                                    )),
                              ),
                            ],
                          ),
                          TextField(
                            controller: controller1,
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(8),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: grey_2, width: 0.5),
                              ),
                              focusColor: Colors.red,
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: grey_1, width: 0.5)),
                              // labelText: '닉네임',
                              hintText: '닉네임을 입력해주세요',
                              hintStyle: TextStyle(
                                fontFamily: 'NotoSansKR',
                                color: black,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                              ),
                              counterStyle: TextStyle(color: grey_1),
                              labelStyle: TextStyle(color: grey_1),
                              border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.black, width: 1),
                              ),
                            ),
                          ),
                          SizedBox(height: spacing_xl),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  '생년월일',
                                  style: TextStyle(
                                    fontFamily: 'NotoSansKR',
                                    color: black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                    fontStyle: FontStyle.normal,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          TextField(
                            onTap: () {
                              datePicker(context);
                            },
                            controller: controller2,
                            readOnly: true,
                            enabled: true,
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(8),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: grey_2, width: 0.5),
                              ),
                              focusColor: Colors.red,
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: grey_1, width: 0.5)),
                              counterStyle: TextStyle(
                                fontFamily: 'NotoSansKR',
                                color: black,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                              ),
                              labelStyle: TextStyle(
                                fontFamily: 'NotoSansKR',
                                color: black,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                              ),
                              suffixIcon: IconButton(
                                  icon: Icon(Icons.expand_more),
                                  color: Colors.black,
                                  onPressed: () {
                                    print('aaa');
                                  }),
                              border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.black, width: 1),
                              ),
                            ),
                          ),
                          SizedBox(height: spacing_xl),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  '성별',
                                  style: TextStyle(
                                    fontFamily: 'NotoSansKR',
                                    color: black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                    fontStyle: FontStyle.normal,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Obx(() =>
                                  Get.find<ProfileController>().isMan.value ==
                                          true
                                      ? _groupButtonManCheck()
                                      : _groupButtonManUnCheck()),
                              Obx(() =>
                                  Get.find<ProfileController>().isMan.value ==
                                          false
                                      ? _groupButtonWomenCheck()
                                      : _groupButtonWomenUnCheck()),
                            ],
                          ),
                          // GroupButton(
                          //   isRadio: true,
                          //   selectedColor: Colors.black,
                          //   unselectedColor: Colors.transparent,
                          //   buttonHeight: 45,
                          //   buttonWidth: Get.mediaQuery.size.width * 0.425,
                          //   unselectedBorderColor: grey_1,
                          //   selectedButton: 0,
                          //   unselectedTextStyle: TextStyle(
                          //     fontFamily: 'NotoSansKR',
                          //     color: textfields,
                          //     fontSize: 14,
                          //     fontWeight: FontWeight.w400,
                          //     fontStyle: FontStyle.normal,
                          //   ),
                          //   groupingType: GroupingType.wrap,
                          //   borderRadius: BorderRadius.all(Radius.circular(3)),
                          //   spacing: 0,
                          //   onSelected: (index, isSelected) =>
                          //       print('$index button is selected'),
                          //   buttons: [
                          //     '남자',
                          //     '여자',
                          //   ],
                          // ),
                          SizedBox(height: spacing_xl),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('이메일',
                                    style: TextStyle(
                                      fontFamily: 'NotoSansKR',
                                      color: black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                      fontStyle: FontStyle.normal,
                                    )),
                              ),
                            ],
                          ),
                          TextField(
                            controller: controller3,
                            keyboardType: TextInputType.emailAddress,
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(8),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: grey_2, width: 0.5),
                              ),
                              focusColor: Colors.red,
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.black, width: 2)),
                              // labelText: '닉네임',
                              hintText: '이메일을 입력해주세요',
                              hintStyle: TextStyle(color: grey_1),
                              counterStyle: TextStyle(color: grey_1),
                              labelStyle: TextStyle(color: grey_1),
                              border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: grey_1, width: 0.5),
                              ),
                            ),
                          ),
                          SizedBox(height: 30),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _groupButtonManUnCheck() {
    return Flexible(
      flex: 1,
      child: InkWell(
        onTap: () {
          Get.find<ProfileController>().toggleMan(true);
        },
        child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(4), bottomLeft: Radius.circular(4)),
              border: Border(
                right: BorderSide(
                    color: grey_2, width: 1, style: BorderStyle.solid),
                left: BorderSide(
                    color: grey_2, width: 1, style: BorderStyle.solid),
                top: BorderSide(
                    color: grey_2, width: 1, style: BorderStyle.solid),
                bottom: BorderSide(
                    color: grey_2, width: 1, style: BorderStyle.solid),
              ),
            ),
            width: Get.mediaQuery.size.width,
            height: 40,
            child: Text('남자',
                style: TextStyle(
                  fontFamily: 'NotoSansKR',
                  color: black,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.normal,
                ))),
      ),
    );
  }

  Widget _groupButtonWomenUnCheck() {
    return Flexible(
      flex: 1,
      child: InkWell(
        onTap: () {
          Get.find<ProfileController>().toggleMan(false);
        },
        child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(4),
                  topRight: Radius.circular(4)),
              border: Border(
                right: BorderSide(
                    color: grey_2, width: 1, style: BorderStyle.solid),
                left: BorderSide(
                    color: grey_2, width: 1, style: BorderStyle.solid),
                top: BorderSide(
                    color: grey_2, width: 1, style: BorderStyle.solid),
                bottom: BorderSide(
                    color: grey_2, width: 1, style: BorderStyle.solid),
              ),
            ),
            width: Get.mediaQuery.size.width,
            height: 40,
            child: Text('여자',
                style: TextStyle(
                  fontFamily: 'NotoSansKR',
                  color: grey_1,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.normal,
                ))),
      ),
    );
  }

  Widget _groupButtonWomenCheck() {
    return Flexible(
      flex: 1,
      child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(4), topRight: Radius.circular(4)),
            border: Border(
              right:
                  BorderSide(color: black, width: 1, style: BorderStyle.solid),
              left:
                  BorderSide(color: black, width: 1, style: BorderStyle.solid),
              top: BorderSide(color: black, width: 1, style: BorderStyle.solid),
              bottom:
                  BorderSide(color: black, width: 1, style: BorderStyle.solid),
            ),
          ),
          width: Get.mediaQuery.size.width,
          height: 40,
          child: Text('여자',
              style: TextStyle(
                fontFamily: 'NotoSansKR',
                color: white,
                fontSize: 14,
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.normal,
              ))),
    );
  }

  Widget _groupButtonManCheck() {
    return Flexible(
      flex: 1,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(4), bottomLeft: Radius.circular(4)),
          border: Border(
            right: BorderSide(color: black, width: 1, style: BorderStyle.solid),
            left: BorderSide(color: black, width: 1, style: BorderStyle.solid),
            top: BorderSide(color: black, width: 1, style: BorderStyle.solid),
            bottom:
                BorderSide(color: black, width: 1, style: BorderStyle.solid),
          ),
        ),
        width: Get.mediaQuery.size.width,
        height: 40,
        child: Text(
          '남자',
          style: TextStyle(
            fontFamily: 'NotoSansKR',
            color: white,
            fontSize: 14,
            fontWeight: FontWeight.w700,
            fontStyle: FontStyle.normal,
          ),
        ),
      ),
    );
  }

  ConstrainedBox bottomButton(BuildContext context) {
    return ConstrainedBox(
      constraints:
          BoxConstraints.tightFor(width: Get.mediaQuery.size.width, height: 60),
      // ConstrainedBox(
      //     constraints: BoxConstraints.tightFor(
      //         width: MediaQuery.of(context).size.width * 0.9,
      //         height: 44),
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
          saveProfile(context);
        },
        child: Text(
          '저장',
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

  void datePicker(context) {
    DatePicker.showDatePicker(context,
        showTitleActions: true,
        theme: DatePickerTheme(),
        minTime: DateTime(1900, 1, 1),
        maxTime: DateTime(2021, 12, 31), onConfirm: (date) {
      controller2.text = '${date.year}-${date.month}-${date.day}';
      // print('${date.year}-${date.month}-${date.day}');
      // print('confirm $date.');
    }, currentTime: DateTime(1990), locale: LocaleType.ko);
  }

  void saveProfile(context) async {
    await showAnimatedDialog(
      context: context,
      barrierDismissible: true,
      animationType: DialogTransitionType.fade,
      builder: (BuildContext context) {
        return PlinicDialogOneButton(
          buttonText: '확인',
          content: '프로필 정보가 수정되었습니다.',
          title: '알림',
          buttonClick: () {
            Get.back();
          },
        );
      },
    );
  }
}
