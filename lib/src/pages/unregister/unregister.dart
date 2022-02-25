import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:bootpay/bootpay.dart';
import 'package:bootpay/model/extra.dart';
import 'package:bootpay/model/payload.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:get/get.dart';
import 'package:plinic2/constants.dart';
import 'package:plinic2/src/component/custom_appbar.dart';
import 'package:plinic2/src/component/plinic_dialog_one_button.dart';
import 'package:plinic2/src/component/plinic_dialog_two_button.dart';
import 'package:plinic2/src/config/environment.dart';
import 'package:plinic2/src/controller/profile_controller.dart';
import 'package:plinic2/src/pages/unregister/request_unregister.dart';
import 'package:plinic2/src/restclient/UserClient.dart';

class UnRegisterPage extends StatelessWidget {
  UnRegisterPage({Key? key}) : super(key: key);
  Dio dio = Dio();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar('회원 탈퇴하기'),
      backgroundColor: white,
      body: mainBody(),
      bottomSheet: ConstrainedBox(
        constraints: BoxConstraints.tightFor(
            width: Get.mediaQuery.size.width, height: 62),
        child: ElevatedButton(
            style: ButtonStyle(
              shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(borderRadius: BorderRadius.zero)),
              elevation: MaterialStateProperty.all(0.0),
              backgroundColor: MaterialStateProperty.all(grey_2),
            ),
            onPressed: () {
              isSavePost(context);
            },
            child: AutoSizeText('탈퇴하기',
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'NotoSans',
                    fontStyle: FontStyle.normal,
                    fontSize: 16.0),
                textAlign: TextAlign.center)),
      ),
    );
  }

  Widget mainBody() {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: spacing_l),
          headerTitle('유의사항'),
          SizedBox(height: 9),
          textContent('사용하고 계신 계정은 탈퇴가 완료될 경우 복구가 불가하니 유의 해주세요.', primary),
          SizedBox(height: spacing_xs),
          buildRichText(),
          SizedBox(height: spacing_xs),
          buildRichText2(),
          SizedBox(height: spacing_l),
          headerTitle('회원탈퇴 진행방법'),
          SizedBox(height: 9),
          buildRichText3(),
          SizedBox(height: spacing_xs),
          textContent('본인인증(본인 명의의 휴대폰 인증)이 완료 되면 탈퇴 신청이 진행됩니다.', black),
          SizedBox(height: spacing_l),
          headerTitle('회원탈퇴 대기기간 안내'),
          SizedBox(height: spacing_xs),
          buildRichText4(),
          SizedBox(height: spacing_xs),
          buildRichText5(),
          SizedBox(height: spacing_xs),
        ],
      ),
    );
  }

  Container headerTitle(String title) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: spacing_xl),
      alignment: Alignment.centerLeft,
      child: AutoSizeText(
        title,
        style: TextStyle(
          fontFamily: 'NotoSans',
          color: black,
          fontSize: 14,
          fontWeight: FontWeight.w700,
          fontStyle: FontStyle.normal,
        ),
      ),
    );
  }

  Widget buildRichText() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AutoSizeText(
            '•',
            style: TextStyle(
              fontFamily: 'NotoSans',
              color: black,
              fontSize: 14,
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.normal,
            ),
          ),
          SizedBox(width: spacing_xxs),
          Container(
            width: Get.size.width * 0.8,
            child: RichText(
                text: TextSpan(children: [
              TextSpan(
                  text: '탈퇴가 완료 될 경우 앱 ',
                  style: TextStyle(
                    fontFamily: 'NotoSans',
                    color: black,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                  )),
              TextSpan(
                  text: '이용 내역이 삭제',
                  style: TextStyle(
                    fontFamily: 'NotoSans',
                    color: black,
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal,
                  )),
              TextSpan(
                  text: '되며 복구가 불가능 합니다.(로그인 기록,기기사용 내역, 챌린지 이용내역)',
                  style: TextStyle(
                    fontFamily: 'NotoSans',
                    color: black,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                  )),
            ])),
          ),
        ],
      ),
    );
  }

  Widget buildRichText2() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AutoSizeText(
            '•',
            style: TextStyle(
              fontFamily: 'NotoSans',
              color: black,
              fontSize: 14,
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.normal,
            ),
          ),
          SizedBox(width: spacing_xxs),
          Container(
              width: Get.size.width * 0.8,
              child: RichText(
                  text: TextSpan(children: [
                TextSpan(
                    text: '탈퇴 완료된 ',
                    style: TextStyle(
                      fontFamily: 'NotoSans',
                      color: black,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    )),
                TextSpan(
                    text: '동일 계정',
                    style: TextStyle(
                      fontFamily: 'NotoSans',
                      color: black,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal,
                    )),
                TextSpan(
                    text: '으로 재가입이 ',
                    style: TextStyle(
                      fontFamily: 'NotoSans',
                      color: black,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    )),
                TextSpan(
                    text: '불가능',
                    style: TextStyle(
                      fontFamily: 'NotoSans',
                      color: black,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal,
                    )),
                TextSpan(
                    text: '합니다.',
                    style: TextStyle(
                      fontFamily: 'NotoSans',
                      color: black,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    )),
              ]))),
        ],
      ),
    );
  }

  Widget buildRichText3() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AutoSizeText(
            '•',
            style: TextStyle(
              fontFamily: 'NotoSans',
              color: black,
              fontSize: 14,
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.normal,
            ),
          ),
          SizedBox(width: spacing_xxs),
          Container(
            width: Get.size.width * 0.8,
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                      text: '회원 탈퇴 신청 시 불법도용 및 불이익에 대한 피해를 방지하고자 ',
                      style: TextStyle(
                        fontFamily: 'NotoSans',
                        color: black,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      )),
                  TextSpan(
                      text: '본인인증 절차가 진행',
                      style: TextStyle(
                        fontFamily: 'NotoSans',
                        color: black,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.normal,
                      )),
                  TextSpan(
                    text: '됩니다.',
                    style: TextStyle(
                      fontFamily: 'NotoSans',
                      color: black,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildRichText4() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AutoSizeText(
            '•',
            style: TextStyle(
              fontFamily: 'NotoSans',
              color: black,
              fontSize: 14,
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.normal,
            ),
          ),
          SizedBox(width: spacing_xxs),
          Container(
              width: Get.size.width * 0.8,
              child: RichText(
                  text: TextSpan(children: [
                TextSpan(
                    text: '인증 완료 후 14일간의 탈퇴 대기기간이 있으며,탈퇴 대기기간동안 ',
                    style: TextStyle(
                      fontFamily: 'NotoSans',
                      color: black,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    )),
                TextSpan(
                    text: '탈퇴 대기 취소',
                    style: TextStyle(
                      fontFamily: 'NotoSans',
                      color: black,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal,
                    )),
                TextSpan(
                    text: '를 할 수 있습니다.',
                    style: TextStyle(
                      fontFamily: 'NotoSans',
                      color: black,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    )),
              ]))),
        ],
      ),
    );
  }

  Widget buildRichText5() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AutoSizeText(
            '•',
            style: TextStyle(
              fontFamily: 'NotoSans',
              color: black,
              fontSize: 14,
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.normal,
            ),
          ),
          SizedBox(width: spacing_xxs),
          Container(
              width: Get.size.width * 0.8,
              child: RichText(
                  text: TextSpan(children: [
                TextSpan(
                    text: '탈퇴 대기 기간 내에 로그인 시 ',
                    style: TextStyle(
                      fontFamily: 'NotoSans',
                      color: black,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    )),
                TextSpan(
                    text: '탈퇴 대기가 취소되며 정상 이용 가능',
                    style: TextStyle(
                      fontFamily: 'NotoSans',
                      color: black,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal,
                    )),
                TextSpan(
                    text: '합니다.',
                    style: TextStyle(
                      fontFamily: 'NotoSans',
                      color: black,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    )),
              ]))),
        ],
      ),
    );
  }

  Padding textContent(String title, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AutoSizeText(
            '•',
            style: TextStyle(
              fontFamily: 'NotoSans',
              color: color,
              fontSize: 14,
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.normal,
            ),
          ),
          SizedBox(width: spacing_xxs),
          Container(
            width: Get.mediaQuery.size.width * 0.84,
            child: AutoSizeText(
              title,
              style: TextStyle(
                fontFamily: 'NotoSans',
                color: color,
                fontSize: 14,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
              ),
              maxLines: 2,
            ),
          ),
        ],
      ),
    );
  }

  void isSavePost(context) async {
    var client = UserClient(dio);
    await showAnimatedDialog(
      context: context,
      barrierDismissible: true,
      animationType: DialogTransitionType.fade,
      curve: Curves.fastOutSlowIn,
      // duration: Duration(seconds: 1),
      builder: (BuildContext context) {
        return PlinicDialogTwoButton(
          button1Text: '네',
          button2Text: '아니오',
          title: '알림',
          content: '정말 회원 탈퇴하시겠습니까?\n탈퇴를 위해서 본인인증이 필요합니다.',
          button1Click: () async {
            Get.back();
            await client
                .checkPhoneAuth(ProfileController.to.myProfile.value.uid!)
                .then((value) {
              goBootpayRequest(context);
            }).catchError((e) {
              errorDialog(
                  context, '오류', '본인인증을 한적이 없습니다\n회원정보 수정에서\n본인인증을 1회 해주세요');
            });
          },
          button2Click: () {
            Get.back();
            Get.back();
          },
        );
      },
    );
  }

  void goBootpayRequest(BuildContext context) async {
    var payload = Payload();
    payload.androidApplicationId = '60e24e465b2948001ddc501b';
    payload.iosApplicationId = '60e24e465b2948001ddc501c';

    payload.pg = 'danal';
    payload.method = 'auth';
    payload.name = '본인인증';
    payload.orderId = DateTime.now().millisecondsSinceEpoch.toString();

    var extra = Extra();
    extra.appScheme = 'bootpaySample';

    Bootpay().request(
      context: context,
      payload: payload,
      onDone: (String json) async {
        Map<String, dynamic> test = jsonDecode(json); //String to Json으로 변환
        var test2 = UnRegisterModel.fromJson(test); //JSON PhonAuth모델화
        test2.uid = ProfileController.to.myProfile.value.uid;
        test2.email = ProfileController.to.myProfile.value.email;
        final client = UserClient(dio);
        // 사용자 탈퇴 신청 데이터 저장 2022-02-14
        await client.createUnRegister(test2).then((value) async {
          //탈퇴 신청 성공
          Get.back();
          await Get.to(() => RequestUnRegisterPage(), arguments: value);
        }).catchError((e) {
          errorDialog(
              context, '오류', '탈퇴 신청에 오류가 발생했습니다\n관리자에게 문의해주세요.\n카카오 1:1 채팅');
        });
        // await client.savePhoneAuth(test2).then((value) {
        //   //처리가 완료 되면은 해당 페이지를 닫고 수정 페이지로 이동한다.
        //   Get.back();
        //   Get.to(() => EditProfilePage());
        // });
        Get.back();
      },
      onReady: (String json) {
        //flutter는 가상계좌가 발급되었을때  onReady가 호출되지 않는다. onDone에서 처리해주어야 한다.
        print('onReady: $json');
      },
      onCancel: (String json) {
        print('onCancel: $json');
        Get.back();
      },
      onError: (String json) {
        print('onError: $json');
        Get.back();
      },
    );
  }

  void errorDialog(context, title, content) async {
    await showAnimatedDialog(
      context: context,
      barrierDismissible: true,
      animationType: DialogTransitionType.fade,
      curve: Curves.fastOutSlowIn,
      // duration: Duration(seconds: 1),
      builder: (BuildContext context) {
        return PlinicDialogOneButton(
            title: '오류',
            content: '본인인증을 한적이 없습니다\n회원정보 수정에서\n본인인증을 1회 해주세요',
            buttonText: '확인',
            buttonClick: () {
              Get.back();
              Get.back();
            });
      },
    );
  }
}
