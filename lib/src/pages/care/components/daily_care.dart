import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:plinic2/constants.dart';

class DailyCarePage extends StatelessWidget {
  const DailyCarePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 44),
        Container(
          color: grey_3,
          width: Get.mediaQuery.size.width,
          height: 316,
          child: Column(
            children: [
              SizedBox(height: 44),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
                child: Row(
                  children: [
                    Text(
                      '데일리 케어 실천 ',
                      style: TextStyle(
                        fontFamily: 'NotoSansKR',
                        color: black,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.normal,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: spacing_s),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '7월 28일 자가 습관 실천 내역입니다.',
                      style: TextStyle(
                        fontFamily: 'NotoSansKR',
                        color: grey_1,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                    RichText(
                        text: TextSpan(children: [
                      TextSpan(
                          text: '2',
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            color: black,
                            fontSize: 32,
                            fontWeight: FontWeight.w700,
                            fontStyle: FontStyle.normal,
                          )),
                      TextSpan(
                          text: ' ',
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            color: Color(0xff000000),
                            fontSize: 32,
                            fontWeight: FontWeight.w700,
                            fontStyle: FontStyle.normal,
                          )),
                      TextSpan(
                          text: '/ 5',
                          style: TextStyle(
                            fontFamily: 'NotoSansKR',
                            color: black,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                          )),
                    ]))
                  ],
                ),
              ),
              SizedBox(height: spacing_xl),
              Container(
                width: Get.mediaQuery.size.width,
                height: 148,
                decoration: BoxDecoration(),
                child: Padding(
                  padding: const EdgeInsets.only(left: spacing_xl),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (_, index) {
                      return Padding(
                        padding:
                            const EdgeInsets.only(right: spacing_xs, bottom: 2),
                        child: Container(
                            width: 160,
                            height: 158,
                            decoration: BoxDecoration(
                              color: white,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: grey_2),
                              boxShadow: [
                                BoxShadow(
                                    color: grey_2,
                                    offset: Offset(0, 4),
                                    blurRadius: 5,
                                    spreadRadius: 0)
                              ],
                            ),
                            child: Column(
                              children: [
                                SizedBox(height: spacing_xl),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: spacing_m),
                                  child: Row(
                                    children: [
                                      Text(
                                        '물 2L 이상마시기',
                                        style: TextStyle(
                                          fontFamily: 'NotoSansKR',
                                          color: black,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          fontStyle: FontStyle.normal,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: spacing_m),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: spacing_m),
                                  child: Row(
                                    children: [
                                      Text('랜덤 적립',
                                          style: TextStyle(
                                            fontFamily: 'NotoSansKR',
                                            color: black,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w700,
                                            fontStyle: FontStyle.normal,
                                          )),
                                    ],
                                  ),
                                ),
                                SizedBox(height: spacing_m),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: spacing_m),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Container(
                                        alignment: Alignment.centerRight,
                                        width: 72,
                                        height: 28,
                                        child: ElevatedButton(
                                          style: ButtonStyle(
                                              backgroundColor: index.toInt() ==
                                                      0
                                                  ? MaterialStateProperty.all(
                                                      primary)
                                                  : MaterialStateProperty.all(
                                                      grey_2)),
                                          onPressed: () {
                                            showModalBottomSheet(
                                              enableDrag: true,
                                              isDismissible: false,
                                              backgroundColor:
                                                  Colors.transparent,
                                              // barrierColor: Colors.transparent,
                                              isScrollControlled: true,
                                              context: context,
                                              builder: (context) =>
                                                  buildSheet(context),
                                            );
                                          },
                                          child: index.toInt() == 0
                                              ? Text('실천완료',
                                                  style: TextStyle(
                                                    fontFamily: 'NotoSansKR',
                                                    color: white,
                                                    fontSize: 10,
                                                    fontWeight: FontWeight.w400,
                                                    fontStyle: FontStyle.normal,
                                                  ))
                                              : Text('실천대기',
                                                  style: TextStyle(
                                                    fontFamily: 'NotoSansKR',
                                                    color: white,
                                                    fontSize: 10,
                                                    fontWeight: FontWeight.w400,
                                                    fontStyle: FontStyle.normal,
                                                  )),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            )),
                      );
                    },
                    itemCount: 3,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget makeDismissible({required Widget child}) => GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => Get.back(),
        child: GestureDetector(
          onTap: () {},
          child: child,
        ),
      );

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
                      '자가습관 실천여부',
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
              SizedBox(height: 40),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
                    child: Row(
                      children: [
                        Image.asset('assets/images/care/okay.png'),
                        SizedBox(width: 30),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RichText(
                                text: TextSpan(children: [
                              TextSpan(
                                  text: '아래 자가습관을',
                                  style: TextStyle(
                                    fontFamily: 'NotoSansKR',
                                    color: black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                    fontStyle: FontStyle.normal,
                                  )),
                              TextSpan(
                                  text: ' \n실천하셨나요?',
                                  style: TextStyle(
                                    fontFamily: 'NotoSansKR',
                                    color: black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400,
                                    fontStyle: FontStyle.normal,
                                  )),
                            ])),
                            Container(
                              width: Get.mediaQuery.size.width * 0.5,
                              child: Text(
                                '실천정보와 다른 습관이 있다면 [실천완료 또는 실천중]버튼을 눌러주세요.',
                                style: TextStyle(
                                  fontFamily: 'NotoSansKR',
                                  color: grey_1,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.visible,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: spacing_xl),
                  Container(
                    width: Get.mediaQuery.size.width,
                    height: 148,
                    decoration: BoxDecoration(
                        // boxShadow: [
                        //   BoxShadow(
                        //       color: Color(0x0c000000),
                        //       offset: Offset(0, 4),
                        //       blurRadius: 4,
                        //       spreadRadius: 0)
                        // ],
                        ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: spacing_xl),
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (_, index) {
                          return Padding(
                            padding: const EdgeInsets.only(right: spacing_xs),
                            child: Container(
                                width: 160,
                                height: 158,
                                decoration: BoxDecoration(
                                  color: white,
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(color: grey_2),
                                ),
                                child: Column(
                                  children: [
                                    SizedBox(height: spacing_xl),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: spacing_m),
                                      child: Row(
                                        children: [
                                          Text(
                                            '물 2L 이상마시기',
                                            style: TextStyle(
                                              fontFamily: 'NotoSansKR',
                                              color: black,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400,
                                              fontStyle: FontStyle.normal,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: spacing_m),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: spacing_m),
                                      child: Row(
                                        children: [
                                          Text('랜덤 적립',
                                              style: TextStyle(
                                                fontFamily: 'NotoSansKR',
                                                color: black,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w700,
                                                fontStyle: FontStyle.normal,
                                              )),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: spacing_m),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: spacing_m),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Container(
                                            alignment: Alignment.centerRight,
                                            width: 72,
                                            height: 28,
                                            child: ElevatedButton(
                                              style: ButtonStyle(
                                                  backgroundColor:
                                                      MaterialStateProperty.all(
                                                          primary)),
                                              onPressed: () {},
                                              child: Text('실천완료',
                                                  style: TextStyle(
                                                    fontFamily: 'NotoSansKR',
                                                    color: white,
                                                    fontSize: 10,
                                                    fontWeight: FontWeight.w400,
                                                    fontStyle: FontStyle.normal,
                                                  )),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                )),
                          );
                        },
                        itemCount: 3,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
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
                      child: Text('네, 완료했어요!',
                          style: TextStyle(
                            fontFamily: 'NotoSansKR',
                            fontSize: 14,
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
}
