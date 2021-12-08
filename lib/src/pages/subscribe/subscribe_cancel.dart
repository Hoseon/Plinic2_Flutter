import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plinic2/constants.dart';
import 'package:plinic2/src/component/custom_appbar.dart';

class SubScribeCancelPage extends StatelessWidget {
  const SubScribeCancelPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar('해지하기'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: spacing_xxl),
            Container(
              padding: EdgeInsets.symmetric(horizontal: spacing_xl),
              alignment: Alignment.centerLeft,
              child: Text('케어 솔루션 패키지를\n해지 하시겠어요?',
                  style: TextStyle(
                    fontFamily: 'NotoSansKR',
                    color: black,
                    fontSize: 18,
                    height: 1.61,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal,
                  )),
            ),
            SizedBox(height: spacing_m),
            Container(
              padding: EdgeInsets.symmetric(horizontal: spacing_xl),
              alignment: Alignment.centerLeft,
              child: Text('해지하시면 아래 서비스들이 모두 종료됩니다??',
                  style: TextStyle(
                    fontFamily: 'NotoSansKR',
                    color: grey_1,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                  )),
            ),
            SizedBox(height: 44),
            Container(
              padding: EdgeInsets.symmetric(horizontal: spacing_xl),
              alignment: Alignment.centerLeft,
              child: Text('지금 해지하면 아쉬운 혜택!',
                  style: TextStyle(
                    fontFamily: 'NotoSansKR',
                    color: black,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
              child: Divider(),
            ),
            SizedBox(height: spacing_xs),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
              child: Row(
                children: [
                  Container(
                    width: Get.mediaQuery.size.width * 0.139,
                    height: Get.mediaQuery.size.width * 0.139,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xffc4c4c4),
                    ),
                  ),
                  SizedBox(width: spacing_l),
                  Text('해지하시면 아래 서비스들이 모두 종료',
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
            SizedBox(height: spacing_m),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
              child: Row(
                children: [
                  Container(
                    width: Get.mediaQuery.size.width * 0.139,
                    height: Get.mediaQuery.size.width * 0.139,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xffc4c4c4),
                    ),
                  ),
                  SizedBox(width: spacing_l),
                  Text('해지하시면 아래 서비스들이 모두 종료',
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
            SizedBox(height: spacing_m),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
              child: Row(
                children: [
                  Container(
                    width: Get.mediaQuery.size.width * 0.139,
                    height: Get.mediaQuery.size.width * 0.139,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xffc4c4c4),
                    ),
                  ),
                  SizedBox(width: spacing_l),
                  Text('해지하시면 아래 서비스들이 모두 종료',
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
            SizedBox(height: spacing_l),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    style: ButtonStyle(
                        elevation: MaterialStateProperty.all(0.0),
                        backgroundColor: MaterialStateProperty.all(grey_2),
                        minimumSize: MaterialStateProperty.all(
                            Size(Get.mediaQuery.size.width * 0.427, 42))),
                    onPressed: () {
                      print('해지하기 클릭됨');
                      Get.back();
                    },
                    child: Text('구독 해지 예약',
                        style: TextStyle(
                          fontFamily: 'NotoSansKR',
                          color: black,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                        )),
                  ),
                  ElevatedButton(
                      style: ButtonStyle(
                          elevation: MaterialStateProperty.all(0.0),
                          backgroundColor: MaterialStateProperty.all(primary),
                          minimumSize: MaterialStateProperty.all(
                              Size(Get.mediaQuery.size.width * 0.427, 42))),
                      onPressed: () {
                        print('구독 유지하기 클릭됨');
                        Get.back();
                      },
                      child: Text('구독 유지하기',
                          style: TextStyle(
                            fontFamily: 'NotoSansKR',
                            color: white,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                          ))),
                ],
              ),
            ),
            SizedBox(height: 57),
            Container(
              padding: EdgeInsets.symmetric(horizontal: spacing_xl),
              alignment: Alignment.centerLeft,
              child: Text('안내',
                  style: TextStyle(
                    fontFamily: 'NotoSansKR',
                    color: black,
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal,
                  )),
            ),
            SizedBox(height: spacing_xs),
            Text(
                '- 정기결제에 포함된 혜택은 해당 구독 상품을 유지 시에만 받을 수\n   있습니다.  \n- 정기결제 해지예약은 정기결제 이용권을 사용 중이 경우 할 수 \n   있습니다. 정기결제 해지는 해지예약 후 고객센터 또는 \n   카카오채널로 안내후 진행됩니다.\n- 약정기간에 따른 구독 서비스 해제 시 약정위약금이 \r\n   상이 할 수 있습니다.\r\n- 이미 결제된 결제일의 경우 환불이 불가능하며, 남은기간 동안\r\n    구독 자격이 유지됩니다.',
                style: TextStyle(
                  fontFamily: 'NotoSansKR',
                  color: grey_1,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                ))
          ],
        ),
      ),
    );
  }
}
