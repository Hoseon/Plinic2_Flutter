import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
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
import 'package:plinic2/src/component/loading.dart';
import 'package:plinic2/src/component/plinic_dialog_one_button.dart';
import 'package:plinic2/src/controller/profile_controller.dart';
import 'package:plinic2/src/model/user_model.dart';
import 'package:plinic2/src/restclient/UserClient.dart';

class EditProfilePage extends StatefulWidget {
  EditProfilePage({Key? key}) : super(key: key);

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  FocusNode focusNode = FocusNode();
  Dio dio = Dio();
  String? tempText;
  String? tempText2;
  @override
  void initState() {
    super.initState();
    focusNode.addListener(() async {
      if (!focusNode.hasFocus) {
        //닉네임 텍스트 필드를 빠져 나오면 업데이트
        if (controller2.text.length < 3) {
          showSnackBar('닉네임을 2자 이상 입력해주세요.');
          ProfileController.to.chagedNick(false);
          controller2.text = '';
          return;
        }
      }
    });
  }

  File? image; //사용자 프로필 이미지를 받아 올대
  late UserModel myProfile;
  late TextEditingController controller1;
  late TextEditingController controller2;
  late TextEditingController controller3;
  bool? isChanged = false; //사용자가 프로필 정보를 수정했는지??
  bool? isChangedNickName = false; //사용자가 프로필 정보를 수정했는지??

  Future pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);

      if (image == null) return;

      final imageTemp = File(image.path);

      var client = UserClient(dio);

      await client
          .userUpdateProfileImage(
        imageTemp,
        myProfile.uid!,
        myProfile.email!,
      )
          .then((result) {
        ProfileController.to.updateProfileImage(result.avata_url.toString());
        resultDialog(context, '알림', '프로필 이미지 변경이\n완료되었습니다.');
      }).catchError((e) {});

      setState(() {
        this.image = imageTemp;
      });

      // print(imageTemp);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return futureTest();
  }

  Widget main() {
    myProfile = Get.find<ProfileController>().myProfile.value;
    var profile_BirthDay = myProfile.birthDay!.substring(0, 4) +
        '년 - ' +
        myProfile.birthDay!.substring(4, 6) +
        '월';
    var tempNickName = myProfile.nickname; //닉네임 비교 전후 임시
    controller1 = TextEditingController(text: myProfile.email);
    if (ProfileController.to.isChangedNickDupe.value) {
      controller2 =
          TextEditingController(text: ProfileController.to.tempNick.value);
    } else {
      controller2 = TextEditingController(text: myProfile.nickname);
    }

    controller2 = TextEditingController(text: myProfile.nickname);
    controller3 = TextEditingController(text: profile_BirthDay);
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
              ProfileController.to.resetUpdateProfile();
              Get.back();
            },
          ),
        ),
        bottomNavigationBar: Obx(() =>
            ProfileController.to.isChangedNick.value ||
                    ProfileController.to.isChangedBirth.value ||
                    ProfileController.to.isChangedGender.value
                ? bottomButton(context)
                : disableBottomButton(context)),
        body: mainBody(
            context, controller1, controller2, controller3, tempNickName!));
  }

  GestureDetector mainBody(
    BuildContext context,
    TextEditingController controller1,
    TextEditingController controller2,
    TextEditingController controller3,
    String tempNickName,
  ) {
    return GestureDetector(
      onTap: () {
        Get.focusScope!.unfocus();
        // FocusScope.of(context).unfocus();
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
                  Obx(
                    () => ProfileController.to.myProfile.value.avataUrl == null
                        ? Image.asset('assets/images/profile-big.png')
                        : Container(
                            width: 100,
                            height: 100,
                            child: image == null
                                ? CircleAvatar(
                                    radius: 50,
                                    backgroundImage: NetworkImage(
                                      ProfileController
                                          .to.myProfile.value.avataUrl
                                          .toString(),
                                    ),
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
                            pickImage(ImageSource.gallery);
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
                  key: ProfileController.to.editProfileKey,
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
                            focusNode: focusNode,
                            controller: ProfileController.to.nickNameController,
                            onChanged: (value) {
                              if (value != tempNickName) {
                                print('값 다름');
                                Get.find<ProfileController>()
                                    .chagedNickDupeCheck(value, true);
                              } else {
                                print('값 같음');
                                Get.find<ProfileController>()
                                    .chagedNickDupeCheck(value, false);
                              }
                              ;
                            },
                            keyboardType: TextInputType.emailAddress,
                            style: TextStyle(
                              fontFamily: 'NotoSans',
                              color: black,
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
                              suffixIcon: Obx(
                                () => ProfileController
                                        .to.isChangedNickDupe.value
                                    ? Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 12),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: grey_3,
                                                borderRadius:
                                                    BorderRadius.circular(4),
                                              ),
                                              width: 64,
                                              height: 28,
                                              child: TextButton(
                                                onPressed: () async {
                                                  //사용자 중복체크 nickname Api Call
                                                  var client = UserClient(dio);
                                                  try {
                                                    var result = await client
                                                        .getCheckUserNickName(
                                                            ProfileController
                                                                .to
                                                                .nickNameController
                                                                .text);
                                                    if (result == 'true') {
                                                      controller2.text =
                                                          ProfileController
                                                              .to
                                                              .myProfile
                                                              .value
                                                              .nickname
                                                              .toString();
                                                      FocusScope.of(context)
                                                          .unfocus();
                                                      showSnackBar(
                                                          '이미 사용중인 닉네임 입니다.');
                                                      return;
                                                    } else {
                                                      //update_nick에 데이터 업데이트;
                                                      ProfileController.to
                                                          .chagedNick(true);
                                                      ProfileController.to
                                                          .updateNickname(
                                                              controller2.text);
                                                      showSnackBar(
                                                          '닉네임 변경이 가능합니다!! 저장해주세요.');
                                                      return;
                                                    }
                                                  } catch (e) {
                                                    print(
                                                        '닉네임 중복확인 에러 발생 : $e');
                                                  }
                                                },
                                                child: Text(
                                                  '중복확인',
                                                  style: TextStyle(
                                                    fontFamily: 'NotoSans',
                                                    color: primary,
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w400,
                                                    fontStyle: FontStyle.normal,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      )
                                    : SizedBox(),
                              ),
                            ),
                          ),
                          SizedBox(height: spacing_xl),
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
                              focusColor: Colors.red,
                              counterStyle: TextStyle(color: grey_1),
                              labelStyle: TextStyle(color: grey_1),
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(4),
                              ),
                              // enabledBorder: OutlineInputBorder(
                              //   borderSide:
                              //       BorderSide(color: grey_2, width: 0.5),
                              // ),
                              // focusedBorder: OutlineInputBorder(
                              //   borderSide:
                              //       BorderSide(color: grey_1, width: 0.5),
                              // ),
                            ),
                          ),
                          SizedBox(height: spacing_xl),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  '생년월',
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
                              // showDateDialog(context); //데이터 피커 변경 2022-02-07
                            },
                            controller: controller3,
                            // readOnly: true,
                            enabled: false,
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
                              focusColor: Colors.red,
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
                              // suffixIcon: IconButton(
                              //     icon: Icon(Icons.expand_more),
                              //     color: Colors.black,
                              //     onPressed: () {
                              //       // print('aaa');
                              //     }),
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(4),
                              ),
                              // enabledBorder: OutlineInputBorder(
                              //   borderSide:
                              //       BorderSide(color: grey_2, width: 0.5),
                              // ),
                              // focusedBorder: OutlineInputBorder(
                              //   borderSide:
                              //       BorderSide(color: grey_1, width: 0.5),
                              // ),
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
                              Obx(() => Get.find<ProfileController>()
                                          .myProfile
                                          .value
                                          .gender ==
                                      '남자'
                                  ? _groupButtonWomenUnCheck()
                                  : _groupButtonWomenCheck()),
                              Obx(() => Get.find<ProfileController>()
                                          .myProfile
                                          .value
                                          .gender ==
                                      '남자'
                                  ? _groupButtonManCheck()
                                  : _groupButtonManUnCheck()),
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
          // Get.find<ProfileController>().changeGender('여자');
        },
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: grey_3,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(4), bottomLeft: Radius.circular(4)),
            // border: Border(
            //   right:
            //       BorderSide(color: grey_2, width: 1, style: BorderStyle.solid),
            //   left:
            //       BorderSide(color: grey_2, width: 1, style: BorderStyle.solid),
            //   top:
            //       BorderSide(color: grey_2, width: 1, style: BorderStyle.solid),
            //   bottom:
            //       BorderSide(color: grey_2, width: 1, style: BorderStyle.solid),
            // ),
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
          setState(() {
            isChanged = true;
          });
          // Get.find<ProfileController>().changeGender('남자');
          // Get.find<ProfileController>().toggleMan(false);
        },
        child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: grey_3,
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(4),
                  topRight: Radius.circular(4)),
              // border: Border(
              //   right: BorderSide(
              //       color: grey_2, width: 1, style: BorderStyle.solid),
              //   left: BorderSide(
              //       color: grey_2, width: 1, style: BorderStyle.solid),
              //   top: BorderSide(
              //       color: grey_2, width: 1, style: BorderStyle.solid),
              //   bottom: BorderSide(
              //       color: grey_2, width: 1, style: BorderStyle.solid),
              // ),
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
          color: grey_3,
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(4), topRight: Radius.circular(4)),
          border: Border(
            right: BorderSide(
                color: textfields, width: 1, style: BorderStyle.solid),
            left: BorderSide(
                color: textfields, width: 1, style: BorderStyle.solid),
            top: BorderSide(
                color: textfields, width: 1, style: BorderStyle.solid),
            bottom: BorderSide(
                color: textfields, width: 1, style: BorderStyle.solid),
          ),
        ),
        width: Get.mediaQuery.size.width,
        height: 40,
        child: Text(
          '남자',
          style: TextStyle(
            fontFamily: 'NotoSans',
            color: textfields,
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
          color: grey_3,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(4), bottomLeft: Radius.circular(4)),
          border: Border(
            right: BorderSide(
                color: textfields, width: 1, style: BorderStyle.solid),
            left: BorderSide(
                color: textfields, width: 1, style: BorderStyle.solid),
            top: BorderSide(
                color: textfields, width: 1, style: BorderStyle.solid),
            bottom: BorderSide(
                color: textfields, width: 1, style: BorderStyle.solid),
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

  ConstrainedBox disableBottomButton(BuildContext context) {
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
          backgroundColor: MaterialStateProperty.all(grey_2),
        ),
        onPressed: () {
          // saveProfile(context);
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
    setState(() {
      isChanged = true;
    });
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
              //ProfileController에 update_birthday update
              Get.find<ProfileController>().updateBirthDay(
                  yearMonth[0].toString() + '-' + yearMonth[1].toString());
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
    //사용자 닉네임 변경 api call
    var client = UserClient(dio);
    var user = GetUser();
    user.nickname = ProfileController.to.nickNameController.text;
    await client.userUpdateNickName(myProfile.uid!, user).then((value) {
      print(value.nickname);
      //처리 결과에 의한 사용자 닉네임 controller에서 변경
      ProfileController.to.updateNickname(value.nickname!);
      resultDialog(context, '변경완료', '프로필 정보가 수정되었습니다');
    }).catchError((e) {
      print(e);
      resultDialog(context, '처리 오류', '잠시 후 다시 시도해주세요');
    });
  }

  Future<Object?> resultDialog(context, String title, String content) {
    return showAnimatedDialog(
      context: context,
      barrierDismissible: false,
      animationType: DialogTransitionType.fade,
      builder: (BuildContext context) {
        return PlinicDialogOneButton(
          buttonText: '확인',
          content: content,
          title: title,
          buttonClick: () {
            Get.back();
          },
        );
      },
    );
  }

  void showSnackBar(String message) {
    Get.showSnackbar(
      GetBar(
          // title: 'Snackbar',
          // message: '찜 상품이 삭제 되었습니다.',
          messageText: Row(
            children: [
              Text(message,
                  style: TextStyle(
                    fontFamily: 'NotoSansKR',
                    color: white,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                  ))
            ],
          ),
          duration: Duration(seconds: 3),
          forwardAnimationCurve: Curves.fastLinearToSlowEaseIn,
          reverseAnimationCurve: Curves.easeInBack,
          snackPosition: SnackPosition.BOTTOM),
    );
  }

  Widget futureTest() {
    return FutureBuilder(
      future: UserClient(dio)
          .checkPhoneAuth(ProfileController.to.myProfile.value.uid!),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return LoadingPage();
        } else if (snapshot.hasData) {
          return main();
        }
        return LoadingPage();
      },
    );
  }
}
