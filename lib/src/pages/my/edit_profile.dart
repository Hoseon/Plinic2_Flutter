import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_linear_datepicker/flutter_datepicker.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:line_icons/line_icons.dart';
import 'package:plinic2/constants.dart';
import 'package:plinic2/src/component/appbar_title.dart';
import 'package:plinic2/src/component/common_text.dart';
import 'package:plinic2/src/component/plinic_dialog_one_button.dart';
import 'package:plinic2/src/controller/profile_controller.dart';
import 'package:plinic2/src/model/user_model.dart';

class EditProfilePage extends StatefulWidget {
  EditProfilePage({Key? key}) : super(key: key);

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  File? image; //사용자 프로필 이미지를 받아 올대
  late UserModel myProfile;

  late TextEditingController controller1;

  late TextEditingController controller2;

  late TextEditingController controller3;

  Future pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;

      final imageTemp = File(image.path);
      setState(() {
        this.image = imageTemp;
      });
      print(imageTemp);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    myProfile = Get.find<ProfileController>().myProfile.value;
    controller1 = TextEditingController(text: myProfile.email);
    controller2 = TextEditingController(text: myProfile.nickname);
    controller3 = TextEditingController(text: myProfile.birthDay);
    myProfile = Get.find<ProfileController>().myProfile.value;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          title: AppbarTitle(title: '내 정보'),
          backgroundColor: Colors.white,
          elevation: 0.3,
          leading: IconButton(
            icon: Icon(LineIcons.times, color: Colors.black),
            onPressed: () {
              Get.back();
            },
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
                          child: image == null
                              ? CircleAvatar(
                                  radius: 50,
                                  backgroundImage: NetworkImage(
                                      myProfile.avataUrl.toString()),
                                )
                              : ClipOval(
                                  child: Image.file(
                                    image!,
                                    width: 100,
                                    height: 100,
                                    fit: BoxFit.cover,
                                  ),
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
                            bottomSheet();
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
                                child: Text('아이디',
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
                            style: TextStyle(
                              fontFamily: 'NotoSans',
                              color: textfields,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                            ),
                            decoration: InputDecoration(
                              enabled: false,
                              filled: true,
                              fillColor: grey_3,
                              contentPadding: EdgeInsets.all(8),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: grey_2, width: 0.5),
                              ),
                              focusColor: Colors.red,
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: grey_1, width: 0.5)),
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
                            controller: controller2,
                            keyboardType: TextInputType.emailAddress,
                            style: TextStyle(
                              fontFamily: 'NotoSans',
                              color: textfields,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                            ),
                            decoration: InputDecoration(
                              // filled: true,
                              // fillColor: grey_3,
                              // enabled: ,
                              contentPadding: EdgeInsets.all(8),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: grey_2, width: 0.5),
                              ),
                              focusColor: Colors.red,
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: grey_1, width: 1)),
                              border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: grey_1, width: 0.5),
                              ),
                              suffixIcon: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 12),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: grey_3,
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      width: 64,
                                      height: 28,
                                      child: TextButton(
                                        onPressed: () {},
                                        child: Text(
                                          '중복확인',
                                          style: TextStyle(
                                            fontFamily: 'NotoSans',
                                            color: textfields,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                            fontStyle: FontStyle.normal,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
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
                              // datePicker(context);
                              showDateDialog(context); //데이터 피커 변경 2022-02-07
                            },
                            controller: controller3,
                            readOnly: true,
                            enabled: true,
                            style: TextStyle(
                              fontFamily: 'NotoSans',
                              color: textfields,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                            ),
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: grey_3,
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
                                    // print('aaa');
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
                                  Get.find<ProfileController>().isMan.value !=
                                          true
                                      ? _groupButtonWomenCheck()
                                      : _groupButtonWomenUnCheck()),
                              Obx(() =>
                                  Get.find<ProfileController>().isMan.value !=
                                          true
                                      ? _groupButtonManUnCheck()
                                      : _groupButtonWomenUnCheck()),
                            ],
                          ),
                          SizedBox(height: spacing_xl),
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

  Widget _groupButtonWomenUnCheck() {
    return Flexible(
      flex: 1,
      child: InkWell(
        onTap: () {
          // Get.find<ProfileController>().toggleMan(true);
        },
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(4), bottomLeft: Radius.circular(4)),
            border: Border(
              right:
                  BorderSide(color: grey_2, width: 1, style: BorderStyle.solid),
              left:
                  BorderSide(color: grey_2, width: 1, style: BorderStyle.solid),
              top:
                  BorderSide(color: grey_2, width: 1, style: BorderStyle.solid),
              bottom:
                  BorderSide(color: grey_2, width: 1, style: BorderStyle.solid),
            ),
          ),
          width: Get.mediaQuery.size.width,
          height: 40,
          child: Text(
            '여자',
            style: TextStyle(
              fontFamily: 'NotoSans',
              color: textfields,
              fontSize: 12,
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.normal,
            ),
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
          // Get.find<ProfileController>().toggleMan(false);
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
            child: Text('남자',
                style: TextStyle(
                  fontFamily: 'NotoSans',
                  color: textfields,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                ))),
      ),
    );
  }

  Widget _groupButtonManCheck() {
    return Flexible(
      flex: 1,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(4), topRight: Radius.circular(4)),
          border: Border(
            right: BorderSide(
                color: primary_light, width: 1, style: BorderStyle.solid),
            left: BorderSide(
                color: primary_light, width: 1, style: BorderStyle.solid),
            top: BorderSide(
                color: primary_light, width: 1, style: BorderStyle.solid),
            bottom: BorderSide(
                color: primary_light, width: 1, style: BorderStyle.solid),
          ),
        ),
        width: Get.mediaQuery.size.width,
        height: 40,
        child: Text(
          '남자',
          style: TextStyle(
            fontFamily: 'NotoSans',
            color: primary_light,
            fontSize: 12,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
        ),
      ),
    );
  }

  Widget _groupButtonWomenCheck() {
    return Flexible(
      flex: 1,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(4), bottomLeft: Radius.circular(4)),
          border: Border(
            right: BorderSide(
                color: primary_light, width: 1, style: BorderStyle.solid),
            left: BorderSide(
                color: primary_light, width: 1, style: BorderStyle.solid),
            top: BorderSide(
                color: primary_light, width: 1, style: BorderStyle.solid),
            bottom: BorderSide(
                color: primary_light, width: 1, style: BorderStyle.solid),
          ),
        ),
        width: Get.mediaQuery.size.width,
        height: 40,
        child: Text(
          '여자',
          style: TextStyle(
            fontFamily: 'NotoSans',
            color: primary_light,
            fontSize: 12,
            fontWeight: FontWeight.w400,
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
        child: Text('수정완료',
            style: TextStyle(
              fontFamily: 'NotoSans',
              color: white,
              fontSize: 16,
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.normal,
            )),
      ),
    );
  }

  void showDateDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('생년월일 선택'),
        content: LinearDatePicker(
            startDate: '1900/10/17', //yyyy/mm/dd
            endDate: '2021/12/31',
            initialDate: '1984/10/25',
            dateChangeListener: (String selectedDate) {
              var yearMonth = selectedDate.split('/');
              controller3.text =
                  yearMonth[0].toString() + '-' + yearMonth[1].toString();
              // _textEditingController2.text = yearMonth[1].toString();
              //생년월일이 클릭되는 순간 ProfileController에 <RxString>birthDay에 저장한다.
              // var birthDay = _textEditingController1.text +
              //     '_' +
              //     _textEditingController2.text;
              // ProfileController.to.setBirthDay(birthDay);
              // setState(() {
              //   var test = selectedDate.split('/');
              //   _textEditingController1.text = test[0].toString();
              //   _textEditingController2.text = test[1].toString();
              // });
            },
            showDay: false, //false -> only select year & month
            labelStyle: TextStyle(
              fontFamily: 'sans',
              fontSize: 14.0,
              color: Colors.black,
            ),
            selectedRowStyle: TextStyle(
              fontFamily: 'sans',
              fontSize: 18.0,
              color: primary,
            ),
            unselectedRowStyle: TextStyle(
              fontFamily: 'sans',
              fontSize: 16.0,
              color: Colors.blueGrey,
            ),
            yearText: '생년',
            monthText: '월',
            showLabels: false, // to show column captions, eg. year, month, etc.
            columnWidth: 100,
            showMonthName: false,
            isJalaali: true // false -> Gregorian
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
      controller3.text = '${date.year}-${date.month}-${date.day}';
      // print('${date.year}-${date.month}-${date.day}');
      // print('confirm $date.');
    }, currentTime: DateTime(1990), locale: LocaleType.ko);
  }

  void bottomSheet() async {
    await Get.bottomSheet(Container(
        height: 140,
        color: Colors.white,
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ListTile(
                  leading: Icon(LineIcons.photoVideo),
                  title: Text(
                    '갤러리',
                    style: TextStyle(
                      fontFamily: 'NotoSans',
                      color: black,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                  onTap: () {
                    Get.back();
                    pickImage(ImageSource.gallery);
                  }),
              ListTile(
                leading: Icon(LineIcons.camera),
                title: Text(
                  '카메라',
                  style: TextStyle(
                    fontFamily: 'NotoSans',
                    color: black,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                  ),
                ),
                onTap: () {
                  Get.back();
                  pickImage(ImageSource.camera);
                },
              ),
            ],
          ),
        )));
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
