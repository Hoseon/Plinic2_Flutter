import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plinic2/constants.dart';
import 'package:plinic2/src/component/custom_appbar.dart';
import 'package:plinic2/src/controller/faq_controller.dart';
import 'package:plinic2/src/model/sample_faq_data.dart';

class FaqPage extends GetView<FaqController> {
  FaqData? faqData;
  FaqPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put<FaqController>(FaqController());
    return Scaffold(
      appBar: CustomAppbar('FAQ'),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
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
      children: [_faq2(), _faq3(), _faq4()],
    );
  }

  Widget _faq2() {
    return Column(
      children: [
        FAQTiles(
            title: '핸드폰을 바꿔서 계정을 찾을 수 없어요.',
            content: '''[카카오 채널 문의하기]로 문의주시면, 확인 후 SNS 계정 정보를 전달해드리겠습니다.
꼭! SNS 계정 로그인 후 다시 본인인증을 해주시기 바랍니다.
※ [아이디 찾기] 기능은 본인인증을 한 사용자만 이용 가능'''),
        FAQTiles(title: '회원 탈퇴는 어떻게 하나요?', content: '''회원 탈퇴는 마이페이지에서 하실 수 있습니다.
※ 경로 : 마이페이지 > 설정 > 탈퇴하기

탈퇴 진행 시 본인임을 확인하기 위한 인증절차가 진행되며
인증 후에는 즉시 탈퇴 처리되오니 "유의사항"을 잘 읽어보신 후 진행해주세요!'''),
        FAQTiles(
            title: '프로필 사진과 닉네임을 변경하고 싶어요.',
            content: '''회원 정보 변경 시 본인 확인을 위한 인증절차가 진행됩니다.
최초 1회 본인인증 진행 후, 프로필과 닉네임을 변경하실 수 있습니다. '''),
        FAQTiles(
            title: '포인트는 이제 없어졌나요?',
            content:
                '''현재 앱 버전(v.2.0.0)에서는 포인트는 없고, 뷰티디바이스와 연결하는 케어와 챌린지만 가능합니다.
포인트 부분은 추후 업데이트 버전에서 재개 예정입니다.(*일정 미정)'''),
        FAQTiles(
            title: '다른 휴대폰에서도 로그인할 수 있나요?',
            content:
                '''다른 기기에 동일한 계정으로 로그인은 가능하지만 동시 접속 시 케어 연동 횟수는 1회로 간주됩니다.'''),
      ],
    );
  }

  Widget _faq3() {
    return Column(
      children: [
        FAQTiles(
            title: '챌린지 상품 배송조회는 어떻게 할 수 있나요?',
            content: '''챌린지 상품 배송조회는 현재 플리닉 앱을 통해 조회가 불가한 점 양해 부탁드리며
챌린지 상품은 챌린지 성공, [보상받기 버튼] 클릭하시면 1~2일 후 발송됩니다.(*영업일 기준)

배송은 보통 2~3일 소요되나(평일 기준), 지역과 택배사 상황에 따라 달라질 수 있습니다.
진행 상황이 궁금하시면 [카카오 채널 문의하기]로 문의해 주세요!'''),
        FAQTiles(title: '챌린지가 무엇인가요?', content: '''챌린지는 피부관리 습관을 기르기 위한 미션입니다.
디바이스와 앱을 연동하여 케어를 하시면 자동으로 챌린지에 참여되며, 미션을 성공하면 상품을 받으실 수 있습니다.'''),
        FAQTiles(
            title: '챌린지에 실패했는데 다시 도전 가능할까요?',
            content: '''한 번 참여한 챌린지는 중도 실패하실 경우 재참여가 불가능합니다.
새롭게 시작되는 챌린지를 기다려주세요!'''),
        FAQTiles(
            title: '챌린지 보상 성공은 언제쯤 수령 할 수 있을까요?',
            content: '''챌린지 성공 후 [보상받기 버튼]을 클릭하시면 배송지 정보를 입력하실 수 있습니다.
상품 수령은 보통 영업일 기준 3일 이내에 받으실 수 있습니다.

*본인인증 절차를 거쳐 인증 정보를 저장해 두시면
챌린지 완료 시 본인인증 정보를 대조해 보상이 제공됩니다.
회원님께서는 "마이페이지 > 수정하기"를 통해 최초 1회 본인인증을 진행 부탁드립니다!'''),
        FAQTiles(
            title: '챌린지 성공 후 다른 챌린지를 참여해도 되나요?',
            content: '''한 번 성공한 챌린지는 재참여가 불가능합니다.
새롭게 시작되는 챌린지를 기다려주세요!'''),
        FAQTiles(
            title: '챌린지 보상상품이 다른 제품이 왔어요.',
            content: '''상품 오배송, 챌린지 기기 연동 및 기타 문의사항은
'플리닉' 카카오톡 채널로 문의 남겨주시면 빠른 처리 도와드리겠습니다.'''),
        FAQTiles(
            title: '챌린지 도중인데 기기가 작동하지 않아요.',
            content: '''상품 오배송, 챌린지 기기 연동 및 기타 문의사항은
'플리닉' 카카오톡 채널로 문의 남겨주시면 빠른 처리 도와드리겠습니다.'''),
        FAQTiles(
            title: '플리닉을 사용하면 피부가 너무 따가워요.',
            content:
                '''화장품을 충분히 바르지 않거나, 피부과 시술 후 플리닉을 사용하실 경우 등에는 피부가 따가울 수 있습니다.
※ '순수비타민앰플', '레티놀 성분이 들어있는 화장품'은 플리닉 디바이스와 사용 시 예민하게 반응할 수 있으니 가급적 피해주세요.

플리닉 디바이스 사용 시에는 화장품을 충분히 촉촉하게 바르신 후 사용해 주시고
피부과 시술 후에는 전문의와 상담을 통해 일정기간 이후 디바이스 사용하시기 바랍니다.'''),
      ],
    );
  }

  Widget _faq4() {
    return Column(
      children: [
        FAQTiles(
            title: '플라즈마 줄기가 약해진 것 같아요.',
            content: '''플라즈마 강도가 조금 약해보이거나 램프별로 강도, 색깔이 조금 다른 것은 자연스러운 현상입니다.
테스트 결과 플라즈마 강도가 조금 약해보여도 효과는 동일한 것으로 것으로 판명되었으며
이러한 현상은 고장, 불량이 아니며 기능에 차이가 없으니 안심하고 사용해주세요.

※ 만약 플라즈마가 거의 보이지 않거나 많이 약해진 경우, [카카오 채널 문의하기]를 통해 문의 남겨주세요.'''),
        FAQTiles(
            title: '듀얼의 양쪽 램프가 달라요',
            content: '''플라즈마 강도가 조금 약해보이거나 램프별로 강도, 색깔이 조금 다른 것은 자연스러운 현상입니다.
테스트 결과 플라즈마 강도가 조금 약해보여도 효과는 동일한 것으로 것으로 판명되었으며
이러한 현상은 고장, 불량이 아니며 기능에 차이가 없으니 안심하고 사용해주세요.

※ 만약 플라즈마가 거의 보이지 않거나 많이 약해진 경우, [카카오 채널 문의하기]를 통해 문의 남겨주세요.'''),
        FAQTiles(
            title: '전원이 안켜져요',
            content: '''디바이스는 충전 후 오랜 시간 사용하지 않으면 방전될 가능성이 있어요!
넉넉히 4시간 이상 충전하시고 전원이 켜지는지 확인해주세요.
그래도 전원이 안 켜질 경우, [카카오 채널 문의하기]를 통해 문의 남겨주세요.'''),
        FAQTiles(
            title: '충전이 갑자기 안돼요.',
            content: '''1. 플리닉 구매 시 제공한 케이블을 사용하셨는지 확인해주세요.
2. 플리닉은 일반(저속) 충전기로 충전을 권장합니다. (*고속 충전기 사용 시 충전이 안 되는 경우 있음)
3. 플리닉 듀얼의 경우, 우선 아래 사항 추가 확인 부탁드립니다.
 - 충전거치대와 플리닉 디바이스 접속 부분 및 방향 확인(*디바이스 전원버튼이 앞)
 - 케이블과 충전기 연결부분 접속이 잘 되었는지 확인

※ 문제가 지속될 경우, [카카오 채널 문의하기]를 통해 문의 남겨주세요.
- 사진을 함께 보내주시면 신속한 확인이 가능합니다.'''),
        FAQTiles(
            title: '기기에 물이 닿을 경우 사용해도 괜찮나요?',
            content: '''플리닉 뷰티디바이스는 IPX4 방수(생활 방수) 등급을 받았습니다.
습기가 있는 곳에서도 사용의 문제는 없으나 과도한 수분 접촉은 제품에 고장을 일으킬 수 있습니다.

또한 기기 사용 후 물에 직접 세척은 삼가해 주시고, 물티슈나 마른 헝겊으로 램프를 닦으신 후 보호캡을 씌우고 평균 습도의 실내에서 보관을 권장해 드립니다.'''),
        FAQTiles(
            title: '플리닉 앱은 뷰티디바이스 없이 사용하지 못하나요?',
            content: '''현재 버전(v.2.0.0)의 앱은 뷰티디바이스와 연결하여 피부습관을 기록하고 케어하는 앱입니다.
디바이스 연결없이 사용할 수 있는 앱은 개발 예정이니 조금만 기다려 주세요! 😀'''),
        FAQTiles(
            title: '플리닉 디바이스 A/S 비용과 소요기간 알려주세요',
            content: '''플리닉 디바이스의 무상보증기간은 1년입니다.
※ 고객 과실로 인한 A/S는 무상보증기간이라도 비용이 발생할 수 있음
※ 무상보증기간 종료 후에는 A/S 수리비용 및 왕복 택배비 발생

A/S는 평균 약 1주일 정도 소요됩니다.(*택배 운송기간 제외)
신속한 조치를 위해 문제가 되는 부분을 영상 혹은 사진 촬영 후, '플리닉' 카카오톡 채널로 문의해주세요!'''),
        FAQTiles(
            title: '기기와 앱 연동 방법을 모르겠어요.', content: '''플리닉 디바이스와 앱 연동 방법 안내입니다.

ㅁ 준비물 : 플리닉 디바이스, 플리닉 앱
1. 핸드폰의 블루투스를 켭니다.
2. 플리닉 앱을 켜고, 케어 탭의 [케어 시작하기] 버튼을 터치해 주세요.
3. 플리닉 뷰티디바이스 전원을 켜주세요.
4. 연동 완료!(정상 연동 시 관리 시간이 노출됩니다)

유튜브에서 "플리닉 앱 연동"을 검색하시면
[플리닉 앱과 피부관리기 연동 방법] 안내 동영상이 있습니다. 😀
☞ 바로가기 : https://youtu.be/Xtl40odK5QY

※ 문제가 지속될 경우, [카카오 채널 문의하기]를 통해 문의 남겨주세요.
- 문의자명 / 아이디 / 오류화면 사진을 함께 보내주시면 신속한 확인이 가능합니다.'''),
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
                  Container(
                    width: Get.mediaQuery.size.width * 0.72,
                    child: Text(
                      title,
                      style: TextStyle(
                        fontFamily: 'NotoSansKR',
                        color: Color(0xff000000),
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  )
                ],
              ),
            ),
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: spacing_xxl),
                child: Text(
                  content,
                  style: TextStyle(
                    fontFamily: 'NotoSansKR',
                    color: Color(0xff000000),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                  ),
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
