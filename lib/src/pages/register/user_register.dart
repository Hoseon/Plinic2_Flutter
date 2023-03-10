import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:plinic2/constants.dart';
import 'package:plinic2/src/component/loading.dart';
import 'package:plinic2/src/component/plinic_dialog_one_button.dart';
import 'package:plinic2/src/controller/profile_controller.dart';
import 'package:plinic2/src/controller/register/register_controller.dart';
import 'package:plinic2/src/pages/check_login.dart';
import 'package:plinic2/src/pages/register.dart';

class UserRegisterPage extends StatefulWidget {
  UserRegisterPage({Key? key}) : super(key: key);

  @override
  State<UserRegisterPage> createState() => _UserRegisterPageState();
}

class _UserRegisterPageState extends State<UserRegisterPage> {
  Future? myFuture;

  Future<dynamic> _fetchData() async {
    await Future.delayed(Duration(milliseconds: 1500));
    var result = await RegisterController.to.registerUser();
    return result;
  }

  @override
  void initState() {
    myFuture = _fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Get.put<RegisterController>(RegisterController());
    return Scaffold(
      backgroundColor: white,
      body: _registerUser(context),
    );
  }

  Widget _registerUser(BuildContext context) {
    return Obx(
      () => ProfileController.to.myProfile.value.uid != null
          ? FutureBuilder(
              future: myFuture,
              builder: (_, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  if (snapshot.data == '201') {
                    return _registerCompUser(context);
                  } else if (snapshot.data == '409') {
                    return _conflictUser(context);
                  } else if (snapshot.data == '400') {
                    return _errorUser(context);
                  } else if (snapshot.data == '404') {
                    return _errorUser(context);
                  }
                }
                return LoadingPage();
              })
          : Center(
              child: CircularProgressIndicator(
              color: primary,
            )),
    );
  }

  Widget _registerCompUser(BuildContext context) {
    //???????????? ??????
    ProfileController.to.isRegisterComplete(false);
    return Column(
      children: [
        SizedBox(height: 188.5),
        Container(
            alignment: Alignment.center,
            child: SvgPicture.asset('assets/images/register/checkCircle.svg')),
        SizedBox(height: 48.5),
        Text(
          '???????????? ??????',
          style: TextStyle(
            fontFamily: 'NotoSans',
            color: Color(0xff1d1d1d),
            fontSize: 20,
            fontWeight: FontWeight.w700,
            fontStyle: FontStyle.normal,
          ),
        ),
        SizedBox(height: 8),
        Text(
          '????????? ????????? ????????? ??????????????? :)\n????????? ?????? ???????????? ?????? ????????? ??????????????????.',
          style: TextStyle(
            fontFamily: 'NotoSans',
            color: Color(0xff1d1d1d),
            fontSize: 12,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
          textAlign: TextAlign.center,
        ),
        Expanded(child: SizedBox(height: 1)),
        buildBottomUserComplete(context) //?????? ??????
      ],
    );
  }

  Widget _conflictUser(BuildContext context) {
    //?????? ???????????? ?????? ???
    ProfileController.to.isRegisterComplete(false);
    FirebaseAuth.instance.signOut();
    return Column(
      children: [
        SizedBox(height: 218.5),
        Container(
            alignment: Alignment.center,
            child: SvgPicture.asset('assets/images/register/ellipsisH.svg')),
        SizedBox(height: 78.5),
        Text(
          '?????? ???????????? ??????',
          style: TextStyle(
            fontFamily: 'NotoSans',
            color: Color(0xff1d1d1d),
            fontSize: 20,
            fontWeight: FontWeight.w700,
            fontStyle: FontStyle.normal,
          ),
        ),
        SizedBox(height: 8),
        Text(
          '?????? ???????????? ?????? ???????????? ??????????????????.\n????????? ?????? ?????????????',
          style: TextStyle(
            fontFamily: 'NotoSans',
            color: Color(0xff1d1d1d),
            fontSize: 12,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
          textAlign: TextAlign.center,
        ),
        Expanded(child: SizedBox(height: 1)),
        buildBottomUserConflict(context) //?????? ??????
      ],
    );
  }

  Widget _errorUser(BuildContext context) {
    ProfileController.to.isRegisterComplete(false);
    FirebaseAuth.instance.signOut();
    //?????? ????????? ???????????? ???????????? ?????? view
    return Column(
      children: [
        SizedBox(height: 218.5),
        Container(
            alignment: Alignment.center,
            child: SvgPicture.asset('assets/images/register/ellipsisH.svg')),
        SizedBox(height: 78.5),
        Text(
          '?????? ???????????? ??????',
          style: TextStyle(
            fontFamily: 'NotoSans',
            color: Color(0xff1d1d1d),
            fontSize: 20,
            fontWeight: FontWeight.w700,
            fontStyle: FontStyle.normal,
          ),
        ),
        SizedBox(height: 8),
        Text(
          '?????? ??? ????????? ???????????????\n?????? ?????? ?????????????????????????',
          style: TextStyle(
            fontFamily: 'NotoSans',
            color: Color(0xff1d1d1d),
            fontSize: 12,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
          textAlign: TextAlign.center,
        ),
        Expanded(child: SizedBox(height: 1)),
        buildBottomUserError(context) //?????? ?????? ??????
      ],
    );
  }

  Widget buildBottomUserComplete(BuildContext context) {
    //?????? ???????????? ?????? ?????? ?????? ??????
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
        Get.offAll(() => CheckLogin(), transition: Transition.native);
      },
      child: Text(
        '????????? ????????????',
        style: TextStyle(
          fontFamily: 'NotoSans',
          color: Color(0xffffffff),
          fontSize: 16,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
        ),
      ),
    );
  }

  Widget buildBottomUserConflict(BuildContext context) {
    //?????? ???????????? ?????? ?????? ?????? ??????
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
        FirebaseAuth.instance.signOut().then((onvalue) async {
          await Get.offAllNamed('/app');
        }, onError: (e) {
          throw e;
        });
        Get.offAllNamed('/app');
      },
      child: Text(
        '????????? ????????????',
        style: TextStyle(
          fontFamily: 'NotoSans',
          color: Color(0xffffffff),
          fontSize: 16,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
        ),
      ),
    );
  }

  Widget buildBottomUserError(BuildContext context) {
    //?????? ?????? ????????? ???????????? ?????? ?????? ??????
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
        FirebaseAuth.instance.signOut().then((onvalue) async {
          await Get.offAllNamed('/app');
        }, onError: (e) {
          throw e;
        });
        Get.offAllNamed('/app');
      },
      child: Text(
        '?????? ???????????? ????????????',
        style: TextStyle(
          fontFamily: 'NotoSans',
          color: Color(0xffffffff),
          fontSize: 16,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
        ),
      ),
    );
  }

  void registerDialog(context) async {
    await showAnimatedDialog(
      context: context,
      barrierDismissible: false,
      animationType: DialogTransitionType.fade,
      curve: Curves.fastOutSlowIn,
      builder: (BuildContext context) {
        return PlinicDialogOneButton(
          buttonText: '??????',
          title: '??????',
          content: '??????????????? ?????????????????????',
          buttonClick: () {
            Get.back();
            Get.offAll(() => CheckLogin(), transition: Transition.native);
          },
        );
      },
    );
  }

  void registerFailDialog(context) async {
    await showAnimatedDialog(
      context: context,
      barrierDismissible: false,
      animationType: DialogTransitionType.fade,
      curve: Curves.fastOutSlowIn,
      builder: (BuildContext context) {
        return PlinicDialogOneButton(
          buttonText: '??????',
          title: '??????',
          content: '??????????????? ?????? ???????????????.',
          buttonClick: () {
            Get.back();
            Get.offAll(() => RegisterPage(), transition: Transition.native);
          },
        );
      },
    );
  }
}
