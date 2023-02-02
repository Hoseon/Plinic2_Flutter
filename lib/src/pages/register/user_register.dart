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
    //회원가입 분류
    ProfileController.to.isRegisterComplete(false);
    return Column(
      children: [
        SizedBox(height: 188.5),
        Container(
            alignment: Alignment.center,
            child: SvgPicture.asset('assets/images/register/checkCircle.svg')),
        SizedBox(height: 48.5),
        Text(
          '회원가입 완료',
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
          '플리닉 회원이 되신걸 축하드려요 :)\n저희와 함께 예뻐지는 피부 습관을 만들어보세요.',
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
        buildBottomUserComplete(context) //유저 충돌
      ],
    );
  }

  Widget _conflictUser(BuildContext context) {
    //이미 사용자가 있는 뷰
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
          '최종 회원가입 실패',
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
          '해당 아이디는 이미 이용중인 아이디입니다.\n로그인 하러 가볼까요?',
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
        buildBottomUserConflict(context) //유저 충돌
      ],
    );
  }

  Widget _errorUser(BuildContext context) {
    ProfileController.to.isRegisterComplete(false);
    FirebaseAuth.instance.signOut();
    //서버 에러가 있을시에 화면가입 불가 view
    return Column(
      children: [
        SizedBox(height: 218.5),
        Container(
            alignment: Alignment.center,
            child: SvgPicture.asset('assets/images/register/ellipsisH.svg')),
        SizedBox(height: 78.5),
        Text(
          '최종 회원가입 실패',
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
          '가입 중 오류가 발생했어요\n다시 한번 시도해주시겠어요?',
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
        buildBottomUserError(context) //유저 가입 에러
      ],
    );
  }

  Widget buildBottomUserComplete(BuildContext context) {
    //이미 사용자가 있는 경우 하단 버튼
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
        '서비스 이용하기',
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
    //이미 사용자가 있는 경우 하단 버튼
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
        '로그인 하러가기',
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
    //서버 에러 발생시 회원가입 불가 하단 버튼
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
        '다시 회원가입 하러가기',
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
          buttonText: '확인',
          title: '알림',
          content: '회원가입이 완료되었습니다',
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
          buttonText: '확인',
          title: '알림',
          content: '회원가입에 실패 하였습니다.',
          buttonClick: () {
            Get.back();
            Get.offAll(() => RegisterPage(), transition: Transition.native);
          },
        );
      },
    );
  }
}
