import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plinic2/constants.dart';
import 'package:plinic2/src/component/custom_appbar.dart';
import 'package:plinic2/src/model/sample_noticedata.dart';
import 'package:plinic2/src/pages/my/notice/notice_detail.dart';

class NoticePage extends StatelessWidget {
  const NoticePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppbar('공지사항'),
        backgroundColor: Colors.white,
        body: ListView.builder(
          itemCount: 4,
          itemBuilder: (_, index) {
            return CustomListTile(
              leadIcon: Icon(
                Icons.campaign,
                color: Colors.black,
              ),
              title: noticeData[index].title.toString(),
              tailDate: noticeData[index].date,
              noticeData: noticeData[index],
            );
          },
        ));
  }
}

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    Key? key,
    required this.leadIcon,
    required this.title,
    required this.tailDate,
    required this.noticeData,
  }) : super(key: key);

  final Icon? leadIcon;
  final String? title;
  final String? tailDate;
  final NoticeData noticeData;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Get.to(() => NoticeDetailPage(
              noticeData: noticeData,
            ),transition: Transition.native);
      },
      contentPadding:
          EdgeInsets.symmetric(horizontal: spacing_xl, vertical: spacing_xxs),
      shape: Border(bottom: BorderSide(color: grey_2, width: 0.5)),
      leading: leadIcon,
      trailing: Text(
        tailDate.toString(),
        style: TextStyle(
          fontFamily: 'NotoSansKR',
          color: grey_2,
          fontSize: 14,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
        ),
      ),
      title: Text(title.toString(),
          style: TextStyle(
            fontFamily: 'NotoSansKR',
            color: black,
            fontSize: 14,
            fontWeight: FontWeight.w700,
            fontStyle: FontStyle.normal,
          )),
    );
  }
}
