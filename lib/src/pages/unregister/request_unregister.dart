import 'package:auto_size_text/auto_size_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plinic2/constants.dart';
import 'package:plinic2/src/component/custom_appbar.dart';
import 'package:plinic2/src/restclient/UserClient.dart';

class RequestUnRegisterPage extends StatelessWidget {
  RequestUnRegisterPage({Key? key}) : super(key: key);
  UnRegisterModel? unRegisterModel;
  @override
  Widget build(BuildContext context) {
    unRegisterModel = Get.arguments;
    print(unRegisterModel!.phone);
    return Scaffold(
        appBar: CustomAppbar('회원탈퇴'),
        backgroundColor: white,
        body: buildBody());
  }

  Widget buildBody() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: spacing_xl),
          AutoSizeText('회원탈퇴 신청이 완료되었습니다.',
              style: TextStyle(
                fontFamily: 'NotoSans',
                color: black,
                fontSize: 14,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
              )),
          SizedBox(height: 10),
          AutoSizeText(
              '(탈퇴 신청 날짜 : ${unRegisterModel!.unRegisterAt.toString().substring(0, 10)})',
              style: TextStyle(
                fontFamily: 'NotoSans',
                color: black,
                fontSize: 14,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
              )),
          SizedBox(height: spacing_xl),
          RichText(
              text: TextSpan(children: [
            TextSpan(
                text: '신청일부터',
                style: TextStyle(
                  fontFamily: 'NotoSans',
                  color: black,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                )),
            TextSpan(
                text: '14일 이후 탈퇴가 완료',
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
          ])),
          SizedBox(height: spacing_xs),
          Text('탈퇴를 철회하시려면 14일 이내에 ‘카카오 문의하기’로 문의 바랍니다.'),
          SizedBox(height: 46),
          ConstrainedBox(
            constraints: BoxConstraints.tightFor(
                width: Get.mediaQuery.size.width, height: 40),
            child: ElevatedButton(
                style: ButtonStyle(
                  // shape: MaterialStateProperty.all(
                  //     RoundedRectangleBorder(borderRadius: BorderRadius.zero)),
                  elevation: MaterialStateProperty.all(0.0),
                  backgroundColor: MaterialStateProperty.all(primary),
                ),
                onPressed: () async {
                  await FirebaseAuth.instance.signOut().then((onvalue) async {
                    await Get.offAllNamed('/app');
                  }, onError: (e) {
                    throw e;
                  });
                },
                child: AutoSizeText('확인',
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'NotoSans',
                        fontStyle: FontStyle.normal,
                        fontSize: 16.0),
                    textAlign: TextAlign.center)),
          ),
        ],
      ),
    );
  }
}
