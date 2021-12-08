import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:plinic2/constants.dart';
import 'package:plinic2/src/component/appbar_title.dart';

class BadgePage extends StatelessWidget {
  const BadgePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Get.back();
          },
        ),
        backgroundColor: Colors.white,
        elevation: 0.3,
        title: AppbarTitle(title: 'MY뱃지'),
      ),
      backgroundColor: Colors.white,
      body: body(),
    );
  }

  Widget body() {
    return Container(
      child: Column(
        children: [
          SizedBox(height: spacing_xxl2),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
            child: Container(
              color: Colors.transparent,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: '15',
                              style: TextStyle(
                                fontFamily: 'Roboto',
                                color: black,
                                fontSize: 40,
                                fontWeight: FontWeight.w700,
                                fontStyle: FontStyle.normal,
                              ),
                            ),
                            TextSpan(
                              text: '개',
                              style: TextStyle(
                                fontFamily: 'NotoSansKR',
                                color: black,
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        '(보유뱃지)',
                        style: TextStyle(
                          fontFamily: 'NotoSansKR',
                          color: grey_1,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                        ),
                      )
                    ],
                  ),
                  SizedBox(width: spacing_xl),
                  Column(
                    children: [
                      Text(
                        '아직 받을 수 있는 뱃지가 많이 남았어요.\n서비스를 꾸준히 이용하시고 다양한 \n뱃지를 수집해보세요!',
                        style: TextStyle(
                          fontFamily: 'NotoSansKR',
                          color: black,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: 36),
          Divider(
            thickness: 14,
            color: grey_3,
          ),
          SizedBox(height: spacing_xxl),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
            child: Container(
              color: Colors.transparent,
              child: Row(
                children: [
                  Text(
                    '총 뱃지',
                    style: TextStyle(
                      fontFamily: 'NotoSansKR',
                      color: Color(0xff000000),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                  SizedBox(width: spacing_xxs),
                  Text(
                    '78',
                    style: TextStyle(
                      fontFamily: 'NotoSansKR',
                      color: Color(0xff000000),
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal,
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: spacing_xxl),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Container(
              color: Colors.transparent,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BadgeIcon(
                          imgUrl: 'assets/images/first-1.svg', title: '첫 사용'),
                      BadgeIcon(
                          imgUrl: 'assets/images/notification-1.svg',
                          title: '첫 댓글 등록'),
                      BadgeIcon(
                          imgUrl: 'assets/images/contract-1.svg',
                          title: '구독 6회'),
                    ],
                  ),
                  SizedBox(height: spacing_xxl2),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BadgeIcon(
                          imgUrl: 'assets/images/pay-1.svg', title: '첫 상품 구매'),
                      BadgeIcon(
                          imgUrl: 'assets/images/misson.svg', title: '이달의 목표'),
                      BadgeIcon(
                          imgUrl: 'assets/images/timer-1.svg', title: '연속사용'),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class BadgeIcon extends StatelessWidget {
  final String imgUrl;
  final String title;
  const BadgeIcon({Key? key, required this.imgUrl, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset(imgUrl),
        SizedBox(height: spacing_s),
        Text(title),
      ],
    );
  }
}
