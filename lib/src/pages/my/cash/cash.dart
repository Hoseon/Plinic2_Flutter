import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:plinic2/constants.dart';
import 'package:plinic2/src/component/custom_appbar.dart';
import 'package:plinic2/src/controller/cash_controller.dart';
import 'package:plinic2/src/controller/profile_controller.dart';
import 'package:plinic2/src/model/sample_cashdata.dart';
import 'package:plinic2/src/pages/my/cash/cash_detail.dart';

class CashPage extends GetView<CashController> {
  const CashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut<CashController>(() => CashController());
    return Scaffold(
      appBar: CustomAppbar('캐시관리'),
      backgroundColor: Colors.white,
      body: ListView.builder(
        itemCount: cashData.length + 1,
        itemBuilder: (_, index) {
          if (index == 0) {
            return Container(
              child: Column(
                children: [
                  SizedBox(height: 48),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${Get.find<ProfileController>().myProfile.value.name.toString()}님의 보유 캐시',
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
                  SizedBox(height: spacing_xs),
                  RichText(
                    text: TextSpan(children: [
                      TextSpan(
                        text: '11,489',
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          color: black,
                          fontSize: 40,
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                      TextSpan(
                        text: '점',
                        style: TextStyle(
                          fontFamily: 'NotoSansKR',
                          color: black,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                    ]),
                  ),
                  SizedBox(height: 40),
                  Divider(
                    thickness: 14,
                    color: grey_3,
                  ),
                  SizedBox(height: spacing_xxl),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Obx(() => controller.checkSort.value
                            ? createdSort()
                            : unCreatedSort()),
                        SizedBox(width: 22),
                        Obx(
                          () => controller.checkSort.value
                              ? unLastSort()
                              : lastSort(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: Container(
              height: 90,
              child: ListTile(
                onTap: () {
                  Get.to(() => CashDetailPage(cashData: cashData[index - 1]));
                },
                shape: Border(
                  top: BorderSide(color: grey_3),
                  // bottom: BorderSide(color: grey_3),
                ),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: spacing_m),
                    Text(
                      cashData[index - 1].title.toString(),
                      style: TextStyle(
                        fontFamily: 'NotoSansKR',
                        color: Color(0xff000000),
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                    SizedBox(height: spacing_xxs),
                    Text(
                      cashData[index - 1].date.toString(),
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        color: grey_2,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      ),
                    )
                  ],
                ),
                // leading:
                trailing: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: 8),
                    RichText(
                      text: TextSpan(children: [
                        TextSpan(
                          text: cashData[index - 1].price.toString(),
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            color: cashData[index - 1].type.toString() == '사용'
                                ? Colors.red
                                : primary,
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                        TextSpan(
                          text: '점',
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            color: cashData[index - 1].type.toString() == '사용'
                                ? Colors.red
                                : primary,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                          ),
                        )
                      ]),
                    ),
                    Text(
                      cashData[index - 1].type.toString(),
                      style: TextStyle(
                        fontFamily: 'NotoSansKR',
                        color: Color(0xff000000),
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Container bodyHeader() {
    return Container(
      child: Column(
        children: [
          SizedBox(height: 48),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '홍길동님의 보유 캐시',
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
          SizedBox(height: spacing_xs),
          RichText(
            text: TextSpan(children: [
              TextSpan(
                text: '11,489',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  color: black,
                  fontSize: 40,
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.normal,
                ),
              ),
              TextSpan(
                text: '점',
                style: TextStyle(
                  fontFamily: 'NotoSansKR',
                  color: black,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                ),
              ),
            ]),
          ),
          SizedBox(height: 40),
          Divider(
            thickness: 14,
            color: grey_3,
          ),
          SizedBox(height: spacing_xxl),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Obx(() => controller.checkSort.value
                    ? createdSort()
                    : unCreatedSort()),
                SizedBox(width: 22),
                Obx(
                  () => controller.checkSort.value ? unLastSort() : lastSort(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  InkWell unLastSort() {
    return InkWell(
      borderRadius: BorderRadius.circular(50),
      onTap: () {
        controller.toggleSort(false);
      },
      child: Column(
        children: [
          Text(
            '과거순',
            style: TextStyle(
              fontFamily: 'NotoSansKR',
              color: grey_1,
              fontSize: 14,
              fontWeight: FontWeight.w700,
              fontStyle: FontStyle.normal,
            ),
          ),
          SizedBox(height: spacing_xxs),
          Container(width: 52, height: 1, color: Colors.transparent),
        ],
      ),
    );
  }

  InkWell lastSort() {
    return InkWell(
      borderRadius: BorderRadius.circular(50),
      onTap: () {},
      child: Column(
        children: [
          Text(
            '과거순',
            style: TextStyle(
              fontFamily: 'NotoSansKR',
              color: black,
              fontSize: 14,
              fontWeight: FontWeight.w700,
              fontStyle: FontStyle.normal,
            ),
          ),
          SizedBox(height: spacing_xxs),
          Container(
            width: 52,
            height: 1,
            color: Colors.black,
          )
        ],
      ),
    );
  }

  InkWell unCreatedSort() {
    return InkWell(
      borderRadius: BorderRadius.circular(50),
      onTap: () {
        controller.toggleSort(true);
      },
      child: Column(
        children: [
          Text(
            '최신순',
            style: TextStyle(
              fontFamily: 'NotoSansKR',
              color: grey_1,
              fontSize: 14,
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.normal,
            ),
          ),
          SizedBox(height: spacing_xxs),
          Container(
            width: 52,
            height: 1,
            color: Colors.transparent,
          )
        ],
      ),
    );
  }

  InkWell createdSort() {
    return InkWell(
      borderRadius: BorderRadius.circular(50),
      onTap: () {
        // controller.toggleSort(false);
      },
      child: Column(
        children: [
          Text(
            '최신순',
            style: TextStyle(
              fontFamily: 'NotoSansKR',
              color: black,
              fontSize: 14,
              fontWeight: FontWeight.w700,
              fontStyle: FontStyle.normal,
            ),
          ),
          SizedBox(height: spacing_xxs),
          Container(
            width: 52,
            height: 1,
            color: Colors.black,
          )
        ],
      ),
    );
  }

  Widget listView() {
    return ListView.builder(
      itemCount: 3,
      itemBuilder: (_, index) {
        return ListTile(
          leading: Text('aaaa'),
        );
      },
    );
  }
}
