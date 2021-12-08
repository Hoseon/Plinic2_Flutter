import 'dart:convert';

import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:get/get.dart';
import 'package:group_button/group_button.dart';
import 'package:line_icons/line_icons.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:plinic2/constants.dart';
import 'dart:async';
import 'dart:ui' as ui;
import 'package:flutter/services.dart';
import 'package:plinic2/src/component/plinic_dialog_two_button.dart';
import 'package:plinic2/src/pages/care/care_comp_mujin1.dart';
import 'package:plinic2/src/pages/care/care_reward.dart';
import 'package:plinic2/src/pages/my/address/address_search.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class CareEventPage extends StatefulWidget {
  const CareEventPage({Key? key}) : super(key: key);

  @override
  _CareEventPageState createState() => _CareEventPageState();
}

class _CareEventPageState extends State<CareEventPage> {
  ui.Image? image;
  bool isBtnCheck = false;
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  final TextEditingController _controller3 = TextEditingController();
  final TextEditingController _controller4 = TextEditingController();
  final MaskedTextController _maskedTextController =
      MaskedTextController(mask: '000-0000-0000');

  @override
  void initState() {
    super.initState();

    loadImage('assets/images/location.png');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 46),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                '연속 케어 챌린지',
                style: TextStyle(
                  fontFamily: 'NotoSansKR',
                  color: black,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.normal,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: spacing_xxs),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
          child: Row(
            children: [
              Text(
                '플라즈마 기기를 매일 매일 연속 사용하시면 \n다양한 보상을 받으실 수 있어요. (미사용시 초기화)',
                style: TextStyle(
                  fontFamily: 'NotoSansKR',
                  color: grey_1,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                ),
              ),
            ],
          ),
        ),
        // SizedBox(height: 44),
        // Padding(
        //   padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
        //   child: StepProgressIndicator(
        //     totalSteps: 100,
        //     currentStep: 32,
        //     size: 8,
        //     padding: 0,
        //     selectedColor: Colors.yellow,
        //     unselectedColor: Colors.cyan,
        //     roundedEdges: Radius.circular(10),
        //     selectedGradientColor: LinearGradient(
        //       begin: Alignment.topLeft,
        //       end: Alignment.bottomRight,
        //       colors: [Colors.yellowAccent, Colors.deepOrange],
        //     ),
        //     unselectedGradientColor: LinearGradient(
        //       begin: Alignment.topLeft,
        //       end: Alignment.bottomRight,
        //       colors: [Colors.black, Colors.blue],
        //     ),
        //   ),
        // ),
        SizedBox(height: spacing_xl),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
          child: StepProgressIndicator(
            totalSteps: 20,
            currentStep: 6,
            size: 4,
            padding: 3,
            // roundedEdges: Radius.circular(3),
            selectedColor: primary_dark,
            unselectedColor: grey_2,
          ),
        ),
        // SizedBox(height: spacing_xl),
        // LinearPercentIndicator(
        //   padding: EdgeInsets.symmetric(horizontal: spacing_xl),
        //   width: Get.mediaQuery.size.width,
        //   lineHeight: 7.0,
        //   percent: 0.3,
        //   // center: Text(
        //   //   '50.0%',
        //   //   style: TextStyle(fontSize: 12.0),
        //   // ),
        //   // trailing: Icon(Icons.mood),
        //   linearStrokeCap: LinearStrokeCap.roundAll,
        //   backgroundColor: primary_light,
        //   progressColor: primary_dark,
        // ),
        // SizedBox(height: spacing_xl),
        // LinearPercentIndicator(
        //   padding: EdgeInsets.symmetric(horizontal: spacing_xl),
        //   width: Get.mediaQuery.size.width,
        //   animation: true,
        //   animationDuration: 1000,
        //   lineHeight: 10.0,
        //   leading: Text(''),
        //   trailing: Text(''),
        //   percent: 0.3,
        //   // center: Text('20.0%'),
        //   linearStrokeCap: LinearStrokeCap.butt,
        //   progressColor: primary_dark,
        //   backgroundColor: primary_light,
        // ),
        // Padding(
        //   padding: const EdgeInsets.only(
        //       top: 20, left: spacing_xxl, right: 35, bottom: 1),
        //   child: CustomPaint(
        //     painter: MyProgressLine(
        //       image: image,
        //       estDelivery: DateTime(2021, 08, 20),
        //       shipped: DateTime(2021, 08, 29),
        //     ),
        //     child: Container(
        //       width: double.infinity,
        //       height: 5.0,
        //     ),
        //   ),
        // ),
        // Padding(
        //   padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.end,
        //     children: [
        //       Text(
        //         '30',
        //         style: TextStyle(
        //           fontFamily: 'NotoSansKR',
        //           color: grey_1,
        //           fontSize: 12,
        //           fontWeight: FontWeight.w400,
        //           fontStyle: FontStyle.normal,
        //         ),
        //       )
        //     ],
        //   ),
        // ),
        SizedBox(height: 35),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
          child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: grey_3, borderRadius: BorderRadius.circular(4)),
              width: Get.mediaQuery.size.width,
              height: 39,
              child: RichText(
                  text: TextSpan(children: [
                TextSpan(
                    text: '6회',
                    style: TextStyle(
                      fontFamily: 'NotoSansKR',
                      color: primary,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    )),
                TextSpan(
                    text: ' 연속 사용 중입니다!',
                    style: TextStyle(
                      fontFamily: 'NotoSansKR',
                      color: black,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    )),
              ]))),
        ),
        SizedBox(height: spacing_xxl2),
        buildEvent('assets/images/care/point.png', '플리닉 포인트', 'ⓒ 5000P 적립',
            '5회 연속사용', '보��완료', true),
        buildEvent('assets/images/care/americano.png', '기프티콘', '스타벅스 아메리카노',
            '10회 연속사용', '보상받기', false),
        buildEvent('assets/images/care/olive-young.png', '기프티콘', '올리브영 1만원 권',
            '20회 연속사용', '보상받기', false),
        // SizedBox(height: 22),
        // Icon(LineIcons.angleDown, color: grey_2)
      ],
    );
  }

  Widget buildEvent(String imgPath, String title, String subtitle, String count,
      String desc, bool isPass) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            if (isPass) {
              passDialog(context);
            } else {
              Get.to(() => CareRewardPage(), transition: Transition.native);
              // 2021-10-26 모달 페이지 화로 변경
              // showModalBottomSheet(
              //   enableDrag: true,
              //   isDismissible: false,
              //   backgroundColor: Colors.transparent,
              //   // barrierColor: Colors.transparent,
              //   isScrollControlled: true,
              //   context: context,
              //   builder: (context) => buildSheet2(context),
              // );
            }
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
            child: Row(
              children: [
                Image.asset(imgPath, width: 72, height: 72),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontFamily: 'NotoSansKR',
                          color: primary,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                      Text(
                        subtitle,
                        style: TextStyle(
                          fontFamily: 'NotoSansKR',
                          color: black,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                        ),
                      )
                    ],
                  ),
                ),
                Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          count,
                          style: TextStyle(
                            fontFamily: 'NotoSansKR',
                            color: black,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                        isPass == true
                            ? Text(
                                desc,
                                style: TextStyle(
                                  fontFamily: 'NotoSansKR',
                                  color: grey_1,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                ),
                              )
                            : Text(
                                desc,
                                style: TextStyle(
                                  fontFamily: 'NotoSansKR',
                                  color: grey_1,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                  decoration: TextDecoration.underline,
                                ),
                              )
                      ],
                    ),
                    if (isPass)
                      Positioned(
                          right: 35,
                          child:
                              Image.asset('assets/images/care/pass-stamp.png')),
                  ],
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
          child: Divider(),
        ),
        SizedBox(height: spacing_xl)
      ],
    );
  }

  Future loadImage(String path) async {
    final data = await rootBundle.load(path);
    final bytes = data.buffer.asUint8List();
    final image = await decodeImageFromList(bytes);
    setState(() {
      this.image = image;
    });
    return image;
  }

  Widget makeDismissible({required Widget child}) => GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => Get.back(),
        child: GestureDetector(
          onTap: () {},
          child: child,
        ),
      );

  Widget buildSheet2(context) => makeDismissible(
          child: DraggableScrollableSheet(
        initialChildSize: 0.9,
        minChildSize: 0.5,
        maxChildSize: 0.9,
        builder: (_, controller) => Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(25),
            ),
          ),
          padding: EdgeInsets.only(top: spacing_xxl2),
          // padding: EdgeInsets.symmetric(horizontal: 0, vertical: spacing_xxl2),
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: SingleChildScrollView(
              child: Container(
                padding:
                    EdgeInsets.only(bottom: Get.mediaQuery.viewInsets.bottom),
                child: Column(
                  // controller: controller,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.symmetric(horizontal: spacing_xl),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '혜택 보상받기',
                            style: TextStyle(
                              fontFamily: 'NotoSansKR',
                              color: Color(0xff000000),
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              fontStyle: FontStyle.normal,
                            ),
                          ),
                          InkWell(
                              onTap: () {
                                Get.back();
                              },
                              child: Icon(LineIcons.times))
                        ],
                      ),
                    ),
                    SizedBox(height: spacing_m),
                    Divider(),
                    SizedBox(height: spacing_xl),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: spacing_xl),
                          child: Container(
                            width: Get.mediaQuery.size.width,
                            child: Text(
                              '플라즈마 기기 연속사용 보상을 받기 위해 배송지를 입력해 주세요.(배송지는 수정이 어려우니 잘못 ��력하신 경우 문의하기로 문의해 주세요.)',
                              style: TextStyle(
                                fontFamily: 'NotoSansKR',
                                color: grey_1,
                                fontSize: 12,
                                height: 1.63,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: spacing_xl),
                        Container(
                          width: Get.mediaQuery.size.width,
                          height: 48,
                          color: grey_3,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: spacing_xl),
                            child: Row(
                              children: [
                                Text('혜택',
                                    style: TextStyle(
                                      fontFamily: 'NotoSansKR',
                                      color: Color(0xff000000),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                      fontStyle: FontStyle.normal,
                                    ))
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: spacing_l),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: spacing_xl),
                          child: Row(
                            children: [
                              Image.asset('assets/images/care/image-45.png'),
                              SizedBox(width: spacing_m),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('플리닉 마스크팩 SET',
                                      style: TextStyle(
                                        fontFamily: 'NotoSansKR',
                                        color: Color(0xff000000),
                                        fontSize: 14,
                                        height: 1.64,
                                        fontWeight: FontWeight.w700,
                                        fontStyle: FontStyle.normal,
                                      )),
                                  SizedBox(height: spacing_xxs),
                                  Text('(연속사용 10회 달성 보상)',
                                      style: TextStyle(
                                        fontFamily: 'NotoSansKR',
                                        color: grey_1,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        fontStyle: FontStyle.normal,
                                      ))
                                ],
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: spacing_xxl2),
                        Container(
                          width: Get.mediaQuery.size.width,
                          height: 48,
                          color: grey_3,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: spacing_xl),
                            child: Row(
                              children: [
                                Text('배송지정보',
                                    style: TextStyle(
                                      fontFamily: 'NotoSansKR',
                                      color: Color(0xff000000),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                      fontStyle: FontStyle.normal,
                                    ))
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: spacing_xxl2),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: spacing_xl),
                          child: Row(
                            children: [
                              GroupButton(
                                isRadio: true,
                                spacing: 10,
                                borderRadius: BorderRadius.circular(4),
                                selectedColor: primary,
                                selectedTextStyle: TextStyle(
                                  fontFamily: 'NotoSansKR',
                                  color: white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                ),
                                unselectedTextStyle: TextStyle(
                                  fontFamily: 'NotoSansKR',
                                  color: grey_1,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                ),
                                unselectedBorderColor: grey_3,
                                selectedShadow: [],
                                unselectedShadow: [],
                                onSelected: (index, isSelected) =>
                                    print('$index button is selected'),
                                buttons: [
                                  '신규배송지',
                                  '우리집',
                                  '회사',
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: spacing_xxl2),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: spacing_xl),
                          alignment: Alignment.centerLeft,
                          child: Text('받는사람',
                              style: TextStyle(
                                fontFamily: 'NotoSansKR',
                                color: black,
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                fontStyle: FontStyle.normal,
                              )),
                        ),
                        SizedBox(height: spacing_s),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: spacing_xl),
                          child: Container(
                            // height: 48,
                            child: TextField(
                              controller: _controller1,
                              onChanged: (value) {
                                checkForm();
                                // _controller1.text = value;
                              },
                              // textAlignVertical: TextAlignVertical.center,
                              // keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(8),
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: grey_2, width: 0.5),
                                ),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.red, width: 1)),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: grey_1, width: 0.5),
                                ),
                                hintText: '받으실분',
                                hintStyle: TextStyle(
                                  fontFamily: 'NotoSansKR',
                                  color: black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: spacing_xl),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: spacing_xl),
                          child: Row(
                            children: [
                              Text('주소',
                                  style: TextStyle(
                                    fontFamily: 'NotoSansKR',
                                    color: black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                    fontStyle: FontStyle.normal,
                                  ))
                            ],
                          ),
                        ),
                        SizedBox(height: spacing_xs),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: spacing_xl),
                          child: Row(
                            children: [
                              Flexible(
                                flex: 2,
                                child: Container(
                                  child: TextField(
                                    controller: _controller2,
                                    onChanged: (value) {
                                      checkForm();
                                    },
                                    keyboardType: TextInputType.text,
                                    decoration: InputDecoration(
                                        contentPadding: EdgeInsets.all(8),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: grey_2, width: 0.5),
                                        ),
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.red, width: 1)),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: grey_1, width: 0.5),
                                        ),
                                        hintText: '주소를 입력하세요',
                                        hintStyle: TextStyle(
                                          fontFamily: 'NotoSansKR',
                                          color: grey_2,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          fontStyle: FontStyle.normal,
                                        ),
                                        filled: true,
                                        fillColor: grey_3,
                                        enabled: false),
                                  ),
                                ),
                              ),
                              SizedBox(width: spacing_xs),
                              Flexible(
                                  flex: 1,
                                  child: Container(
                                    child: findPostButton(),
                                  ))
                            ],
                          ),
                        ),
                        SizedBox(height: spacing_xxs),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: spacing_xl),
                          child: Row(
                            children: [
                              Flexible(
                                flex: 2,
                                child: Container(
                                  child: TextField(
                                    controller: _controller3,
                                    onChanged: (value) {
                                      checkForm();
                                    },
                                    // readOnly: true,
                                    keyboardType: TextInputType.text,
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.all(8),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: grey_2, width: 0.5),
                                      ),
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.red, width: 1)),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: grey_1, width: 0.5),
                                      ),
                                      hintText: '상세주소를 입력하세요',
                                      hintStyle: TextStyle(
                                        fontFamily: 'NotoSansKR',
                                        color: grey_2,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        fontStyle: FontStyle.normal,
                                      ),
                                      filled: true,
                                      fillColor: grey_3,
                                      // enabled: false,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: spacing_xl),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: spacing_xl),
                          child: Row(
                            children: [
                              Text('연락처',
                                  style: TextStyle(
                                    fontFamily: 'NotoSansKR',
                                    color: black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                    fontStyle: FontStyle.normal,
                                  ))
                            ],
                          ),
                        ),
                        SizedBox(height: spacing_s),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: spacing_xl),
                          child: TextField(
                            controller: _maskedTextController,
                            textAlignVertical: TextAlignVertical.center,
                            keyboardType: TextInputType.number,
                            onChanged: (value) {
                              checkForm();
                            },
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(8),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: grey_2, width: 0.5),
                              ),
                              border: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.red, width: 1)),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: grey_1, width: 0.5),
                              ),
                              hintText: '전화번호',
                              hintStyle: TextStyle(
                                fontFamily: 'NotoSansKR',
                                color: black,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: spacing_xl),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: spacing_xl),
                          child: Row(
                            children: [
                              Text('배송메시지',
                                  style: TextStyle(
                                    fontFamily: 'NotoSansKR',
                                    color: black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                    fontStyle: FontStyle.normal,
                                  ))
                            ],
                          ),
                        ),
                        SizedBox(height: spacing_s),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: spacing_xl),
                          child: TextField(
                            controller: _controller4,
                            textAlignVertical: TextAlignVertical.center,
                            // keyboardType: TextInputType.number,
                            onChanged: (value) {
                              checkForm();
                            },
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(8),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: grey_2, width: 0.5),
                              ),
                              border: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.red, width: 1)),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: grey_1, width: 0.5),
                              ),
                              hintText: '배송시 특이사항을 적어주세요',
                              hintStyle: TextStyle(
                                fontFamily: 'NotoSansKR',
                                color: black,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: spacing_xl),
                        ConstrainedBox(
                          constraints: BoxConstraints.tightFor(
                              width: Get.mediaQuery.size.width, height: 59),
                          child: ElevatedButton(
                            style: ButtonStyle(
                              side: MaterialStateProperty.all(
                                  BorderSide(color: grey_2)),
                              // shape: MaterialStateProperty.all(
                              //     RoundedRectangleBorder(borderRadius: BorderRadius.zero)),
                              elevation: MaterialStateProperty.all(0.0),
                              backgroundColor:
                                  MaterialStateProperty.resolveWith<Color>(
                                      (Set<MaterialState> states) {
                                if (states.contains(MaterialState.pressed)) {
                                  return Colors.grey.shade200;
                                }
                                return primary;
                              }),
                            ),
                            onPressed: () {
                              Get.back();
                            },
                            child: Text('보상받기',
                                style: TextStyle(
                                  fontFamily: 'NotoSansKR',
                                  fontSize: 16,
                                  color: white,
                                  fontWeight: FontWeight.w700,
                                  fontStyle: FontStyle.normal,
                                )),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ));
  Widget findPostButton() {
    return Container(
      height: 48,
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(primaryColor)),
        onPressed: () async {
          var value = await Get.to(() => AddressSearchPage());
          if (value != null) {
            Map<String, dynamic> value2 = json.decode(value);
            setState(() {
              _controller2.text = value2['address'];
              _controller3.text =
                  value2['buildingName'] != '' ? value2['buildingName'] : '';
              // _controller1.text = value.bname.toString();
              // _controller1.text = value.bname.toString();
            });
          }
        },
        child: Text(
          '우편번호찾기',
          style: TextStyle(
            fontFamily: 'NotoSansKR',
            color: white,
            fontSize: 13,
            fontWeight: FontWeight.w700,
            fontStyle: FontStyle.normal,
          ),
        ),
      ),
    );
  }

  void checkForm() {
    if (_controller1.text != '' &&
        _controller2.text != '' &&
        _controller3.text != '' &&
        _maskedTextController.text != '') {
      setState(() {
        isBtnCheck = true;
      });
    }
  }

  Widget buildSheet(context) => makeDismissible(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(25),
            ),
          ),
          padding: EdgeInsets.only(top: spacing_xxl2),
          // padding: EdgeInsets.symmetric(horizontal: 0, vertical: spacing_xxl2),
          child: Column(
            // controller: controller,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '혜택 보상받기',
                      style: TextStyle(
                        fontFamily: 'NotoSansKR',
                        color: Color(0xff000000),
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                    InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: Icon(LineIcons.times))
                  ],
                ),
              ),
              SizedBox(height: spacing_m),
              Divider(),
              SizedBox(height: spacing_xl),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
                    child: Container(
                      width: Get.mediaQuery.size.width,
                      child: Text(
                        '플라즈마 기기 연속사용 보상을 받기 위해 배송지를 입력해 주세요.(배송지는 수정이 어려우니 잘못 입력하신 경우 문의하기로 문의해 주세요.)',
                        style: TextStyle(
                          fontFamily: 'NotoSansKR',
                          color: grey_1,
                          fontSize: 12,
                          height: 1.63,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: spacing_xl),
                  Container(
                    width: Get.mediaQuery.size.width,
                    height: 48,
                    color: grey_3,
                    child: Padding(
                      padding:
                          const EdgeInsets.symmetric(horizontal: spacing_xl),
                      child: Row(
                        children: [
                          Text('혜택',
                              style: TextStyle(
                                fontFamily: 'NotoSansKR',
                                color: Color(0xff000000),
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                fontStyle: FontStyle.normal,
                              ))
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: spacing_l),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
                    child: Row(
                      children: [
                        Image.asset('assets/images/care/image-45.png'),
                        SizedBox(width: spacing_m),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('플리닉 마스크팩 SET',
                                style: TextStyle(
                                  fontFamily: 'NotoSansKR',
                                  color: Color(0xff000000),
                                  fontSize: 14,
                                  height: 1.64,
                                  fontWeight: FontWeight.w700,
                                  fontStyle: FontStyle.normal,
                                )),
                            SizedBox(height: spacing_xxs),
                            Text('(연속사용 10회 달성 보상)',
                                style: TextStyle(
                                  fontFamily: 'NotoSansKR',
                                  color: grey_1,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                ))
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: spacing_xxl2),
                  Container(
                    width: Get.mediaQuery.size.width,
                    height: 48,
                    color: grey_3,
                    child: Padding(
                      padding:
                          const EdgeInsets.symmetric(horizontal: spacing_xl),
                      child: Row(
                        children: [
                          Text('배송지정보',
                              style: TextStyle(
                                fontFamily: 'NotoSansKR',
                                color: Color(0xff000000),
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                fontStyle: FontStyle.normal,
                              ))
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: spacing_xxl2),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
                    child: Row(
                      children: [
                        GroupButton(
                          isRadio: true,
                          spacing: 10,
                          borderRadius: BorderRadius.circular(4),
                          selectedColor: primary,
                          selectedTextStyle: TextStyle(
                            fontFamily: 'NotoSansKR',
                            color: white,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                          ),
                          unselectedTextStyle: TextStyle(
                            fontFamily: 'NotoSansKR',
                            color: grey_1,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                          ),
                          unselectedBorderColor: grey_3,
                          selectedShadow: [],
                          unselectedShadow: [],
                          onSelected: (index, isSelected) =>
                              print('$index button is selected'),
                          buttons: [
                            '신규배송지',
                            '우리집',
                            '회사',
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: spacing_xxl2),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: spacing_xl),
                    alignment: Alignment.centerLeft,
                    child: Text('받는사람',
                        style: TextStyle(
                          fontFamily: 'NotoSansKR',
                          color: black,
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                        )),
                  ),
                  ConstrainedBox(
                    constraints: BoxConstraints.tightFor(
                        width: Get.mediaQuery.size.width, height: 59),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        side: MaterialStateProperty.all(
                            BorderSide(color: grey_2)),
                        // shape: MaterialStateProperty.all(
                        //     RoundedRectangleBorder(borderRadius: BorderRadius.zero)),
                        elevation: MaterialStateProperty.all(0.0),
                        backgroundColor:
                            MaterialStateProperty.resolveWith<Color>(
                                (Set<MaterialState> states) {
                          if (states.contains(MaterialState.pressed)) {
                            return Colors.grey.shade200;
                          }
                          return grey_2;
                        }),
                      ),
                      onPressed: () {
                        Get.back();
                      },
                      child: Text('보상받기',
                          style: TextStyle(
                            fontFamily: 'NotoSansKR',
                            fontSize: 16,
                            color: white,
                            fontWeight: FontWeight.w700,
                            fontStyle: FontStyle.normal,
                          )),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      );

  void passDialog(context) async {
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
          content: '20회 보상 전 플리닉 서비스에 대한\n설문조사를 완료해주세요.',
          button1Click: () {
            Get.back();
            Get.to(() => CareCompMujin1Page(), transition: Transition.native);
          },
          button2Click: () {
            Get.back();
          },
        );
      },
    );
  }
}

class MyProgressLine extends CustomPainter {
  MyProgressLine({this.image, this.shipped, this.estDelivery});

  final ui.Image? image;
  final DateTime? shipped;
  final DateTime? estDelivery;

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = primary_dark
      ..strokeWidth = 5.0
      ..style = PaintingStyle.fill;

    var endPointsRadius = 5.0;
    var width = size.width;

    var totalDays = ((estDelivery!.millisecondsSinceEpoch -
                shipped!.millisecondsSinceEpoch) /
            86400000)
        .floor();
    var currentDay = ((DateTime.now().millisecondsSinceEpoch -
                shipped!.millisecondsSinceEpoch) /
            86400000)
        .floor();
    var stepPerDay = width / totalDays;

    // Draws starting point
    canvas.drawCircle(Offset.zero, endPointsRadius, paint);
    canvas.drawLine(Offset(endPointsRadius, 0.0),
        Offset(endPointsRadius + stepPerDay * currentDay, 0.0), paint);

    // Draws current progress line
    paint.style = PaintingStyle.fill;
    canvas.drawCircle(
        Offset(endPointsRadius + stepPerDay * currentDay, 0.0), 5.0, paint);
    canvas.drawImage(
        image!, Offset(-5.0 + stepPerDay * currentDay, -20.0), paint);

    // Draws endpoint
    paint.style = PaintingStyle.fill;
    paint.color = primary_light;
    canvas.drawLine(
        Offset(endPointsRadius + stepPerDay * currentDay * 1.038, 0.0),
        Offset(stepPerDay * totalDays, 0.0),
        paint);
    canvas.drawCircle(Offset((stepPerDay * totalDays) + endPointsRadius, 0.0),
        endPointsRadius, paint);

    final textPainter = TextPainter(
      text: TextSpan(
        text: '연속 9회 사용',
        style: TextStyle(
          color: grey_1,
          fontSize: 12,
          fontFamily: 'NotoSansKR',
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
        ),
      ),
      textDirection: TextDirection.ltr,
    );
    textPainter.layout(
      minWidth: 0,
      maxWidth: size.width,
    );
    final xCenter = (size.width - textPainter.width) / 2;
    final yCenter = (size.height - textPainter.height) / 2;
    final offset = Offset(xCenter, yCenter);
    textPainter.paint(canvas, Offset(-25.0 + stepPerDay * currentDay, -40.0));
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
