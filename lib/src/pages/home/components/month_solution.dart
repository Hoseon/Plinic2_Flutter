import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:plinic2/constants.dart';
import 'package:plinic2/src/pages/home/pay_step0.dart';

class MonthSolutionPage extends StatelessWidget {
  const MonthSolutionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 36),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
          alignment: Alignment.centerLeft,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '이달의 맞춤 솔루션',
                style: TextStyle(
                  color: Color(0xff1d1d1d),
                  fontSize: 16,
                  fontFamily: 'NotoSansKR',
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.normal,
                ),
              ),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                    if (states.contains(MaterialState.pressed)) {
                      return Colors.grey.shade400;
                    }
                    return grey_3;
                  }),
                  elevation: MaterialStateProperty.all(0.0),
                  minimumSize: MaterialStateProperty.all(
                    Size(58, 20),
                  ),
                ),
                onPressed: () {},
                child: Text(
                  '구독중',
                  style: TextStyle(
                    fontFamily: 'NotoSans',
                    color: black,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: spacing_xl),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
          child: Row(
            children: [
              Image.asset('assets/images/home/solution-box.png',
                  width: 88, height: 80),
              SizedBox(width: spacing_s),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '플리닉 맞춤 솔루션 케어권',
                    style: TextStyle(
                      color: Color(0xff1d1d1d),
                      fontSize: 14,
                      fontFamily: 'NotoSansKR',
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      height: 1.64,
                    ),
                  ),
                  Text(
                    '미백 앰플 + 플리닉 마스크팩',
                    style: TextStyle(
                      color: Color(0xff828282),
                      fontSize: 12,
                      fontFamily: 'NotoSansKR',
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      height: 1.64,
                    ),
                  ),
                  Text(
                    '1개월  : 29,800원 ',
                    style: TextStyle(
                      color: Color(0xff1d1d1d),
                      fontSize: 14,
                      fontFamily: 'NotoSansKR',
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      height: 1.64,
                    ),
                  ),
                  SizedBox(height: 2),
                  Row(
                    children: [
                      ElevatedButton(
                        style: ButtonStyle(
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            elevation: MaterialStateProperty.all(0.0),
                            backgroundColor: MaterialStateProperty.all(
                              state_colors_red.withOpacity(0.6),
                            ),
                            minimumSize:
                                MaterialStateProperty.all(Size(47, 20))),
                        onPressed: () {},
                        child: Text(
                          '보습',
                          style: TextStyle(
                            fontFamily: 'NotoSans',
                            color: white,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                      ),
                      SizedBox(width: spacing_xxs),
                      ElevatedButton(
                        style: ButtonStyle(
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            elevation: MaterialStateProperty.all(0.0),
                            backgroundColor: MaterialStateProperty.all(
                              state_colors_blue.withOpacity(0.6),
                            ),
                            minimumSize:
                                MaterialStateProperty.all(Size(47, 20))),
                        onPressed: () {},
                        child: Text(
                          '진정',
                          style: TextStyle(
                            fontFamily: 'NotoSans',
                            color: white,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
        SizedBox(height: spacing_xl),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
          child: InkWell(
            onTap: () {
              Get.to(PayStep0Page(), transition: Transition.native);
            },
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: spacing_xs,
                vertical: spacing_xs,
              ),
              width: Get.mediaQuery.size.width,
              height: 40,
              decoration: BoxDecoration(
                border: Border.all(color: grey_2),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Row(
                children: [
                  Text(
                    '이번 달 피부 습관을 만들어 줄 구독박스예요.',
                    style: TextStyle(
                      color: Color(0xff828282),
                      fontSize: 14,
                      fontFamily: 'NotoSansKR',
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                  Expanded(child: SizedBox(width: 1)),
                  Icon(LineIcons.angleRight, size: 17, color: grey_1),
                ],
              ),
            ),
          ),
        ),
        SizedBox(height: spacing_xxl),
        Divider(thickness: 8, color: grey_3, height: 0),
      ],
    );
  }
}
