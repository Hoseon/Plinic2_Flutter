import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:get/get.dart';
import 'package:plinic2/constants.dart';
import 'package:plinic2/src/component/custom_appbar.dart';
import 'package:plinic2/src/controller/credit_card_controller.dart';
import 'package:plinic2/src/controller/profile_controller.dart';

class SubScribeRegistCard extends GetView<CreditCardController> {
  SubScribeRegistCard({Key? key}) : super(key: key);
  final _formKey1 = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();
  final _formKey3 = GlobalKey<FormState>();
  final _formKey4 = GlobalKey<FormState>();
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  final TextEditingController _controller3 = TextEditingController();
  final TextEditingController _controller4 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppbar('카드 등록'),
        backgroundColor: white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: spacing_xxl),
              /////////////
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.symmetric(horizontal: spacing_xl),
                child: Text(
                  '결제수단을 등록해주세요.',
                  style: TextStyle(
                    color: grey_1,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                  ),
                ),
              ),
              //////////////
              Obx(
                () => CreditCardWidget(
                  cardNumber: controller.cardNumber.value,
                  expiryDate: controller.expireDate.value,
                  cardHolderName: 'Plinic Text',
                  cvvCode: '',
                  showBackView: false,
                  onCreditCardWidgetChange: (value) {
                    print(value);
                  },
                  cardBgColor: primary_dark,
                ),
              ),
              SizedBox(height: spacing_xs),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
                child: Container(
                  width: Get.mediaQuery.size.width,
                  height: 304,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.red, width: 0.5),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: spacing_s),
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: Text(
                          '카드번호',
                          style: TextStyle(
                            color: black,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                      ),
                      Form(
                        key: _formKey1,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Column(
                            children: [
                              TextFormField(
                                controller: _controller1,
                                validator: (String? value) {
                                  if (value!.length == 16 || value.isEmpty) {
                                    return '카드 정보를 정확하게 입력하세요';
                                  }
                                  return null;
                                },
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  CreditCardNumberInputFormatter(),
                                ],
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'XXXX XXXX XXXX XXXX',
                                ),
                              ),
                              SizedBox(height: spacing_xs),
                              Container(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  '카드 만료일(월/년도)',
                                  style: TextStyle(
                                    color: black,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    fontStyle: FontStyle.normal,
                                  ),
                                ),
                              ),
                              TextFormField(
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  CreditCardExpirationDateFormatter()
                                ],
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'ex)01/26',
                                ),
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  '카드 소유주 생년월일 혹은 법인 번호',
                                  style: TextStyle(
                                    color: black,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    fontStyle: FontStyle.normal,
                                  ),
                                ),
                              ),
                              TextFormField(
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  MaskedInputFormatter('######')
                                ],
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'ex)841025',
                                ),
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  '카드 앞 2자리 비밀번호',
                                  style: TextStyle(
                                    color: black,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    fontStyle: FontStyle.normal,
                                  ),
                                ),
                              ),
                              TextFormField(
                                keyboardType: TextInputType.number,
                                inputFormatters: [MaskedInputFormatter('00')],
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: '00',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
