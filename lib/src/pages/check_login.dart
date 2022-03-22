import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plinic2/constants.dart';
import 'package:plinic2/src/component/loading.dart';
import 'package:plinic2/src/controller/login_controller.dart';
import 'package:plinic2/src/controller/profile_controller.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:plinic2/src/pages/login.dart';
import 'package:plinic2/src/pages/register.dart';
import 'package:plinic2/src/pages/tabs/tabs.dart';
import 'package:plinic2/src/restclient/UserClient.dart';

class CheckLogin extends StatefulWidget {
  CheckLogin({Key? key}) : super(key: key);

  @override
  State<CheckLogin> createState() => _CheckLoginState();
}

class _CheckLoginState extends State<CheckLogin> {
  bool isConnect = false;

  var connectivityResult;

  @override
  Widget build(BuildContext context) {
    Get.put(LoginController(), permanent: true);
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
        // if (snapshot.data!.displayName == null) {
        //   ProfileController.to.authStateChange(snapshot.data!);
        // } else {
        //   ProfileController.to.authStateChange(snapshot.data!);
        // }

        if (snapshot.data == null) {
          // firebase auth에 사용자가 정상적으로 안올라 갔을때
        } else {
          ProfileController.to.authStateChange(snapshot.data!);

          // if (snapshot.data!.displayName != null) {
          //   ProfileController.to.authStateChange(snapshot.data!);
          // } else {
          //   ProfileController.to.authStateChange(snapshot.data!);
          // }
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return LoadingPage();
        }

        if (snapshot.hasData) {
          return Tabs();
        } else if (snapshot.hasData == false) {
          return RegisterPage();
        } else {
          return RegisterPage();
        }

        // return Scaffold(
        //   body: Center(
        //     child: CircularProgressIndicator(),
        //   ),
        // );
      },
    );
  }

  Future<void> showDialogOneButton(
      BuildContext context, String title, String content) async {
    await showAnimatedDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          // return Dialog(
          //   backgroundColor: Colors.deepPurple,
          //   child: Text('qqq'),
          // );// 커스텀 다이얼 로그로 만들수 있다.
          return AlertDialog(
            backgroundColor: Colors.white,
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(title,
                    style: const TextStyle(
                        color: Color(0xff000000),
                        fontWeight: FontWeight.w700,
                        fontFamily: 'NotoSansKR',
                        fontStyle: FontStyle.normal,
                        fontSize: 20.0),
                    textAlign: TextAlign.center),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      content,
                      style: TextStyle(
                        fontFamily: 'NotoSansKR',
                        color: Colors.grey,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      ),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
                SizedBox(height: 20),
                Center(
                  child: ConstrainedBox(
                    constraints: BoxConstraints.tightFor(
                        width: Get.mediaQuery.size.width, height: 42),
                    // ConstrainedBox(
                    //     constraints: BoxConstraints.tightFor(
                    //         width: MediaQuery.of(context).size.width * 0.9,
                    //         height: 44),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        elevation: MaterialStateProperty.all(0.0),
                        backgroundColor:
                            MaterialStateProperty.all(primaryColor),
                      ),
                      onPressed: () {
                        Get.back();
                      },
                      child: Text('확인',
                          style: TextStyle(
                            fontFamily: 'NotoSansKR',
                            color: Color(0xffffffff),
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            fontStyle: FontStyle.normal,
                          )),
                    ),
                  ),
                )
              ],
            ),
          );
        },
        animationType: DialogTransitionType.slideFromBottomFade,
        curve: Curves.fastOutSlowIn,
        duration: Duration(seconds: 1),
        // barrierColor: Colors.black
        alignment: Alignment.topCenter);
  }

  Future<void> showDialogTwoButton(
      BuildContext context, String title, String content) async {
    await showAnimatedDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          // return Dialog(
          //   backgroundColor: Colors.deepPurple,
          //   child: Text('qqq'),
          // );// 커스텀 다이얼 로그로 만들수 있다.
          return AlertDialog(
            backgroundColor: Colors.white,
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(title,
                    style: const TextStyle(
                        color: Color(0xff000000),
                        fontWeight: FontWeight.w700,
                        fontFamily: 'NotoSansKR',
                        fontStyle: FontStyle.normal,
                        fontSize: 20.0),
                    textAlign: TextAlign.center),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      content,
                      style: TextStyle(
                        fontFamily: 'NotoSansKR',
                        color: Colors.grey,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      ),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
                SizedBox(height: 20),
                Center(
                  child: ConstrainedBox(
                    constraints: BoxConstraints.tightFor(
                        width: Get.mediaQuery.size.width, height: 42),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        elevation: MaterialStateProperty.all(0.0),
                        backgroundColor:
                            MaterialStateProperty.all(primaryColor),
                      ),
                      onPressed: () {
                        Get.back();
                      },
                      child: Text('지금 업데이트',
                          style: TextStyle(
                            fontFamily: 'NotoSansKR',
                            color: Color(0xffffffff),
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            fontStyle: FontStyle.normal,
                          )),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Center(
                  child: ConstrainedBox(
                    constraints: BoxConstraints.tightFor(
                        width: Get.mediaQuery.size.width, height: 42),
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Color(0x42566789)),
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          elevation: MaterialStateProperty.all(0.0),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.white),
                        ),
                        onPressed: () {
                          Get.back();
                        },
                        child: Text('다음에 할께요',
                            style: TextStyle(
                              fontFamily: 'NotoSansKR',
                              color: Color(0x80151920),
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              fontStyle: FontStyle.normal,
                            )),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
        animationType: DialogTransitionType.slideFromBottomFade,
        curve: Curves.fastOutSlowIn,
        duration: Duration(seconds: 1),
        // barrierColor: Colors.black
        alignment: Alignment.topCenter);
  }
}
