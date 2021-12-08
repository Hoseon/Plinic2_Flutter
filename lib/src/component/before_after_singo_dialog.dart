import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plinic2/constants.dart';

class BeforeAfterSingoDialog extends StatelessWidget {
  const BeforeAfterSingoDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(child: showDialogTwoButton());
  }

  Widget showDialogTwoButton() {
    return AlertDialog(
      backgroundColor: Colors.white,
      title: Container(
        height: 448,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('신고',
                style: TextStyle(
                  fontFamily: 'NotoSansKR',
                  color: Color(0xff000000),
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.normal,
                )),
            SizedBox(height: spacing_xl),
            Text('※신고내용이 올바르지 않은 경우 서비스 제재를 받을 수 있는 점 유의 해주세요.',
                style: TextStyle(
                  fontFamily: 'NotoSansKR',
                  color: grey_1,
                  fontSize: 12,
                  height: 1.63,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                )),
            SizedBox(height: spacing_xs),
            Container(
              height: 220,
              color: grey_2,
              child: TextField(
                maxLines: 100,
                decoration: InputDecoration(
                    hintText: '10자 이상 500자 이하로 입력 가능.',
                    hintStyle: TextStyle(
                      fontFamily: 'NotoSansKR',
                      color: textfields,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: grey_3),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: grey_2))),
              ),
            ),
            SizedBox(height: spacing_m),
            ConstrainedBox(
              constraints: BoxConstraints.tightFor(
                  width: Get.mediaQuery.size.width, height: 42),
              child: ElevatedButton(
                style: ButtonStyle(
                  // shape: MaterialStateProperty.all(
                  //     RoundedRectangleBorder(borderRadius: BorderRadius.zero)),
                  elevation: MaterialStateProperty.all(0.0),
                  backgroundColor: MaterialStateProperty.all(primaryColor),
                ),
                onPressed: () {},
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
            SizedBox(height: spacing_m),
            ConstrainedBox(
              constraints: BoxConstraints.tightFor(
                  width: Get.mediaQuery.size.width, height: 42),
              child: ElevatedButton(
                style: ButtonStyle(
                  side: MaterialStateProperty.all(BorderSide(color: grey_2)),
                  // shape: MaterialStateProperty.all(
                  //     RoundedRectangleBorder(borderRadius: BorderRadius.zero)),
                  elevation: MaterialStateProperty.all(0.0),
                  backgroundColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                    if (states.contains(MaterialState.pressed)) {
                      return Colors.grey.shade200;
                    }
                    return Colors.white;
                  }),
                ),
                onPressed: () {
                  Get.back();
                },
                child: Text('취소',
                    style: TextStyle(
                      fontFamily: 'NotoSansKR',
                      color: grey_2,
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
}
