import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plinic2/constants.dart';
import 'package:plinic2/src/component/custom_appbar.dart';
import 'package:plinic2/src/pages/my/qna/register_qna.dart';

class QnaPage extends StatelessWidget {
  const QnaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: spacing_xl, right: spacing_l),
        child: FloatingActionButton(
          backgroundColor: primary,
          onPressed: () {
            Get.to(() => RegisterQnaPage(), transition: Transition.native);
          },
          child: Icon(Icons.sms),
        ),
      ),
      appBar: CustomAppbar('문의내역'),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: spacing_xl),
            buildHeadCount(),
            buildExpanded(context, true, '친구초대 어떻게 할 수 있나요?', '언제든지 자유롭게'),
            buildExpanded(context, false, '누구든지 상품을 구매 할 수 있나요?', '언제든지 자유롭게'),
            buildExpanded(context, false, '서비스 관련해서 몇가지 문의드립니다.', '언제든지 자유롭게'),
            buildExpanded(context, false, '문의드립니다.', '언제든지 자유롭게'),
            buildExpanded(context, true, '친구초대 어떻게 할 수 있나요?', '언제든지 자유롭게'),
            buildExpanded(context, false, '누구든지 상품을 구매 할 수 있나요?', '언제든지 자유롭게'),
            buildExpanded(context, false, '서비스 관련해서 몇가지 문의드립니다.', '언제든지 자유롭게'),
            buildExpanded(context, false, '문의드립니다.', '언제든지 자유롭게'),
          ],
        ),
      ),
    );
  }

  Padding buildHeadCount() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
      child: Row(
        children: [
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: '문의',
                  style: TextStyle(
                    fontFamily: 'NotoSansKR',
                    color: Color(0xff000000),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                  ),
                ),
                TextSpan(
                  text: '22',
                  style: TextStyle(
                    fontFamily: 'NotoSansKR',
                    color: Color(0xff000000),
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildExpanded(
      BuildContext context, bool isreply, String title, String answer) {
    return Column(
      children: [
        Theme(
          data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
          child: ExpansionTile(
            // childrenPadding: EdgeInsets.all(10),
            tilePadding: EdgeInsets.symmetric(
                horizontal: spacing_xl, vertical: spacing_s),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(Icons.expand_more),
              ],
            ),
            backgroundColor: Colors.white,
            iconColor: grey_1,
            title: Column(
              children: [
                Row(
                  children: [
                    isreply == true
                        ? Container(
                            alignment: Alignment.center,
                            width: 68,
                            height: 28,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                shape: BoxShape.rectangle,
                                color: primary_dark),
                            child: Text(
                              '답변대기',
                              style: TextStyle(
                                fontFamily: 'NotoSansKR',
                                color: white,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                              ),
                            ),
                          )
                        : Container(
                            alignment: Alignment.center,
                            width: 68,
                            height: 28,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                shape: BoxShape.rectangle,
                                color: grey_1),
                            child: Text(
                              '답변완료',
                              style: TextStyle(
                                fontFamily: 'NotoSansKR',
                                color: white,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                              ),
                            ),
                          ),
                    SizedBox(width: 12),
                    Text(
                      '2021.07.24',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        color: black,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      ),
                    )
                  ],
                ),
                SizedBox(height: spacing_m),
                Row(
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
              ],
            ),
            children: [
              SizedBox(height: spacing_m),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
                child: Row(
                  children: [
                    Text(
                        '안녕하세요 회원님\n먼저  Plinic을 이용해 주셔서 감사합니다.\n서비스 내 상품은 회원이라면 누구든지 구매하실 수 \n있습니다. 감사합니다.',
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
              SizedBox(height: spacing_m),
            ],
          ),
        ),
        Divider()
      ],
    );
  }
}
