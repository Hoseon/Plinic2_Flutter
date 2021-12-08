import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:line_icons/line_icons.dart';
import 'package:plinic2/constants.dart';
import 'package:plinic2/src/controller/login_controller.dart';
import 'package:plinic2/src/controller/profile_controller.dart';

class AddUserInfoPage extends GetView<ProfileController> {
  AddUserInfoPage({Key? key}) : super(key: key);

  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  final TextEditingController _controller3 = TextEditingController();
  final TextEditingController _controller4 = TextEditingController();
  final _formKey1 = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var mode = Get.arguments['mode'];
    var credential = Get.arguments['credential'];

    return Scaffold(
      bottomSheet: buildBottomButton(credential, mode),
      body: GestureDetector(
        onTap: () {
          Get.focusScope!.unfocus();
        },
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(height: 40),
              Container(
                padding: EdgeInsets.symmetric(horizontal: spacing_xl),
                alignment: Alignment.centerRight,
                child: IconButton(
                  icon: Icon(LineIcons.times, color: black),
                  onPressed: () {
                    Get.back();
                  },
                ),
              ),
              SizedBox(height: 10),
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.symmetric(horizontal: spacing_xl),
                child: Text('추가정보',
                    style: TextStyle(
                      fontFamily: 'NotoSansKR',
                      color: black,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal,
                    )),
              ),
              SizedBox(height: spacing_xxs),
              Container(
                padding: EdgeInsets.symmetric(horizontal: spacing_xl),
                alignment: Alignment.centerLeft,
                child: Text('개인 정보 확인을 위한 인증이 필요합니다.',
                    style: TextStyle(
                      fontFamily: 'NotoSansKR',
                      color: black,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    )),
              ),
              SizedBox(height: 40),
              Container(
                padding: EdgeInsets.symmetric(horizontal: spacing_xl),
                alignment: Alignment.centerLeft,
                child: Text('닉네임',
                    style: TextStyle(
                      fontFamily: 'NotoSansKR',
                      color: black,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal,
                    )),
              ),
              SizedBox(height: spacing_xl),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
                child: Form(
                  key: _formKey1,
                  child: TextFormField(
                    controller: _controller1,
                    validator: (String? value) {
                      if (value == null || value.isEmpty || value.length < 2) {
                        return '닉네임을 정확하게 입력하세요';
                      }
                      return null;
                    },
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(8),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: grey_2, width: 0.5),
                      ),
                      focusColor: Colors.red,
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: grey_1, width: 0.5)),
                      // labelText: '닉네임',
                      hintText: '플리닉에서 사용하실 닉네임을 입력해주세요.',
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
              SizedBox(height: 36),
              Container(
                padding: EdgeInsets.symmetric(horizontal: spacing_xl),
                alignment: Alignment.centerLeft,
                child: Text('휴대폰인증',
                    style: TextStyle(
                      fontFamily: 'NotoSansKR',
                      color: black,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal,
                    )),
              ),
              SizedBox(height: spacing_xs),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
                child: TextField(
                  // controller: controller1,
                  keyboardType: TextInputType.phone,
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(8),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: grey_2, width: 0.5),
                    ),
                    focusColor: Colors.red,
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: grey_1, width: 0.5)),
                    // labelText: '닉네임',
                    hintText: '휴대폰인증 (임시)',
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
              SizedBox(height: spacing_s),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
                child: TextField(
                  // controller: controller1,
                  keyboardType: TextInputType.phone,
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(8),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: grey_2, width: 0.5),
                    ),
                    focusColor: Colors.red,
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: grey_1, width: 0.5)),
                    // labelText: '닉네임',
                    hintText: '인증코드',
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
              SizedBox(height: spacing_s),
              Container(
                padding: EdgeInsets.symmetric(horizontal: spacing_xxl2),
                alignment: Alignment.centerRight,
                child: Text('인증번호 재전송',
                    style: TextStyle(
                        fontFamily: 'NotoSansKR',
                        color: grey_1,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        decoration: TextDecoration.underline)),
              ),
              SizedBox(height: 52),
              Container(
                padding: EdgeInsets.symmetric(horizontal: spacing_xl),
                alignment: Alignment.centerLeft,
                child: Text('추천코드 입력',
                    style: TextStyle(
                      fontFamily: 'NotoSansKR',
                      color: black,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal,
                    )),
              ),
              SizedBox(height: spacing_xs),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
                child: Form(
                  key: _formKey2,
                  child: TextFormField(
                    validator: (String? value) {
                      if (value == null || value.isEmpty || value.length < 2) {
                        return '추천인 입력 필수(임시 기능)';
                      }
                    },
                    controller: _controller2,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(8),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: grey_2, width: 0.5),
                      ),
                      focusColor: Colors.red,
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: grey_1, width: 0.5)),
                      // labelText: '닉네임',
                      hintText: '휴대폰인증 (임시)',
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
              SizedBox(height: 100),
              // Expanded(child: SizedBox(height: 1)),
              // ElevatedButton(
              //   style: ButtonStyle(
              //     minimumSize: MaterialStateProperty.all(
              //         Size(Get.mediaQuery.size.width, 60)),
              //     elevation: MaterialStateProperty.all(0.0),
              //     shape: MaterialStateProperty.all(
              //         RoundedRectangleBorder(borderRadius: BorderRadius.zero)),
              //     backgroundColor: MaterialStateProperty.all(primaryColor),
              //   ),
              //   onPressed: () {
              //     // _gotoLogin();
              //   },
              //   child: Text(
              //     '추가 정보 입력 완료',
              //     style: TextStyle(
              //       fontFamily: 'NotoSansKR',
              //       color: white,
              //       fontSize: 16,
              //       fontWeight: FontWeight.w700,
              //       fontStyle: FontStyle.normal,
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }

  ElevatedButton buildBottomButton(var credential, var mode) {
    return ElevatedButton(
      style: ButtonStyle(
        minimumSize:
            MaterialStateProperty.all(Size(Get.mediaQuery.size.width, 60)),
        elevation: MaterialStateProperty.all(0.0),
        shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.zero)),
        backgroundColor: MaterialStateProperty.all(primaryColor),
      ),
      onPressed: () {
        if (_formKey1.currentState!.validate() &&
            _formKey2.currentState!.validate()) {
          mode == 'google'
              ? signInWithGoogle(credential)
              : signInWithKakao(credential);
        } else {
          return null;
        }
      },
      child: Text(
        '추가 정보 입력 완료',
        style: TextStyle(
          fontFamily: 'NotoSansKR',
          color: white,
          fontSize: 16,
          fontWeight: FontWeight.w700,
          fontStyle: FontStyle.normal,
        ),
      ),
    );
  }

  Future<UserCredential> signInWithGoogle(OAuthCredential credential) async {
    // Once signed in, return the UserCredential
    ProfileController.to.addInfo(_controller1.text, _controller2.text);

    Get.back();
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  Future<UserCredential> signInWithKakao(credential) async {
    // Once signed in, return the UserCredential
    ProfileController.to.addInfo(_controller1.text, _controller2.text);

    Get.back();
    return await FirebaseAuth.instance.signInWithCustomToken(credential);
  }
}
