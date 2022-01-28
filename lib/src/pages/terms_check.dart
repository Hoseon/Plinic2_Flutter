import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:plinic2/constants.dart';
import 'package:plinic2/src/component/plinic_dialog_two_button.dart';
import 'package:plinic2/src/controller/terms_check_controller.dart';
import 'package:plinic2/src/pages/add_user_info_v2.dart';
import 'package:plinic2/src/pages/check_login.dart';
import 'package:plinic2/src/pages/terms/mandatory_permission.dart';
import 'package:plinic2/src/pages/terms/optional_permission.dart';
import 'package:plinic2/src/pages/terms/terms_agree.dart';
import 'package:plinic2/src/pages/terms/terms_marketing.dart';
import 'package:plinic2/src/pages/terms/terms_service.dart';

class TermsCheckPage extends GetView<TermsCheckController> {
  const TermsCheckPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => TermsCheckController());
    var mode = Get.arguments['mode'];
    var credential = Get.arguments['credential'];

    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        leading: SizedBox(),
        elevation: 0.0,
        backgroundColor: white,
        actions: [
          IconButton(
            onPressed: () {
              exitDialog(context);
            },
            icon: Icon(LineIcons.times),
            color: black,
          )
        ],
      ),
      bottomSheet: bottomButton(mode, credential),
      body: Column(
        children: [
          SizedBox(height: 60),
          //////////////////////////////
          Container(
            alignment: Alignment.center,
            child: Text(
              '회원가입을 위한 약관동의',
              style: TextStyle(
                fontFamily: 'NotoSansKR',
                color: black,
                fontSize: 18,
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.normal,
              ),
            ),
          ),
          //////////////////////////////
          SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.only(left: 32, right: 36),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Obx(
                  () => controller.allCheck.value
                      ? IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: () {
                            controller.CheckAll(controller.allCheck.value);
                          },
                          icon: Icon(LineIcons.checkSquare,
                              color: primary_light, size: 24),
                        )
                      : IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: () {
                            controller.CheckAll(controller.allCheck.value);
                          },
                          icon: Icon(LineIcons.checkSquare,
                              color: grey_2, size: 24),
                        ),
                ),
                Text(
                  '약관에 모두 동의',
                  style: TextStyle(
                    // fontFamily: 'NotoSansKR',
                    color: black,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                  ),
                )
              ],
            ),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.only(left: 32, right: 36),
            child: Row(
              children: [
                Obx(
                  () => controller.check1.value
                      ? IconButton(
                          padding: EdgeInsets.all(0),
                          onPressed: () {
                            controller.toggleCheck1(controller.check1.value);
                          },
                          icon: Icon(LineIcons.checkSquare,
                              size: 20, color: primary_light),
                        )
                      : IconButton(
                          padding: EdgeInsets.all(0),
                          onPressed: () {
                            controller.toggleCheck1(controller.check1.value);
                          },
                          icon: Icon(LineIcons.checkSquare,
                              size: 20, color: grey_2),
                        ),
                ),
                Expanded(
                  child: Text(
                    '이용약관 동의 (필수)',
                    style: TextStyle(
                      // fontFamily: 'NotoSansKR',
                      color: grey_1,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                ),
                IconButton(
                    onPressed: () {
                      Get.to(() => TermsServicePage(),
                          transition: Transition.native);
                    },
                    icon: Icon(
                      LineIcons.angleRight,
                      color: grey_2,
                      size: 18,
                    ))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 32, right: 36),
            child: Row(
              children: [
                Obx(
                  () => controller.check2.value
                      ? IconButton(
                          padding: EdgeInsets.all(0),
                          onPressed: () {
                            controller.toggleCheck2(controller.check2.value);
                          },
                          icon: Icon(LineIcons.checkSquare,
                              size: 20, color: primary_light),
                        )
                      : IconButton(
                          padding: EdgeInsets.all(0),
                          onPressed: () {
                            controller.toggleCheck2(controller.check2.value);
                          },
                          icon: Icon(LineIcons.checkSquare,
                              size: 20, color: grey_2),
                        ),
                ),
                Expanded(
                  child: Text(
                    '개인정보 이용,수집 동의 (필수)',
                    style: TextStyle(
                      // fontFamily: 'NotoSansKR',
                      color: grey_1,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                ),
                IconButton(
                    onPressed: () {
                      Get.to(TermsAgreePage(), transition: Transition.native);
                    },
                    icon: Icon(
                      LineIcons.angleRight,
                      color: grey_2,
                      size: 18,
                    ))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 32, right: 36),
            child: Row(
              children: [
                Obx(
                  () => controller.check3.value
                      ? IconButton(
                          padding: EdgeInsets.all(0),
                          onPressed: () {
                            controller.toggleCheck3(controller.check3.value);
                          },
                          icon: Icon(LineIcons.checkSquare,
                              size: 20, color: primary_light),
                        )
                      : IconButton(
                          padding: EdgeInsets.all(0),
                          onPressed: () {
                            controller.toggleCheck3(controller.check3.value);
                          },
                          icon: Icon(LineIcons.checkSquare,
                              size: 20, color: grey_2),
                        ),
                ),
                Expanded(
                  child: Text(
                    '서비스 이용 필수 접근 권한 (필수)',
                    style: TextStyle(
                      // fontFamily: 'NotoSansKR',
                      color: grey_1,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                ),
                IconButton(
                    onPressed: () {
                      Get.to(MandatoryPermissionPage(),
                          transition: Transition.native);
                    },
                    icon: Icon(
                      LineIcons.angleRight,
                      color: grey_2,
                      size: 18,
                    ))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 32, right: 36),
            child: Row(
              children: [
                Obx(
                  () => controller.check4.value
                      ? IconButton(
                          padding: EdgeInsets.all(0),
                          onPressed: () {
                            controller.toggleCheck4(controller.check4.value);
                          },
                          icon: Icon(LineIcons.checkSquare,
                              size: 20, color: primary_light),
                        )
                      : IconButton(
                          padding: EdgeInsets.all(0),
                          onPressed: () {
                            controller.toggleCheck4(controller.check4.value);
                          },
                          icon: Icon(LineIcons.checkSquare,
                              size: 20, color: grey_2),
                        ),
                ),
                Expanded(
                  child: Text(
                    '서비스 이용 접근 권한 (선택)',
                    style: TextStyle(
                      // fontFamily: 'NotoSansKR',
                      color: grey_1,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                ),
                IconButton(
                    onPressed: () {
                      Get.to(() => OptionalPermissionPage(),
                          transition: Transition.native);
                    },
                    icon: Icon(
                      LineIcons.angleRight,
                      color: grey_2,
                      size: 18,
                    ))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 32, right: 36),
            child: Row(
              children: [
                Obx(
                  () => controller.check5.value
                      ? IconButton(
                          padding: EdgeInsets.all(0),
                          onPressed: () {
                            controller.toggleCheck5(controller.check5.value);
                          },
                          icon: Icon(LineIcons.checkSquare,
                              size: 20, color: primary_light),
                        )
                      : IconButton(
                          padding: EdgeInsets.all(0),
                          onPressed: () {
                            controller.toggleCheck5(controller.check5.value);
                          },
                          icon: Icon(LineIcons.checkSquare,
                              size: 20, color: grey_2),
                        ),
                ),
                Expanded(
                  child: Text(
                    '마케팅 활용 동의 (선택)',
                    style: TextStyle(
                      // fontFamily: 'NotoSansKR',
                      color: grey_1,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                ),
                IconButton(
                    onPressed: () {
                      Get.to(TermsMarketingPage(),
                          transition: Transition.native);
                    },
                    icon: Icon(
                      LineIcons.angleRight,
                      color: grey_2,
                      size: 18,
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget bottomButton(String mode, var credential) {
    return Obx(
      () => (controller.check1.value &&
              controller.check2.value &&
              controller.check3.value)
          ? ElevatedButton(
              style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all(
                      Size(Get.mediaQuery.size.width, 60)),
                  // side: MaterialStateProperty.all(BorderSide(color: grey_2)),
                  shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(borderRadius: BorderRadius.zero)),
                  elevation: MaterialStateProperty.all(0.0),
                  backgroundColor: MaterialStateProperty.all(primary)),
              onPressed: () {
                var agree = {
                  //사용자의 약관동의 정보를 저장하여 전달한다.
                  'uid': '',
                  'agree1': controller.check1.value,
                  'agree2': controller.check2.value,
                  'agree3': controller.check3.value,
                  'opt_agree4': controller.check4.value,
                  'opt_agree5': controller.check5.value,
                };
                Get.to(() => AddUserInfoV2Page(),
                    transition: Transition.native,
                    arguments: {
                      'mode': mode,
                      'credential': credential,
                      'agree': agree
                    });
              },
              child: Text('다음 단계',
                  style: TextStyle(
                    fontFamily: 'NotoSansKR',
                    fontSize: 16,
                    color: white,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal,
                  )),
            )
          : ElevatedButton(
              style: ButtonStyle(
                minimumSize: MaterialStateProperty.all(
                    Size(Get.mediaQuery.size.width, 60)),
                side: MaterialStateProperty.all(BorderSide(color: grey_2)),
                // shape: MaterialStateProperty.all(
                //     RoundedRectangleBorder(borderRadius: BorderRadius.zero)),
                elevation: MaterialStateProperty.all(0.0),
                backgroundColor: MaterialStateProperty.resolveWith<Color>(
                    (Set<MaterialState> states) {
                  if (states.contains(MaterialState.pressed)) {
                    return Colors.grey.shade200;
                  }
                  return grey_2;
                }),
              ),
              onPressed: () {
                // Get.back();
              },
              child: Text('다음 단계',
                  style: TextStyle(
                    fontFamily: 'NotoSansKR',
                    fontSize: 16,
                    color: white,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal,
                  )),
            ),
    );
  }

  void exitDialog(context) async {
    await showAnimatedDialog(
      context: context,
      barrierDismissible: true,
      animationType: DialogTransitionType.fade,
      curve: Curves.fastOutSlowIn,
      builder: (BuildContext context) {
        return PlinicDialogTwoButton(
          button1Text: '확인',
          button2Text: '취소',
          title: '알림',
          content: '화면을 닫으시는 경우\n회원가입이 중단됩니다.',
          button1Click: () {
            Get.back();
            Get.offAll(() => CheckLogin(), transition: Transition.native);
          },
          button2Click: () {
            Get.back();
          },
        );
      },
    );
  }
}
