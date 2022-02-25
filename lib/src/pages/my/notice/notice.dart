import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plinic2/constants.dart';
import 'package:plinic2/src/component/custom_appbar.dart';
import 'package:plinic2/src/component/loading.dart';
import 'package:plinic2/src/config/environment.dart';
import 'package:plinic2/src/model/sample_noticedata.dart';
import 'package:plinic2/src/pages/my/notice/notice_detail.dart';
import 'package:plinic2/src/restclient/NoticeClient.dart';

class NoticePage extends StatelessWidget {
  NoticePage({Key? key}) : super(key: key);
  Dio dio = Dio();

  @override
  Widget build(BuildContext context) {
    var client = NoticeClient(dio);
    return Scaffold(
        appBar: CustomAppbar('공지사항'),
        backgroundColor: Colors.white,
        body: FutureBuilder(
          future: client.getAllNotice(),
          builder:
              (BuildContext context, AsyncSnapshot<List<ScNotice>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return LoadingPage();
            }
            if (snapshot.hasData) {
              return ListView.builder(
                shrinkWrap: true,
                itemCount: snapshot.data!.length,
                itemBuilder: (_, index) {
                  return buildExpanded(context, snapshot.data![index]);
                },
              );
            }
            return LoadingPage();
          },
        ));
  }

  Widget buildExpanded(context, ScNotice scNotice) {
    return Theme(
      data: Theme.of(context).copyWith(
        dividerColor: Colors.transparent,
        unselectedWidgetColor: Colors.transparent,
      ),
      child: ExpansionTile(
        tilePadding:
            EdgeInsets.symmetric(horizontal: spacing_xl, vertical: spacing_s),
        // trailing: Column(
        //   children: [
        //     Icon(LineIcons.angleUp, size: 20),
        //   ],
        // ),
        backgroundColor: Colors.white,
        iconColor: grey_1,
        title: Column(
          children: [
            Row(
              children: [
                Text(scNotice.title!,
                    style: TextStyle(
                      fontFamily: 'NotoSans',
                      color: black,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    ))
              ],
            ),
            SizedBox(height: spacing_xs),
            Row(
              children: [
                // SizedBox(width: 12),
                Text(
                  scNotice.createdAt
                      .toString()
                      .substring(0, 10)
                      .replaceAll('-', '.'),
                  style: TextStyle(
                    fontFamily: 'NotoSans',
                    color: grey_1,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                  ),
                )
              ],
            ),
          ],
        ),
        children: [
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
          //   child: Divider(color: grey_2),
          // ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
            child: Row(
              children: [
                Text(scNotice.content!,
                    style: TextStyle(
                      fontFamily: 'NotoSans',
                      color: black,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      height: 1.63,
                    )),
              ],
            ),
          ),
          SizedBox(height: spacing_m),
        ],
      ),
    );
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
        Get.to(
            () => NoticeDetailPage(
                  noticeData: noticeData,
                ),
            transition: Transition.native);
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
