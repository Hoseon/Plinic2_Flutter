import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:plinic2/constants.dart';
import 'package:plinic2/src/component/custom_appbar.dart';
import 'package:plinic2/src/controller/home_skin_type_controller.dart';

class HomeSkinType extends GetView<HomeSkinTypeController> {
  int? currentTab = 0;
  HomeSkinType({
    Key? key,
    this.currentTab,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put<HomeSkinTypeController>(HomeSkinTypeController());
    controller.changeTab(currentTab!);
    return Scaffold(
      appBar: CustomAppbar('피부타입 정보'),
      backgroundColor: white,
      body: Obx(
        () => (SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: spacing_xxl),
              Container(
                padding: EdgeInsets.symmetric(horizontal: spacing_xl),
                alignment: Alignment.centerLeft,
                child: RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      text: 'OSPT ',
                      style: TextStyle(
                        fontFamily: 'NotoSansKR',
                        color: black,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.normal,
                      )),
                  TextSpan(
                      text: '피부타입',
                      style: TextStyle(
                        fontFamily: 'NotoSansKR',
                        color: black,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      )),
                ])),
              ),
              SizedBox(height: spacing_s),
              Container(
                padding: EdgeInsets.symmetric(horizontal: spacing_xl),
                alignment: Alignment.centerLeft,
                child: Text('피부타입 추천 상품과 게시글을 확인해보세요.',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      color: textfields,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    )),
              ),
              SizedBox(height: spacing_l),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: Get.mediaQuery.size.width * 0.416,
                      height: 36,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: primary_dark,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(width: spacing_l),
                          Text('맞춤 게시글 보기',
                              style: TextStyle(
                                fontFamily: 'NotoSansKR',
                                color: white,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                              )),
                          Container(
                            width: 28,
                            height: 28,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: white,
                            ),
                            child: Icon(LineIcons.cocktail),
                          ),
                          SizedBox(width: spacing_xxs),
                        ],
                      ),
                    ),
                    Container(
                      width: Get.mediaQuery.size.width * 0.416,
                      height: 36,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: primary_dark,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(width: spacing_l),
                          Text('맞춤 상품 보기',
                              style: TextStyle(
                                fontFamily: 'NotoSansKR',
                                color: white,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                              )),
                          Container(
                            width: 28,
                            height: 28,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: white,
                            ),
                            child: Icon(LineIcons.shoppingBag),
                          ),
                          SizedBox(width: spacing_xxs),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: spacing_l),
              Divider(),
              buildTab(),
              Divider(height: 0, color: grey_1),
              SizedBox(height: spacing_xxl),
              buildBody(controller.currentTab.value),
            ],
          ),
        )),
      ),
    );
  }

  Widget buildTab() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          controller.currentTab.value == 0
              ? InkWell(
                  onTap: () {
                    controller.changeTab(0);
                  },
                  child: Column(
                    children: [
                      Text('피부특성',
                          style: TextStyle(
                            fontFamily: 'NotoSansKR',
                            color: primary,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                          )),
                      SizedBox(height: spacing_s),
                      Container(
                        width: 60,
                        height: 2,
                        color: primary,
                      )
                    ],
                  ),
                )
              : InkWell(
                  onTap: () {
                    controller.changeTab(0);
                  },
                  child: Column(
                    children: [
                      Text('피부특성',
                          style: TextStyle(
                            fontFamily: 'NotoSansKR',
                            color: textfields,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                          )),
                      SizedBox(height: spacing_s),
                      Container(
                        width: 60,
                        height: 2,
                        color: white,
                      )
                    ],
                  ),
                ),
          controller.currentTab.value == 1
              ? InkWell(
                  onTap: () {
                    controller.changeTab(1);
                  },
                  child: Column(
                    children: [
                      Text('전성분',
                          style: TextStyle(
                            fontFamily: 'NotoSansKR',
                            color: primary,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                          )),
                      SizedBox(height: spacing_s),
                      Container(
                        width: 60,
                        height: 2,
                        color: primary,
                      )
                    ],
                  ),
                )
              : InkWell(
                  onTap: () {
                    controller.changeTab(1);
                  },
                  child: Column(
                    children: [
                      Text('전성분',
                          style: TextStyle(
                            fontFamily: 'NotoSansKR',
                            color: textfields,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                          )),
                      SizedBox(height: spacing_s),
                      Container(
                        width: 60,
                        height: 2,
                        color: white,
                      )
                    ],
                  ),
                ),
          controller.currentTab.value == 2
              ? InkWell(
                  onTap: () {
                    controller.changeTab(2);
                  },
                  child: Column(
                    children: [
                      Text('생활습관',
                          style: TextStyle(
                            fontFamily: 'NotoSansKR',
                            color: primary,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                          )),
                      SizedBox(height: spacing_s),
                      Container(
                        width: 60,
                        height: 2,
                        color: primary,
                      )
                    ],
                  ),
                )
              : InkWell(
                  onTap: () {
                    controller.changeTab(2);
                  },
                  child: Column(
                    children: [
                      Text('생활습관',
                          style: TextStyle(
                            fontFamily: 'NotoSansKR',
                            color: textfields,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                          )),
                      SizedBox(height: spacing_s),
                      Container(
                        width: 60,
                        height: 2,
                        color: white,
                      )
                    ],
                  ),
                ),
          controller.currentTab.value == 3
              ? InkWell(
                  onTap: () {
                    controller.changeTab(3);
                  },
                  child: Column(
                    children: [
                      Text('기타',
                          style: TextStyle(
                            fontFamily: 'NotoSansKR',
                            color: primary,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                          )),
                      SizedBox(height: spacing_s),
                      Container(
                        width: 60,
                        height: 2,
                        color: primary,
                      )
                    ],
                  ),
                )
              : InkWell(
                  onTap: () {
                    controller.changeTab(3);
                  },
                  child: Column(
                    children: [
                      Text('기타',
                          style: TextStyle(
                            fontFamily: 'NotoSansKR',
                            color: textfields,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                          )),
                      SizedBox(height: spacing_s),
                      Container(
                        width: 60,
                        height: 2,
                        color: white,
                      )
                    ],
                  ),
                )
        ],
      ),
    );
  }

  Widget buildBody(int currentTab) {
    switch (currentTab) {
      case 0:
        return buildTab1();
      case 1:
        return buildTab2();
      case 2:
        return buildTab3();
      case 3:
        return buildTab4();
    }
    return buildTab1();
  }

  Widget buildTab4() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            child: Text('오전',
                style: TextStyle(
                  fontFamily: 'NotoSansKR',
                  color: black,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.normal,
                )),
          ),
          SizedBox(height: 35),
          buildTab3Content('1.', '클린저로 세안한다.'),
          buildTab3Content('2.', '토너를 사용한다.(선택 사항)'),
          buildTab3Content('3.', '검은 점이 있으면 피부 미백제를 도포한다. (선택사항)'),
          buildTab3Content('4.', '자외선 차단제를 바른다.'),
          buildTab3Content('5.', 'SPF 기능이 있는 제품으로 메이크업을 한다.'),
          SizedBox(height: 35),
          Container(
            alignment: Alignment.centerLeft,
            child: Text('오후',
                style: TextStyle(
                  fontFamily: 'NotoSansKR',
                  color: black,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.normal,
                )),
          ),
          SizedBox(height: 35),
          buildTab3Content('1.', '클렌저로 세안한다.'),
          buildTab3Content('2.', '토너를 사용한다.(선택 사항)'),
          buildTab3Content('3.', '여드름은 치료 약제, 검은 점은 피부 미백제를 도포한다.'),
          buildTab3Content('4.', '아이 크림을 바른다.(선택사항)'),
          buildTab3Content('5.', '복합성 피부는 건조한 부위에 보습제를 도포한다.'),
          SizedBox(height: 35),
        ],
      ),
    );
  }

  Widget buildTab3() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            child: Text('일반적인 피부 관리는',
                style: TextStyle(
                  fontFamily: 'NotoSansKR',
                  color: black,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.normal,
                )),
          ),
          SizedBox(height: 35),
          Text(
              'OSPT의 모든 문제는 예방이 가능해요. 자극이 예상되는 성분의 제품을 피하고, 일광 노출을 피하며 자외선 차단제를 필수적으로 사용해주세요. 염증-발진-색소 침착의 악순환을 방지하는 것이 핵심이에요.',
              style: TextStyle(
                fontFamily: 'NotoSansKR',
                color: grey_1,
                fontSize: 14,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
              )),
          SizedBox(height: 35),
          Container(
            alignment: Alignment.centerLeft,
            child: Text('매일하는 피부 관리는',
                style: TextStyle(
                  fontFamily: 'NotoSansKR',
                  color: black,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.normal,
                )),
          ),
          SizedBox(height: 35),
          buildTab3Content('1.', '얼굴의 급격한 온도변화(찜질 등)는 염증이 발생하기 쉬우므로 자제해 주세요.'),
          buildTab3Content(
              '2.', '여드름은 자극하지 않는 것이 좋아요. 짜내야 한다면 전 과정 소독을 신경써 주세요.'),
          buildTab3Content(
              '3.', '검은 점이 발생하면 완전히 없어질 때까지 피부 미백제(처방전에 의한)를 사용해 주세요.'),
          buildTab3Content(
              '4.', '보습제는 모공을 막고, 번들거림을 증가시키기 때문에 대부분의 경우에 필요하지 않아요.'),
          buildTab3Content(
              '5.', '각질제거제로 발생한 과도한 벗겨짐은 피부의 염증과 검은 점을 유발하니 사용하지 말아 주세요.'),
          buildTab3Content('6.', '작열감, 홍반 등이 일어나는 자외선 차단제는 사용하지 말아주세요.'),
          SizedBox(height: 35),
          Container(
            alignment: Alignment.centerLeft,
            child: Text('대부분의 시술은 필요하지 않아요.',
                style: TextStyle(
                  fontFamily: 'NotoSansKR',
                  color: black,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.normal,
                )),
          ),
          SizedBox(height: 35),
        ],
      ),
    );
  }

  Column buildTab3Content(String number, String desc) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(number,
                style: TextStyle(
                  fontFamily: 'NotoSansKR',
                  color: grey_1,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                )),
            SizedBox(width: spacing_xs),
            Container(
              width: Get.mediaQuery.size.width * 0.8,
              child: Text(desc,
                  style: TextStyle(
                    fontFamily: 'NotoSansKR',
                    color: grey_1,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                  )),
            ),
          ],
        ),
        SizedBox(
          height: spacing_xxs,
        )
      ],
    );
  }

  Widget buildTab2() {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: spacing_xl),
          alignment: Alignment.centerLeft,
          child: Text('GOOD😀',
              style: TextStyle(
                fontFamily: 'NotoSansKR',
                color: black,
                fontSize: 16,
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.normal,
              )),
        ),
        buildJunSungbun('피부 염증 감소',
            'Aloe vera, Salicylic acid(BHA), Mallow, Dexpanthenol(provitamin B5), Boswelia serrata, Silymarin'),
        buildJunSungbun('여드름 감소',
            'Aloe vera, Salicylic acid(BHA), Mallow, Dexpanthenol(provitamin B5), Boswelia serrata, Silymarin'),
        buildJunSungbun('색소 예방', 'Niacanamide'),
        buildJunSungbun('색소 감소',
            'Arbutin, Salicylic acid(BHA), Mulberry extract, Cucumber extract, Resorcinol(검은피부는 주의)Epilobium angustifolium(willow herb), Kojic acid, Bearberry extract, Glycyrrhiza glabra'),
        SizedBox(height: spacing_xs),
        Container(
          padding: EdgeInsets.symmetric(horizontal: spacing_xl),
          alignment: Alignment.centerLeft,
          child: Text('BAD😥',
              style: TextStyle(
                fontFamily: 'NotoSansKR',
                color: black,
                fontSize: 16,
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.normal,
              )),
        ),
        buildJunSungbun('여드름 발생',
            'Butyl stearate, Myristyl propionate, Isostearyl isostearate, Isocetyl stearate, Cinnamon Oil, Octyl palmitate, Isostearyl neopentanoate, Isopropyl isostearate, Cocoa butter, Octyl stearate, Jojoba oil, Isopropyl myristate, Cocos nucifera(coconut oil), Peppermint oil, Myristyl myristate, Isopropyl palmitate, Decyl oleate'),
        buildJunSungbun('피부 알레르기/발진',
            'Butyl stearate, Myristyl propionate, Isostearyl isostearate, Isocetyl stearate, Cinnamon Oil, Octyl palmitate, Isostearyl neopentanoate, Isopropyl isostearate, Cocoa butter, Octyl stearate, Jojoba oil, Isopropyl myristate, Cocos nucifera(coconut oil), Peppermint oil, Myristyl myristate, Isopropyl palmitate, Decyl oleate'),
        buildJunSungbun('피해야 할 클렌징 성분',
            'Butyl stearate, Myristyl propionate, Isostearyl isostearate, Isocetyl stearate, Cinnamon Oil, Octyl palmitate, Isostearyl neopentanoate, Isopropyl isostearate, Cocoa butter, Octyl stearate, Jojoba oil, Isopropyl myristate, Cocos nucifera(coconut oil), Peppermint oil, Myristyl myristate, Isopropyl palmitate, Decyl oleate'),
      ],
    );
  }

  Widget buildJunSungbun(String title, String desc) {
    return Column(
      children: [
        SizedBox(height: spacing_xs),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: spacing_xxl2),
          child: Row(
            children: [
              Text('•',
                  style: TextStyle(
                    fontFamily: 'NotoSansKR',
                    color: Colors.red,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                  )),
              SizedBox(width: spacing_xs),
              Text(title,
                  style: TextStyle(
                    fontFamily: 'NotoSansKR',
                    color: Colors.red,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                  ))
            ],
          ),
        ),
        SizedBox(height: spacing_xxs),
        Container(
          padding: EdgeInsets.only(left: 45, right: spacing_xl),
          alignment: Alignment.centerLeft,
          child: Text(desc,
              style: TextStyle(
                fontFamily: 'NotoSansKR',
                color: grey_1,
                fontSize: 12,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
              )),
        ),
        SizedBox(height: spacing_xs),
        Divider(),
      ],
    );
  }

  Widget buildTab1() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
      child: Column(
        children: [
          buildTab1Text('색소 침착, 민감성, 피지 생성이 특징인 피부 유형'),
          buildTab1Text('잡티에서 검은 점, 다시 잡티로 진행되는 악순환'),
          buildTab1Text('여드름, 주사, 피부 알레르기가 발생하면 치료는 필수적임.'),
          buildTab1Text('자극성의 피부 관리용 제품은 악순환을 유발함.'),
          buildTab1Text('더운 날의 일광 노출과 화상은 염증을 유발함.'),
          buildTab1Text('민감성 피부이므로 왁싱, 사우나, 박피 등 피부를 자극하는 행위는 좋지 않음.'),
          buildTab1Text('제품이나 시술로부터 피부를 보호하는 것이 중요함'),
          buildTab1Text('다양한 환경에서 생성된 반응성 물질에 의해 나타나는 부작용을 신경쓸 것.'),
        ],
      ),
    );
  }

  Widget buildTab1Text(String desc) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('•',
                style: TextStyle(
                  fontFamily: 'NotoSansKR',
                  color: grey_1,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                )),
            SizedBox(width: spacing_xs),
            Container(
              width: Get.mediaQuery.size.width * 0.8,
              child: Text(desc,
                  style: TextStyle(
                    fontFamily: 'NotoSansKR',
                    color: grey_1,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                  )),
            ),
          ],
        ),
        SizedBox(height: spacing_xxs),
      ],
    );
  }
}
