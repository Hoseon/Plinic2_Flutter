import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plinic2/constants.dart';
import 'package:plinic2/src/component/custom_appbar.dart';

class VersionPage extends StatelessWidget {
  const VersionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar('버전정보'),
      body: Column(
        children: [
          SizedBox(height: Get.mediaQuery.size.height * 0.198),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '현재버전   :    1.1v',
                style: TextStyle(
                  fontFamily: 'NotoSansKR',
                  color: primary_dark,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.normal,
                ),
              ),
            ],
          ),
          SizedBox(height: 11),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '최신버전   :    1.2v',
                style: TextStyle(
                  fontFamily: 'NotoSansKR',
                  color: primary_dark,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.normal,
                ),
              ),
            ],
          ),
          SizedBox(
            height: spacing_xxl,
          ),
          ElevatedButton(
            style: ButtonStyle(
                elevation: MaterialStateProperty.all(0.0),
                backgroundColor: MaterialStateProperty.all(primary_dark)),
            onPressed: () {},
            child: Text('업데이트 바로가기',
                style: TextStyle(
                  fontFamily: 'NotoSans',
                  color: white,
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.normal,
                )),
          )
        ],
      ),
    );
  }
}
