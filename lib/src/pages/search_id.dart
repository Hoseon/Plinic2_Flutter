import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:plinic2/constants.dart';
import 'package:plinic2/src/component/loading.dart';
import 'package:plinic2/src/component/plinic_dialog_one_button.dart';
import 'package:plinic2/src/controller/findId_controller.dart';
import 'package:plinic2/src/pages/check_login.dart';
import 'package:plinic2/src/pages/login.dart';
import 'package:plinic2/src/pages/register.dart';
import 'package:plinic2/src/restclient/UserClient.dart';

class SearchIdPage extends StatelessWidget {
  const SearchIdPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var values = Get.arguments;
    print(values['phone']);

    return Scaffold(
      backgroundColor: white,
      appBar: buildAppbar(),
      body: GetX<FindIdController>(
        init:
            Get.put<FindIdController>(FindIdController(phone: values['phone'])),
        builder: (FindIdController findIdController) {
          if (findIdController.isLoading.value) {
            return LoadingPage();
          } else {
            if (findIdController.phoneAuth.value.uid != null) {
              return buildBody(findIdController.phoneAuth.value);
            }
            return buildAlert();
          }
        },
      ),
    );
  }

  Widget buildBody(PhoneAuth values) {
    return Column(
      children: [
        SizedBox(height: 50),
        Container(
          alignment: Alignment.center,
          child: Icon(LineIcons.checkCircle, color: primary, size: 75),
        ),
        SizedBox(height: 22),
        Container(
          alignment: Alignment.center,
          child: Text(
            '입력하신 정보와 일치하는\n결과입니다.',
            style: TextStyle(
              // fontFamily: 'NotoSansKR',
              color: black,
              fontSize: 18,
              height: 1.61,
              fontWeight: FontWeight.w700,
              fontStyle: FontStyle.normal,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(height: spacing_m),
        Text(
          '개인정보 보호를 위해 가입 된 SNS와 이메일의\n일부만 제공합니다.',
          style: TextStyle(
            // fontFamily: 'NotoSansKR',
            color: black,
            fontSize: 14,
            height: 1.64,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: spacing_xl),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
          child: Container(
            width: Get.mediaQuery.size.width,
            height: 44,
            decoration: BoxDecoration(
              color: grey_2,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Row(
              children: [
                SizedBox(width: 18),
                values.uid.toString().indexOf('kakao') > 0
                    ? Row(
                        children: [
                          Image.asset(
                            'assets/images/kakao-talk-mini.png',
                            width: 20,
                          ),
                          SizedBox(width: 10),
                          Text(
                            '카카오',
                            style: TextStyle(
                              // fontFamily: 'NotoSansKR',
                              color: Color(0xff000000),
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                            ),
                          ),
                        ],
                      )
                    : Row(
                        children: [
                          Image.asset(
                            'assets/images/google-mini.png',
                            width: 20,
                          ),
                          SizedBox(width: 10),
                          Text(
                            '구글',
                            style: TextStyle(
                              // fontFamily: 'NotoSansKR',
                              color: Color(0xff000000),
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                            ),
                          ),
                        ],
                      ),
                SizedBox(width: 56),
                Text(
                  values.email.toString(),
                  style: TextStyle(
                    // fontFamily: 'NotoSansKR',
                    color: textfields,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                  ),
                )
              ],
            ),
          ),
        ),
        SizedBox(height: spacing_m),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
          child: ElevatedButton(
            style: ButtonStyle(
              alignment: Alignment.center,
              backgroundColor: MaterialStateProperty.all(primary),
              elevation: MaterialStateProperty.all(0),
              side: MaterialStateProperty.all(
                BorderSide(
                  color: grey_2,
                ),
              ),
              minimumSize: MaterialStateProperty.all(
                Size(Get.mediaQuery.size.width, 44),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('로그인 바로 가기',
                    style: TextStyle(
                      // fontFamily: 'NotoSansKR',
                      color: white,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal,
                    ))
              ],
            ),
            onPressed: () {
              Get.offAll(Login(), transition: Transition.native);
            },
          ),
        ),
      ],
    );
  }

  AppBar buildAppbar() {
    return AppBar(
        backgroundColor: white,
        elevation: 0.0,
        title: Text(
          '아이디 찾기',
          style: TextStyle(
            // fontFamily: 'NotoSansKR',
            color: Color(0xff000000),
            fontSize: 16,
            fontWeight: FontWeight.w700,
            fontStyle: FontStyle.normal,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Get.offAll(RegisterPage(), transition: Transition.native);
            },
            icon: Icon(LineIcons.times, color: black),
          ),
        ],
        leading: SizedBox());
  }

  Widget buildAlert() {
    return PlinicDialogOneButton(
      title: '알림',
      content: '본인인증을 완료한 회원만 \n이용 가능한 서비스입니다.',
      buttonText: '확인',
      buttonClick: () {
        Get.offAll(() => CheckLogin(), transition: Transition.native);
      },
    );
  }

  void exitDialog(BuildContext context) async {
    await showAnimatedDialog(
      context: context,
      barrierDismissible: false,
      animationType: DialogTransitionType.fade,
      curve: Curves.fastOutSlowIn,
      builder: (BuildContext context) {
        return PlinicDialogOneButton(
          title: '알림',
          content: '본인인증을 완료한 회원만 \n이용 가능한 서비스입니다.',
          buttonText: '확인',
          buttonClick: () {
            Get.offAll(() => CheckLogin(), transition: Transition.native);
          },
        );
      },
    );
  }
}
