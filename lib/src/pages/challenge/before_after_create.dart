import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:plinic2/constants.dart';
import 'package:plinic2/src/component/custom_appbar.dart';
import 'package:plinic2/src/component/plinic_dialog_two_button.dart';
import 'package:plinic2/src/controller/person_detail_controller.dart';
import 'package:plinic2/src/pages/review/review_edit.dart';

class BeforeAfterCreatePage extends StatelessWidget {
  const BeforeAfterCreatePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar('게시물등록'),
      backgroundColor: white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: spacing_xl),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
              child: Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  '카테고리',
                  style: TextStyle(
                    fontFamily: 'NotoSansKR',
                    color: black,
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal,
                    height: 1.64,
                  ),
                ),
              ),
            ),
            SizedBox(height: 9),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
              child: Container(
                height: 48,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(color: grey_2)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: InkWell(
                    onTap: () {
                      showActionSheet(context);
                    },
                    splashColor: grey_2,
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            '게시물 카테고리를 선택해주세요.',
                            style: TextStyle(
                              fontFamily: 'NotoSansKR',
                              color: textfields,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                            ),
                          ),
                        ),
                        Icon(LineIcons.angleDown, color: grey_2, size: 20)
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: spacing_xl),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
              child: Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  '제목',
                  style: TextStyle(
                    fontFamily: 'NotoSansKR',
                    color: black,
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal,
                    height: 1.64,
                  ),
                ),
              ),
            ),
            SizedBox(height: 9),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
              child: Container(
                height: 48,
                child: TextField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10.0),
                    hintText: '제목을 입력해주세요',
                    hintStyle: TextStyle(
                      fontFamily: 'NotoSansKR',
                      color: textfields,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: grey_3),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: grey_2),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: spacing_xl),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
              child: Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  '내용',
                  style: TextStyle(
                    fontFamily: 'NotoSansKR',
                    color: black,
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal,
                    height: 1.64,
                  ),
                ),
              ),
            ),
            SizedBox(height: 9),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
              child: Container(
                height: 200,
                child: TextField(
                  maxLines: 200,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10.0),
                    hintText:
                        '내용을 입력해주세요\n\n※부적절한 내용(욕설,비방,논란의 소지가 있거나 도배,광고성 글) 에 대해선 관리자에 의하여 삭제 될 수 있습니다.',
                    hintStyle: TextStyle(
                      fontFamily: 'NotoSansKR',
                      color: textfields,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: grey_3),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: grey_2),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: spacing_xl),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
              child: Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  '사진',
                  style: TextStyle(
                    fontFamily: 'NotoSansKR',
                    color: black,
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal,
                    height: 1.64,
                  ),
                ),
              ),
            ),
            SizedBox(height: 9),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
              child: Container(
                height: 48,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(color: grey_2)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: InkWell(
                    onTap: () {
                      showActionSheet(context);
                    },
                    splashColor: grey_2,
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            '사진을 등록해보세요.',
                            style: TextStyle(
                              fontFamily: 'NotoSansKR',
                              color: textfields,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                            ),
                          ),
                        ),
                        Icon(LineIcons.angleRight, color: grey_2, size: 20)
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 53),
            ConstrainedBox(
              constraints: BoxConstraints.tightFor(
                  width: Get.mediaQuery.size.width, height: 60),
              child: ElevatedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(borderRadius: BorderRadius.zero)),
                  elevation: MaterialStateProperty.all(0.0),
                  backgroundColor: MaterialStateProperty.all(primaryColor),
                ),
                onPressed: () {
                  Get.back();
                },
                child: Text('등록',
                    style: TextStyle(
                      fontFamily: 'NotoSansKR',
                      color: Color(0xffffffff),
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal,
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showActionSheet(BuildContext context) {
    Get.put<PersonDetailController>(PersonDetailController());
    Get.bottomSheet(
      Container(
          height: 320,
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
                      Icon(LineIcons.check, size: 24),
                      SizedBox(width: spacing_xl),
                      Text('비포&애프터',
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
                      Icon(LineIcons.check, size: 24),
                      SizedBox(width: spacing_xl),
                      Text('뷰티 다이어리',
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
                      Icon(LineIcons.check, size: 24),
                      SizedBox(width: spacing_xl),
                      Text('일상',
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
                      Icon(LineIcons.check, size: 24),
                      SizedBox(width: spacing_xl),
                      Text('기타',
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
