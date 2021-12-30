import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:plinic2/constants.dart';
import 'package:plinic2/src/component/custom_appbar.dart';
import 'package:plinic2/src/pages/home/monthly_payment.dart';
import 'package:plinic2/src/pages/home/pay_step2.dart';

class PayStep1Page extends StatefulWidget {
  PayStep1Page({Key? key}) : super(key: key);

  @override
  State<PayStep1Page> createState() => _PayStep1PageState();
}

class _PayStep1PageState extends State<PayStep1Page> {
  int? selectType;

  @override
  Widget build(BuildContext context) {
    selectType = Get.arguments;
    return Scaffold(
      appBar: CustomAppbar('구독서비스'),
      backgroundColor: white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: spacing_xxl),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
              alignment: Alignment.centerLeft,
              child: Text(
                'STEP 1',
                style: TextStyle(
                  color: Color(0xff828282),
                  fontSize: 14,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.normal,
                ),
              ),
            ),
            SizedBox(height: spacing_m),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
              alignment: Alignment.centerLeft,
              child: Text(
                '구독하실 상품정보를 확인해주세요.',
                style: TextStyle(
                  color: Color(0xff1d1d1d),
                  fontSize: 20,
                  fontFamily: 'NotoSansKR',
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.normal,
                ),
              ),
            ),
            SizedBox(height: spacing_xl),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
              child: Image.asset('assets/images/home/subscribe-box.png',
                  width: Get.mediaQuery.size.width, fit: BoxFit.fitWidth),
            ),
            SizedBox(height: spacing_l),
            buildTitle(selectType),
            Column(
              children: [
                buildProduct(selectType),
                buildDesc(),
              ],
            ),
            SizedBox(height: spacing_xl),
            buildButton(),
          ],
        ),
      ),
    );
  }

  Widget buildDesc() {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '•',
                style: TextStyle(
                    color: grey_1,
                    fontSize: 12,
                    fontFamily: 'NotoSans',
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    height: 1.99),
              ),
              SizedBox(width: spacing_xxs),
              Container(
                width: Get.mediaQuery.size.width * 0.8,
                child: Text(
                  '해당 구독서비스는 정기결제로 결제 방법은 신용카드만 가능합니다.',
                  style: TextStyle(
                      color: grey_1,
                      fontSize: 12,
                      fontFamily: 'NotoSans',
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      height: 1.99),
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '•',
                style: TextStyle(
                    color: grey_1,
                    fontSize: 12,
                    fontFamily: 'NotoSans',
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    height: 1.99),
              ),
              SizedBox(width: spacing_xxs),
              Container(
                width: Get.mediaQuery.size.width * 0.8,
                child: Text(
                  '해당 구독 서비스 기간은 1개월 단위로 자동 결제됩니다. ',
                  style: TextStyle(
                      color: grey_1,
                      fontSize: 12,
                      fontFamily: 'NotoSansKR',
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      height: 1.99),
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '•',
                style: TextStyle(
                    color: grey_1,
                    fontSize: 12,
                    fontFamily: 'NotoSans',
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    height: 1.99),
              ),
              SizedBox(width: spacing_xxs),
              Container(
                width: Get.mediaQuery.size.width * 0.8,
                child: Text(
                  '구독 서비스 신청 시 결제가 완료된 날을 기준으로 2일 이내 (영업일 기준)에 배송이 시작됩니다.',
                  style: TextStyle(
                      color: grey_1,
                      fontSize: 12,
                      fontFamily: 'NotoSansKR',
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      height: 1.99),
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '•',
                style: TextStyle(
                    color: grey_1,
                    fontSize: 12,
                    fontFamily: 'NotoSans',
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    height: 1.99),
              ),
              SizedBox(width: spacing_xxs),
              Container(
                width: Get.mediaQuery.size.width * 0.8,
                child: Text(
                  '플리닉 앱 내에서 적립되는 포인트의 경우 앱에서만 확인 및 사용이 가능합니다.',
                  style: TextStyle(
                      color: grey_1,
                      fontSize: 12,
                      fontFamily: 'NotoSansKR',
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      height: 1.99),
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '•',
                style: TextStyle(
                    color: grey_1,
                    fontSize: 12,
                    fontFamily: 'NotoSans',
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    height: 1.99),
              ),
              SizedBox(width: spacing_xxs),
              Container(
                width: Get.mediaQuery.size.width * 0.8,
                child: Text(
                  '구매 후 12개월간 무상 수리 보증기간이지만, 사용자의 부주의(외부 요인에 의한, 소모품 고장 등)로 인한 고장은 보증기간이라도 유상서비스로 처리되어 수리비가 청구될 수 있습니다.',
                  style: TextStyle(
                      color: grey_1,
                      fontSize: 12,
                      fontFamily: 'NotoSansKR',
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      height: 1.99),
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '•',
                style: TextStyle(
                    color: grey_1,
                    fontSize: 12,
                    fontFamily: 'NotoSans',
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    height: 1.99),
              ),
              SizedBox(width: spacing_xxs),
              Container(
                width: Get.mediaQuery.size.width * 0.8,
                child: Text(
                  '단순 변심으로 인한 환불은 배송 일 기준 2주 이내에만 처리 가능하며, 약정기간이 있는 구독상품 해지 시 위약금이 발생 될 수 있습니다.',
                  style: TextStyle(
                      color: grey_1,
                      fontSize: 12,
                      fontFamily: 'NotoSansKR',
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      height: 1.99),
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '•',
                style: TextStyle(
                    color: grey_1,
                    fontSize: 12,
                    fontFamily: 'NotoSans',
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    height: 1.99),
              ),
              SizedBox(width: spacing_xxs),
              Container(
                width: Get.mediaQuery.size.width * 0.8,
                child: Text(
                  '구독상품 해지는 해지 절차에 따라 관리자의 승인완료된 후 다음 결제일 부터 결제되지 않습니다. (단, 위약금이 발생하는 구독 상품의 한해 적용됩니다.)',
                  style: TextStyle(
                      color: grey_1,
                      fontSize: 12,
                      fontFamily: 'NotoSansKR',
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      height: 1.99),
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '•',
                style: TextStyle(
                    color: grey_1,
                    fontSize: 12,
                    fontFamily: 'NotoSans',
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    height: 1.99),
              ),
              SizedBox(width: spacing_xxs),
              Container(
                width: Get.mediaQuery.size.width * 0.8,
                child: Text(
                  '구독 해지를 원할 경우 결제일 최소 10일 전에 신청해야 정상적으로 처리가 완료됩니다. (해지 신청을 늦게하면서 생기는 자동결제건에 대한 환불은 불가능합니다.)',
                  style: TextStyle(
                      color: grey_1,
                      fontSize: 12,
                      fontFamily: 'NotoSansKR',
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      height: 1.99),
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '•',
                style: TextStyle(
                    color: grey_1,
                    fontSize: 12,
                    fontFamily: 'NotoSans',
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    height: 1.99),
              ),
              SizedBox(width: spacing_xxs),
              Container(
                width: Get.mediaQuery.size.width * 0.8,
                child: Text(
                  '구독 관련 및 문의사항이 있으시다면 플리닉 고객센터(02-2038-4876)으로 문의 부탁드립니다.',
                  style: TextStyle(
                      color: grey_1,
                      fontSize: 12,
                      fontFamily: 'NotoSansKR',
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      height: 1.99),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildButton() {
    return ConstrainedBox(
      constraints:
          BoxConstraints.tightFor(width: Get.mediaQuery.size.width, height: 60),
      child: ElevatedButton(
        style: ButtonStyle(
            // side: MaterialStateProperty.all(BorderSide(color: grey_2)),
            shape: MaterialStateProperty.all(
                RoundedRectangleBorder(borderRadius: BorderRadius.zero)),
            elevation: MaterialStateProperty.all(0.0),
            backgroundColor: MaterialStateProperty.all(primary)),
        onPressed: () {
          switch (selectType) {
            case 0:
              return showActionSheet(context);
            case 1:
              return showActionSheet(context);
            case 2:
              Get.to(MonthlyPayment(), transition: Transition.native);
              break;
            default:
          }
          // showActionSheet(context);
          // Get.to(MonthlyPayment(), transition: Transition.native);
        },
        child: Text('구독 결제 하기',
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

  Column buildProduct(int? selectType) {
    Map<String, dynamic>? desc;

    switch (selectType) {
      case 0:
        desc = {
          'desc1': '플리닉 싱글 플라즈마 디바이스 - 첫 1회 제공',
          'desc2': '피부 부스터 25ml - 매 월 1개 제공',
          'desc3': '전용 마스크 팩 4P - 매 월 1개 제공',
          'desc4': '플리닉 싱글 : 312,000원(정가) x 1',
          'desc5': 'V21. 부스터 : 45,000원(정가) x 12',
          'desc6': 'V21. 마스크 팩 4P : 12,000원 x 12',
          'desc7': '배송비 : 3,000원 x 12',
          'price1': '312,000원',
          'price2': '540,000원',
          'price3': '144,000원',
          'price4': '36,000원',
          'price5': '1,068,000원 / 12개월 = 89,000원',
          'price6': '구독 신청 시 매 월 19,800원',
          'price7': '※ 플리닉 구독박스로 월 69,200원 할인혜택 받기',
        };
        break;
      case 1:
        desc = {
          'desc1': '플리닉 듀얼 플라즈마 디바이스 - 첫 1회 제공',
          'desc2': '피부 부스터 25ml - 매 월 1개 제공',
          'desc3': '전용 마스크 팩 4P - 매 월 1개 제공',
          'desc4': '플리닉 듀얼 : 600,000원(정가) x 1',
          'desc5': 'V21. 부스터 : 45,000원(정가) x 24',
          'desc6': 'V21. 마스크 팩 4P : 12,000원 x 24',
          'desc7': '배송비 : 3,000원 x 24',
          'price1': '600,000원',
          'price2': '1,080,000원',
          'price3': '280,000원',
          'price4': '72,000원',
          'price5': '2,032,000원 / 24개월 = 84,600원',
          'price6': '구독 신청 시 매 월 19,800원',
          'price7': '※ 플리닉 구독박스로 월 64,800원 할인혜택 받기',
        };
        break;
      case 2:
        desc = {
          'desc1': '피부 부스터 25ml - 매 월 1개 제공',
          'desc2': '전용 마스크 팩 4P - 매 월 1개 제공',
          'desc3': '',
          'desc4': 'V21. 부스터 : 45,000원(정가) x 24',
          'desc5': 'V21. 마스크 팩 4P : 12,000원 x 24',
          'desc6': '배송비 : 3,000원 x 24',
          'desc7': '',
          'price1': '1,080,000원',
          'price2': '280,000원',
          'price3': '72,000원',
          'price4': '',
          'price5': '2,032,000원 / 24개월 = 84,600원',
          'price6': '구독 신청 시 매 월 19,800원',
          'price7': '※ 플리닉 구독박스로 월 64,800원 할인혜택 받기',
        };
        break;
      default:
    }
    return Column(
      children: [
        SizedBox(height: spacing_m),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 29),
          child: Row(
            children: [
              Icon(LineIcons.check, color: primary, size: 10),
              SizedBox(width: spacing_xxs),
              Text(
                '상품구성',
                style: TextStyle(
                  color: Color(0xff913aff),
                  fontSize: 12,
                  fontFamily: 'NotoSans',
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: spacing_xxs),
        Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.symmetric(horizontal: 44),
          child: Text(
            desc!['desc1'],
            style: TextStyle(
              fontFamily: 'NotoSans',
              color: grey_1,
              fontSize: 12,
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.normal,
            ),
          ),
        ),
        SizedBox(height: spacing_xxs),
        Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.symmetric(horizontal: 44),
          child: Text(
            desc['desc2'],
            style: TextStyle(
              fontFamily: 'NotoSans',
              color: grey_1,
              fontSize: 12,
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.normal,
            ),
          ),
        ),
        SizedBox(height: spacing_xxs),
        Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.symmetric(horizontal: 44),
          child: Text(
            desc['desc3'] ?? '',
            style: TextStyle(
              fontFamily: 'NotoSans',
              color: grey_1,
              fontSize: 12,
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.normal,
            ),
          ),
        ),
        SizedBox(height: spacing_l),
        Padding(
          padding: const EdgeInsets.only(left: 29, right: 0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(LineIcons.check, color: primary, size: 10),
              SizedBox(width: spacing_xxs),
              Text(
                '구독 약정가격',
                style: TextStyle(
                  color: Color(0xff913aff),
                  fontSize: 12,
                  fontFamily: 'NotoSans',
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: spacing_xxs),
        Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(left: 44, right: spacing_xl),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  desc['desc4'] ?? '',
                  style: TextStyle(
                    fontFamily: 'NotoSans',
                    color: grey_1,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                  ),
                ),
              ),
              Text(
                desc['price1'] ?? '',
                style: TextStyle(
                  fontFamily: 'NotoSans',
                  color: grey_1,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                ),
                textAlign: TextAlign.right,
              )
            ],
          ),
        ),
        SizedBox(height: spacing_xxs),
        Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(left: 44, right: spacing_xl),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  desc['desc5'] ?? '',
                  style: TextStyle(
                    fontFamily: 'NotoSans',
                    color: grey_1,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                  ),
                ),
              ),
              Text(
                desc['price2'] ?? '',
                style: TextStyle(
                  fontFamily: 'NotoSans',
                  color: grey_1,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                ),
                textAlign: TextAlign.right,
              ),
            ],
          ),
        ),
        SizedBox(height: spacing_xxs),
        Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(left: 44, right: spacing_xl),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  desc['desc6'] ?? '',
                  style: TextStyle(
                    fontFamily: 'NotoSans',
                    color: grey_1,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                  ),
                ),
              ),
              Text(
                desc['price3'] ?? '',
                style: TextStyle(
                  fontFamily: 'NotoSans',
                  color: grey_1,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                ),
                textAlign: TextAlign.right,
              )
            ],
          ),
        ),
        SizedBox(height: spacing_xxs),
        Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(left: 44, right: spacing_xl),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  desc['desc7'] ?? '',
                  style: TextStyle(
                    fontFamily: 'NotoSans',
                    color: grey_1,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                  ),
                ),
              ),
              Text(
                desc['price4'] ?? '',
                style: TextStyle(
                  fontFamily: 'NotoSans',
                  color: grey_1,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                ),
                textAlign: TextAlign.right,
              )
            ],
          ),
        ),
        SizedBox(height: spacing_m),
        Padding(
          padding: const EdgeInsets.only(left: spacing_xxl, right: spacing_l),
          child: Container(
            width: Get.mediaQuery.size.width,
            height: 2,
            decoration: BoxDecoration(
              color: grey_2,
            ),
          ),
        ),
        SizedBox(height: spacing_s),
        Container(
          alignment: Alignment.centerRight,
          padding: EdgeInsets.symmetric(horizontal: spacing_xl),
          child: Text(
            desc['price5'],
            style: TextStyle(
              fontFamily: 'NotoSans',
              color: black,
              fontSize: 12,
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.normal,
            ),
          ),
        ),
        SizedBox(height: spacing_xs),
        Container(
          alignment: Alignment.centerRight,
          padding: EdgeInsets.symmetric(horizontal: spacing_xl),
          child: Text(desc['price6'],
              style: TextStyle(
                fontFamily: 'NotoSans',
                color: primary,
                fontSize: 12,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
              )),
        ),
        SizedBox(height: spacing_xxl2),
        Container(
          alignment: Alignment.centerRight,
          padding: EdgeInsets.symmetric(horizontal: spacing_xl),
          child: Text(
            desc['price7'],
            style: TextStyle(
              fontFamily: 'NotoSans',
              color: primary_dark,
              fontSize: 14,
              fontWeight: FontWeight.w700,
              fontStyle: FontStyle.normal,
            ),
          ),
        ),
        SizedBox(height: spacing_xxl2),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
          child: ElevatedButton(
            onPressed: () {},
            style: ButtonStyle(
              side: MaterialStateProperty.all(
                BorderSide(
                  color: primary,
                ),
              ),
              minimumSize: MaterialStateProperty.all(
                Size(Get.mediaQuery.size.width, 40),
              ),
              backgroundColor: MaterialStateProperty.resolveWith<Color>(
                  (Set<MaterialState> states) {
                if (states.contains(MaterialState.pressed)) {
                  return Colors.grey.shade200;
                }
                return Colors.white;
              }),
              elevation: MaterialStateProperty.all(0.0),
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            child: Text(
              '구독 상품 상세보기',
              style: TextStyle(
                fontFamily: 'NotoSans',
                color: primary,
                fontSize: 14,
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.normal,
              ),
            ),
          ),
        ),
        SizedBox(height: spacing_xxl2),
      ],
    );
  }

  Container buildTitle(int? selectType) {
    var title;
    switch (selectType) {
      case 0:
        title = '플리닉 싱글박스 V21';
        break;
      case 1:
        title = '플리닉 듀얼박스 V21';
        break;
      case 2:
        title = '플리닉 화장품박스 V21';
        break;
      default:
    }
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: TextStyle(
          color: Color(0xff1d1d1d),
          fontSize: 16,
          fontFamily: 'NotoSansKR',
          fontWeight: FontWeight.w700,
          fontStyle: FontStyle.normal,
        ),
      ),
    );
  }

  void showActionSheet(BuildContext context) {
    // Get.put<PersonDetailController>(PersonDetailController());
    Get.bottomSheet(
      Container(
          height: 250,
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: spacing_xxs),
            child: Column(
              children: [
                ListTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '카테고리 선택',
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
                Divider(),
                ListTile(
                  onTap: () {
                    Get.back();
                  },
                  title: Row(
                    children: [
                      Text('골드',
                          style: TextStyle(
                            fontFamily: 'NotoSansKR',
                            color: Color(0xff000000),
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                          )),
                    ],
                  ),
                ),
                ListTile(
                  onTap: () {
                    Get.back();
                  },
                  title: Row(
                    children: [
                      Text('퍼플',
                          style: TextStyle(
                            fontFamily: 'NotoSansKR',
                            color: Color(0xff000000),
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                          )),
                    ],
                  ),
                ),
                ListTile(
                  onTap: () async {
                    Get.back();
                  },
                  title: Row(
                    children: [
                      Text('로즈핑크',
                          style: TextStyle(
                            fontFamily: 'NotoSansKR',
                            color: Color(0xff000000),
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                          )),
                    ],
                  ),
                ),
              ],
            ),
          )),
      // barrierColor: Colors.red[50],
      isDismissible: true,
    );
  }
}
