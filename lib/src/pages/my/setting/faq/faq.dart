import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plinic2/constants.dart';
import 'package:plinic2/src/component/custom_appbar.dart';
import 'package:plinic2/src/controller/faq_controller.dart';

class FaqPage extends GetView<FaqController> {
  const FaqPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put<FaqController>(FaqController());
    return Scaffold(
      appBar: CustomAppbar('FAQ'),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          header(),
          SizedBox(height: spacing_xxl2),
          Obx(() {
            if (controller.tabIndex.value == 1) {
              return switchBody(1);
            } else if (controller.tabIndex.value == 2) {
              return switchBody(2);
            } else if (controller.tabIndex.value == 3) {
              return switchBody(3);
            } else if (controller.tabIndex.value == 4) {
              return switchBody(4);
            }
            return switchBody(1);
          })
        ],
      ),
    );
  }

  Widget switchBody(index) {
    switch (index) {
      case 1:
        return _faq1();
      case 2:
        return _faq2();
      case 3:
        return _faq3();
      case 4:
        return _faq4();
      default:
        return _faq1();
    }
  }

  Widget _faq1() {
    return Column(
      children: [
        FAQTiles(
            title: '구매하면 혜택이 어떻게 되나요?',
            content:
                'Plinic 서비스를 구독하시면 회원님의 피부 타입에 \n맞는 구독박스를 매월 발송해 드립니다.\n발송된 구독박스를 통해 회원님의 피부를 관리해보세요.'),
        FAQTiles(
            title: 'Plinic은 어떤 서비스인가요?',
            content:
                'Plinic 서비스를 구독하시면 회원님의 피부 타입에 \n맞는 구독박스를 매월 발송해 드립니다.\n발송된 구독박스를 통해 회원님의 피부를 관리해보세요.'),
        FAQTiles(
            title: '친구초대는 어떻게 하나요?',
            content:
                'Plinic 서비스를 구독하시면 회원님의 피부 타입에 \n맞는 구독박스를 매월 발송해 드립니다.\n발송된 구독박스를 통해 회원님의 피부를 관리해보세요.'),
      ],
    );
  }

  Widget _faq2() {
    return Column(
      children: [
        FAQTiles(
            title: '회원만의 혜택이 있나요?',
            content:
                'Plinic 서비스를 구독하시면 회원님의 피부 타입에 \n맞는 구독박스를 매월 발송해 드립니다.\n발송된 구독박스를 통해 회원님의 피부를 관리해보세요.'),
        FAQTiles(
            title: '회원 포인트가 궁금해요',
            content:
                'Plinic 서비스를 구독하시면 회원님의 피부 타입에 \n맞는 구독박스를 매월 발송해 드립니다.\n발송된 구독박스를 통해 회원님의 피부를 관리해보세요.'),
        FAQTiles(
            title: '회원탈퇴는 어떻게 하나요?',
            content:
                'Plinic 서비스를 구독하시면 회원님의 피부 타입에 \n맞는 구독박스를 매월 발송해 드립니다.\n발송된 구독박스를 통해 회원님의 피부를 관리해보세요.'),
      ],
    );
  }

  Widget _faq3() {
    return Column(
      children: [
        FAQTiles(title: '매달 카드 결제는 몇일에 진행 되나요?', content: '준비중'),
        FAQTiles(title: '구독서비스 변경이 가능한가요?', content: '준비중'),
        FAQTiles(title: '구독 해지는 어떻게 하나요?', content: '준비중'),
      ],
    );
  }

  Widget _faq4() {
    return Column(
      children: [
        FAQTiles(title: '상품은 포인트로도 결제가 가능한가요?', content: '준비중'),
        FAQTiles(title: '상품의 교환절차는 어떻게되나요?', content: '준비중'),
        FAQTiles(title: '상품이 마음에 안든다면?', content: '준비중'),
      ],
    );
  }

  Column header() {
    return Column(
      children: [
        SizedBox(height: spacing_m),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Obx(
              () => controller.tabIndex.value == 1 ? _select1() : _unselect1(),
            ),
            Obx(() =>
                controller.tabIndex.value == 2 ? _select2() : _unselect2()),
            Obx(() =>
                controller.tabIndex.value == 3 ? _select3() : _unselect3()),
            Obx(() =>
                controller.tabIndex.value == 4 ? _select4() : _unselect4()),
          ],
        )
      ],
    );
  }

  InkWell _select4() {
    return InkWell(
      onTap: () {
        controller.updateTabIndex(4);
      },
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Text(
              '기타',
              style: TextStyle(
                fontFamily: 'NotoSansKR',
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
              ),
            ),
          ),
          SizedBox(height: spacing_xxs),
          Container(width: 50, height: 1, color: Colors.black)
        ],
      ),
    );
  }

  InkWell _unselect4() {
    return InkWell(
      onTap: () {
        controller.updateTabIndex(4);
      },
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Text(
              '기타',
              style: TextStyle(
                fontFamily: 'NotoSansKR',
                color: grey_1,
                fontSize: 14,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
              ),
            ),
          ),
          SizedBox(height: spacing_xxs),
          Container(width: 50, height: 1, color: Colors.transparent)
        ],
      ),
    );
  }

  InkWell _select3() {
    return InkWell(
      onTap: () {
        controller.updateTabIndex(3);
      },
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Text(
              '케어',
              style: TextStyle(
                fontFamily: 'NotoSansKR',
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
              ),
            ),
          ),
          SizedBox(height: spacing_xxs),
          Container(width: 80, height: 1, color: Colors.black)
        ],
      ),
    );
  }

  InkWell _unselect3() {
    return InkWell(
      onTap: () {
        controller.updateTabIndex(3);
      },
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Text(
              '케어',
              style: TextStyle(
                fontFamily: 'NotoSansKR',
                color: grey_1,
                fontSize: 14,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
              ),
            ),
          ),
          SizedBox(height: spacing_xxs),
          Container(width: 80, height: 1, color: Colors.transparent)
        ],
      ),
    );
  }

  InkWell _select2() {
    return InkWell(
      onTap: () {
        controller.updateTabIndex(2);
      },
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Text(
              '회원',
              style: TextStyle(
                fontFamily: 'NotoSansKR',
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
              ),
            ),
          ),
          SizedBox(height: spacing_xxs),
          Container(width: 50, height: 1, color: Colors.black)
        ],
      ),
    );
  }

  InkWell _unselect2() {
    return InkWell(
      onTap: () {
        controller.updateTabIndex(2);
      },
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Text(
              '회원',
              style: TextStyle(
                fontFamily: 'NotoSansKR',
                color: grey_1,
                fontSize: 14,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
              ),
            ),
          ),
          SizedBox(height: spacing_xxs),
          Container(width: 50, height: 1, color: Colors.transparent)
        ],
      ),
    );
  }

  InkWell _select1() {
    return InkWell(
      onTap: () {
        controller.updateTabIndex(1);
      },
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Text(
              '전체',
              style: TextStyle(
                fontFamily: 'NotoSansKR',
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
              ),
            ),
          ),
          SizedBox(height: spacing_xxs),
          Container(width: 50, height: 1, color: Colors.black)
        ],
      ),
    );
  }

  InkWell _unselect1() {
    return InkWell(
      onTap: () {
        controller.updateTabIndex(1);
      },
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Text(
              '전체',
              style: TextStyle(
                fontFamily: 'NotoSansKR',
                color: grey_1,
                fontSize: 14,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
              ),
            ),
          ),
          SizedBox(height: spacing_xxs),
          Container(width: 50, height: 1, color: Colors.transparent)
        ],
      ),
    );
  }
}

class FAQTiles extends StatelessWidget {
  const FAQTiles({
    Key? key,
    required this.title,
    required this.content,
  }) : super(key: key);

  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Theme(
          data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
          child: ExpansionTile(
            backgroundColor: Colors.white,
            iconColor: grey_1,
            title: Padding(
              padding: const EdgeInsets.symmetric(horizontal: spacing_m),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontFamily: 'NotoSansKR',
                      color: Color(0xff000000),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    ),
                  )
                ],
              ),
            ),
            children: [
              Text(
                content,
                style: TextStyle(
                  fontFamily: 'NotoSansKR',
                  color: Color(0xff000000),
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                ),
              ),
              SizedBox(height: spacing_xl),
            ],
          ),
        ),
        Divider(
          height: 0.1,
        )
      ],
    );
  }
}
