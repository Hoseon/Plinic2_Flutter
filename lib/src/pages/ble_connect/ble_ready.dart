import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plinic2/constants.dart';
import 'package:plinic2/src/pages/ble_connect/ble_care.dart';

class BleReadyPage extends StatefulWidget {
  const BleReadyPage({Key? key}) : super(key: key);

  @override
  State<BleReadyPage> createState() => _BleReadyPageState();
}

class _BleReadyPageState extends State<BleReadyPage> {
  bool completeLoad = false;
  bool completeConn = false;

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () {
      setState(() {
        completeLoad = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return completeConn ? buildScaffold2() : buildScaffold();
  }

  Scaffold buildScaffold() {
    return Scaffold(
      backgroundColor: black,
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Image.asset('assets/images/bleutooth.png'),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '디바이스 연결을 해볼까요? ',
                    style: TextStyle(
                      fontFamily: 'NotoSansKR',
                      color: grey_2,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              )
            ],
          ),
          SizedBox(height: spacing_xs),
          completeLoad
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '먼저 아래에 나오는 기기명과\n보유하신 기기가 동일한지 확인해주세요.',
                      style: TextStyle(
                        fontFamily: 'NotoSansKR',
                        color: grey_2,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '연결 준비 중 ...',
                      style: TextStyle(
                        fontFamily: 'NotoSansKR',
                        color: grey_2,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
          Expanded(child: SizedBox(height: 1)),
          if (!completeLoad)
            CircularProgressIndicator(
              color: primary,
            ),
          if (completeLoad)
            Text('Plinic_Single',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  color: white,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.normal,
                )),
          if (completeLoad) SizedBox(height: spacing_m),
          if (completeLoad)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 47),
              child: ElevatedButton(
                style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(
                        Size(Get.mediaQuery.size.width, 47)),
                    backgroundColor: MaterialStateProperty.all(primary)),
                onPressed: () {
                  setState(() {
                    completeConn = true;
                  });
                },
                child: Text('연동 시작하기',
                    style: TextStyle(
                      fontFamily: 'NotoSansKR',
                      color: white,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal,
                    )),
              ),
            ),
          if (completeLoad) SizedBox(height: 48),
          if (completeLoad)
            TextButton(
              onPressed: () {
                Get.back();
              },
              child: Text(
                '취소',
                style: TextStyle(
                  fontFamily: 'NotoSansKR',
                  color: primary,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                ),
              ),
            ),
          completeLoad ? SizedBox(height: 41) : SizedBox(height: 146)
        ],
      ),
    );
  }

  Scaffold buildScaffold2() {
    return Scaffold(
      backgroundColor: black,
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Image.asset('assets/images/bleutooth.png'),
              Text('기기와 연결이 되었습니다.',
                  style: TextStyle(
                    fontFamily: 'NotoSansKR',
                    color: grey_2,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal,
                  ))
            ],
          ),
          SizedBox(height: spacing_xs),
          completeLoad
              ? Text(
                  '케어를 시작하시려면\n아래 버튼을 눌러주세요.',
                  style: TextStyle(
                    fontFamily: 'NotoSansKR',
                    color: grey_2,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                  ),
                  textAlign: TextAlign.center,
                )
              : Text(
                  '연결 준비 중 ...',
                  style: TextStyle(
                    fontFamily: 'NotoSansKR',
                    color: grey_2,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                  ),
                  textAlign: TextAlign.center,
                ),
          Expanded(child: SizedBox(height: 1)),
          if (completeLoad) SizedBox(height: spacing_m),
          if (completeLoad)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 47),
              child: ElevatedButton(
                style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(
                        Size(Get.mediaQuery.size.width, 47)),
                    backgroundColor: MaterialStateProperty.all(primary)),
                onPressed: () {
                  Get.to(() => BleCarePage(), transition: Transition.native);
                },
                child: Text('케어 시작하기',
                    style: TextStyle(
                      fontFamily: 'NotoSansKR',
                      color: white,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal,
                    )),
              ),
            ),
          if (completeLoad) SizedBox(height: 48),
          if (completeLoad)
            TextButton(
              onPressed: () {
                Get.back();
              },
              child: Text(
                '취소',
                style: TextStyle(
                  fontFamily: 'NotoSansKR',
                  color: primary,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                ),
              ),
            ),
          completeLoad ? SizedBox(height: 41) : SizedBox(height: 146)
        ],
      ),
    );
  }

  Widget buildReadyButton() {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [],
    );
  }
}
