import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:flutter_linear_datepicker/flutter_datepicker.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:plinic2/constants.dart';
import 'package:plinic2/src/component/plinic_dialog_one_button.dart';
import 'package:plinic2/src/controller/profile_controller.dart';
import 'package:plinic2/src/controller/terms_check_controller.dart';
import 'package:plinic2/src/model/user_model.dart';
import 'package:plinic2/src/pages/check_login.dart';
import 'package:plinic2/src/pages/register.dart';
import 'package:plinic2/src/pages/register/user_register.dart';
import 'package:plinic2/src/repository/register/register_repository.dart';

class AddUserInfoV2Page extends StatefulWidget {
  AddUserInfoV2Page({Key? key}) : super(key: key);

  @override
  State<AddUserInfoV2Page> createState() => _AddUserInfoV2PageState();
}

class _AddUserInfoV2PageState extends State<AddUserInfoV2Page> {
  final RegisterRepository _registerRepository = RegisterRepository();
  final TextEditingController _textEditingController1 = TextEditingController();
  final TextEditingController _textEditingController2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var mode = Get.arguments['mode'];
    var credential = Get.arguments['credential'];
    var agree = Get.arguments['agree'];
    ProfileController.to.userSaveAgree(agree);

    return Scaffold(
      backgroundColor: white,
      appBar: buildAppbar(),
      body: buildBody(context),
      bottomSheet: buildBottom(context, mode, credential, agree),
    );
  }

  Widget buildBottom(
      BuildContext context, String mode, var credential, var agree) {
    return ElevatedButton(
      style: ButtonStyle(
          minimumSize:
              MaterialStateProperty.all(Size(Get.mediaQuery.size.width, 60)),
          // side: MaterialStateProperty.all(BorderSide(color: grey_2)),
          shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.zero)),
          elevation: MaterialStateProperty.all(0.0),
          backgroundColor: MaterialStateProperty.all(primary)),
      onPressed: () {
        if (_textEditingController1.text.isEmpty) {
          print('????????? ??????');
          validDialog(context); //??????????????? ???????????? ????????? ????????? ??????
          return;
        }

        if (mode == 'kakao') {
          signInWithKakao(credential, agree);
        } else if (mode == 'apple') {
          signInWithApple(credential, agree);
        } else {
          signInWithGoogle(credential, agree);
        }
        // register();
        // Get.to(() => AddUserInfoV2Page(), transition: Transition.native);
      },
      child: Text('????????? ????????????',
          style: TextStyle(
            fontFamily: 'NotoSansKR',
            fontSize: 16,
            color: white,
            fontWeight: FontWeight.w700,
            fontStyle: FontStyle.normal,
          )),
    );
  }

  Column buildBody(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 60.3),
        Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.symmetric(horizontal: spacing_xl),
          child: Text(
            '????????????',
            style: TextStyle(
              // fontFamily: 'NotoSansKR',
              color: black,
              fontSize: 20,
              fontWeight: FontWeight.w700,
              fontStyle: FontStyle.normal,
            ),
          ),
        ),
        SizedBox(height: spacing_xxs),
        Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.symmetric(horizontal: spacing_xl),
          child: Text('???????????? ?????? ??? ??????????????????.',
              style: TextStyle(
                // fontFamily: 'NotoSansKR',
                color: black,
                fontSize: 16,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
              )),
        ),
        SizedBox(height: 44),
        Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.symmetric(horizontal: spacing_xl),
          child: Text('?????????',
              style: TextStyle(
                fontFamily: 'NotoSansKR',
                color: black,
                fontSize: 14,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
              )),
        ),
        SizedBox(height: spacing_xxs),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                flex: 1,
                child: Container(
                  width: Get.mediaQuery.size.width,
                  child: TextField(
                    onTap: () {
                      showDateDialog(context);
                    },
                    readOnly: true,
                    controller: _textEditingController1,
                    textAlign: TextAlign.end,
                    keyboardType: TextInputType.number,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(8),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: grey_2, width: 0.5),
                      ),
                      focusColor: Colors.red,
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: grey_1, width: 0.5)),
                      hintText: '0000???',
                      suffixText: '???',
                      hintStyle: TextStyle(
                        fontFamily: 'NotoSansKR',
                        color: textfields,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      ),
                      counterStyle: TextStyle(color: grey_1),
                      labelStyle: TextStyle(color: grey_1),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 1),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 15),
              Flexible(
                flex: 1,
                child: Container(
                  width: Get.mediaQuery.size.width,
                  child: TextField(
                    onTap: () {
                      // showDateDialog(context);
                    },
                    readOnly: true,
                    controller: _textEditingController2,
                    textAlign: TextAlign.end,
                    keyboardType: TextInputType.number,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(8),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: grey_2, width: 0.5),
                      ),
                      focusColor: Colors.red,
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: grey_1, width: 0.5)),
                      // hintText: '00???',
                      suffixText: '???',
                      hintStyle: TextStyle(
                        fontFamily: 'NotoSansKR',
                        color: textfields,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      ),
                      counterStyle: TextStyle(color: grey_1),
                      labelStyle: TextStyle(color: grey_1),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 1),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: spacing_l),
        Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.symmetric(horizontal: spacing_xl),
          child: Text(
            '??????',
            style: TextStyle(
              fontFamily: 'NotoSansKR',
              color: black,
              fontSize: 14,
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.normal,
            ),
          ),
        ),
        SizedBox(height: spacing_xxs),
        Obx(
          () => TermsCheckController.to.isMan.value == true
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
                  child: Row(
                    children: [
                      _groupButtonWomenUnCheck(),
                      _groupButtonManCheck()
                    ],
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
                  child: Row(
                    children: [
                      _groupButtonWomenCheck(),
                      _groupButtonManUnCheck()
                    ],
                  ),
                ),
        )
      ],
    );
  }

  AppBar buildAppbar() {
    return AppBar(
      elevation: 0.0,
      backgroundColor: white,
      centerTitle: true,
      title: Text(
        '??????????????? ?????? ??????????????????.',
        style: TextStyle(
          // fontFamily: 'NotoSansKR',
          color: black,
          fontSize: 18,
          fontWeight: FontWeight.w700,
          fontStyle: FontStyle.normal,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {
            Get.offAll(() => CheckLogin(), transition: Transition.native);
          },
          icon: Icon(LineIcons.times, color: black),
        )
      ],
    );
  }

  Widget _groupButtonManCheck() {
    return Flexible(
      flex: 1,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(4), bottomRight: Radius.circular(4)),
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
        // width: Get.mediaQuery.size.width,
        height: 40,
        child: Text(
          '??????',
          style: TextStyle(
            // fontFamily: 'NotoSansKR',
            color: primary_light,
            fontSize: 14,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
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
          TermsCheckController.to
              .toggleGender(TermsCheckController.to.isMan.value);
          ProfileController.to.changeGender('??????');
        },
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(4), bottomRight: Radius.circular(4)),
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
          // width: Get.mediaQuery.size.width,
          height: 40,
          child: Text(
            '??????',
            style: TextStyle(
              // fontFamily: 'NotoSansKR',
              color: textfields,
              fontSize: 14,
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.normal,
            ),
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
          TermsCheckController.to
              .toggleGender(TermsCheckController.to.isMan.value);
          ProfileController.to.changeGender('??????');
        },
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(4), topLeft: Radius.circular(4)),
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
          // width: Get.mediaQuery.size.width,
          height: 40,
          child: Text(
            '??????',
            style: TextStyle(
              // fontFamily: 'NotoSansKR',
              color: textfields,
              fontSize: 14,
              fontWeight: FontWeight.w700,
              fontStyle: FontStyle.normal,
            ),
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
          color: white,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(4), topLeft: Radius.circular(4)),
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
        // width: Get.mediaQuery.size.width,
        height: 40,
        child: Text(
          '??????',
          style: TextStyle(
            // fontFamily: 'NotoSansKR',
            color: primary_light,
            fontSize: 14,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
        ),
      ),
    );
  }

  void showDateDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('????????? ??????'),
        content: LinearDatePicker(
            startDate: '1900/10/17', //yyyy/mm/dd
            endDate: '2021/12/31',
            initialDate: '1984/10/25',
            dateChangeListener: (String selectedDate) {
              var yearMonth = selectedDate.split('/');
              _textEditingController1.text = yearMonth[0].toString();
              _textEditingController2.text = yearMonth[1].toString();
              //??????????????? ???????????? ?????? ProfileController??? <RxString>birthDay??? ????????????.
              if (_textEditingController2.text.length == 1) {
                _textEditingController2.text =
                    '0' + _textEditingController2.text;
              }
              var birthDay =
                  _textEditingController1.text + _textEditingController2.text;

              ProfileController.to.setBirthDay(birthDay);
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
            yearText: '??????',
            monthText: '???',
            showLabels: false, // to show column captions, eg. year, month, etc.
            columnWidth: 100,
            showMonthName: false,
            isJalaali: true // false -> Gregorian
            ),
      ),
    );
  }

  void validDialog(context) async {
    await showAnimatedDialog(
      context: context,
      barrierDismissible: true,
      animationType: DialogTransitionType.fade,
      curve: Curves.fastOutSlowIn,
      builder: (BuildContext context) {
        return PlinicDialogOneButton(
          buttonText: '??????',
          title: '??????',
          content: '????????????\n????????? ??????????????????',
          buttonClick: () {
            Get.back();
          },
        );
      },
    );
  }

  Future<void> signInWithGoogle(OAuthCredential credential, agree) async {
    // Once signed in, return the UserCredential
    // ProfileController.to.addInfoV2(
    //     _textEditingController1.text + '_' + _textEditingController2.text,
    //     TermsCheckController.to.isMan.value);
    // Get.back();
    return await FirebaseAuth.instance
        .signInWithCredential(credential)
        .then((value) async {
      await Get.to(() => UserRegisterPage(),
          transition: Transition.native, arguments: {'agree': agree});
    });
  }

  Future<void> signInWithKakao(credential, agree) async {
    //?????????????????? AUTH????????? ????????? ???????????? ???????????? ???????????????
    // Once signed in, return the UserCredential
    // ProfileController.to.addInfoV2(
    //     _textEditingController1.text + '_' + _textEditingController2.text,
    //     TermsCheckController.to.isMan.value);
    return await FirebaseAuth.instance.signInWithCustomToken(credential).then(
      (sucess) {
        Get.to(() => UserRegisterPage(),
            transition: Transition.native, arguments: {'agree': agree});
      },
    );
  }

  Future<void> signInWithApple(credential, agree) async {
    //?????????????????? AUTH????????? ????????? ???????????? ???????????? ???????????????
    // Once signed in, return the UserCredential
    // ProfileController.to.addInfoV2(
    //     _textEditingController1.text + '_' + _textEditingController2.text,
    //     TermsCheckController.to.isMan.value);

    return await FirebaseAuth.instance
        .signInWithCredential(credential)
        .then((value) {
      Get.to(() => UserRegisterPage(),
          transition: Transition.native, arguments: {'agree': agree});
    });
    // await FirebaseAuth.instance.currentUser!.updateDisplayName(displayName);
    // return await FirebaseAuth.instance.signInWithCustomToken(credential).then(
    //   (sucess) {
    //     Get.to(() => UserRegisterPage(),
    //         transition: Transition.native, arguments: {'agree': agree});
    //   },
    // );
  }
}
