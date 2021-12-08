import 'package:flutter/material.dart';
import 'package:plinic2/constants.dart';
import 'package:plinic2/src/component/custom_appbar.dart';
import 'package:plinic2/src/model/sample_noticedata.dart';

class NoticeDetailPage extends StatelessWidget {
  const NoticeDetailPage({
    Key? key,
    required this.noticeData,
  }) : super(key: key);
  final NoticeData? noticeData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppbar('공지사항'),
        body: Column(
          children: [
            _buildListTile(),
            SizedBox(height: spacing_l),
            Text(
              '시스템 정기 점검 안내',
              style: TextStyle(
                fontFamily: 'NotoSansKR',
                color: black,
                fontSize: 14,
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.normal,
              ),
            ),
            SizedBox(height: spacing_l),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
              child: Row(
                children: [
                  Text(
                    '점검 일시 : 2021.07.20 ~ 2021.07.21',
                    style: TextStyle(
                      fontFamily: 'NotoSansKR',
                      color: black,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: spacing_xs),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
              child: Row(
                children: [
                  Text(
                    '( 점검 시간은 당사의 사정에 따라 다소 변동 될 수\n 있습니다.)',
                    style: TextStyle(
                      fontFamily: 'NotoSansKR',
                      color: grey_1,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: spacing_s),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
              child: Row(
                children: [
                  Text(
                    '시스템 점검 기간동안 서비스 이용이 다소 불편하실 수 \n있습니다. 너그라운 양해 부탁드립니다.',
                    style: TextStyle(
                      fontFamily: 'NotoSansKR',
                      color: Color(0xff000000),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: spacing_xs),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
              child: Row(
                children: [
                  Text(
                    '감사합니다.',
                    style: TextStyle(
                      fontFamily: 'NotoSansKR',
                      color: Color(0xff000000),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                ],
              ),
            )
          ],
        )
        // Text(noticeData!.title.toString()),
        );
  }

  ListTile _buildListTile() {
    return ListTile(
      contentPadding:
          EdgeInsets.symmetric(horizontal: spacing_xl, vertical: spacing_xxs),
      shape: Border(bottom: BorderSide(color: grey_2, width: 0.5)),
      leading: Icon(Icons.campaign, color: Colors.black),
      title: Text(
        noticeData!.title.toString(),
        style: TextStyle(
          fontFamily: 'NotoSansKR',
          color: black,
          fontSize: 14,
          fontWeight: FontWeight.w700,
          fontStyle: FontStyle.normal,
        ),
      ),
      trailing: Text(
        noticeData!.date.toString(),
        style: TextStyle(
          fontFamily: 'NotoSansKR',
          color: grey_2,
          fontSize: 14,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
        ),
      ),
    );
  }
}
