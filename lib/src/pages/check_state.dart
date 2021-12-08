import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plinic2/constants.dart';
import 'package:plinic2/src/controller/network_controller.dart';
import 'package:plinic2/src/pages/check_permission.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';

class CheckState extends GetView<NetworkController> {
  CheckState({Key? key}) : super(key: key);
  bool isConnect = false;
  var connectivityResult;
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.connectionStatus.value != 0
          ? CheckPermission()
          : Scaffold(
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.network_check, size: 100),
                    SizedBox(height: 20),
                    Text(
                      '네트워크에 접속할 수 없습니다.',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        color: Color(0xff000000),
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      '네트워크 연결 상태를 확인해주세요.',
                      style: TextStyle(
                        fontFamily: 'NotoSansKR',
                        color: Color(0xff000000),
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                    SizedBox(height: 50),
                    ConstrainedBox(
                      constraints: BoxConstraints.tightFor(
                          width: Get.mediaQuery.size.width * 0.5, height: 42),
                      // ConstrainedBox(
                      //     constraints: BoxConstraints.tightFor(
                      //         width: MediaQuery.of(context).size.width * 0.9,
                      //         height: 44),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          elevation: MaterialStateProperty.all(0.0),
                          backgroundColor:
                              MaterialStateProperty.all(primaryColor),
                        ),
                        onPressed: () {
                          Get.find<NetworkController>().initConnectivity();
                        },
                        child: Text('재시도',
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
            ),
    );
  }

  Future<void> showDialogOneButton(
      BuildContext context, String title, String content) async {
    await showAnimatedDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          // return Dialog(
          //   backgroundColor: Colors.deepPurple,
          //   child: Text('qqq'),
          // );// 커스텀 다이얼 로그로 만들�� 있다.
          return AlertDialog(
            backgroundColor: Colors.white,
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(title,
                    style: const TextStyle(
                        color: Color(0xff000000),
                        fontWeight: FontWeight.w700,
                        fontFamily: 'NotoSansKR',
                        fontStyle: FontStyle.normal,
                        fontSize: 20.0),
                    textAlign: TextAlign.center),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      content,
                      style: TextStyle(
                        fontFamily: 'NotoSansKR',
                        color: Colors.grey,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      ),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
                SizedBox(height: 20),
                Center(
                  child: ConstrainedBox(
                    constraints: BoxConstraints.tightFor(
                        width: Get.mediaQuery.size.width, height: 42),
                    // ConstrainedBox(
                    //     constraints: BoxConstraints.tightFor(
                    //         width: MediaQuery.of(context).size.width * 0.9,
                    //         height: 44),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        elevation: MaterialStateProperty.all(0.0),
                        backgroundColor:
                            MaterialStateProperty.all(primaryColor),
                      ),
                      onPressed: () {
                        Get.back();
                      },
                      child: Text('확인',
                          style: TextStyle(
                            fontFamily: 'NotoSansKR',
                            color: Color(0xffffffff),
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            fontStyle: FontStyle.normal,
                          )),
                    ),
                  ),
                )
              ],
            ),
          );
        },
        animationType: DialogTransitionType.slideFromBottomFade,
        curve: Curves.fastOutSlowIn,
        duration: Duration(seconds: 1),
        // barrierColor: Colors.black
        alignment: Alignment.topCenter);
  }

  Future<void> showDialogTwoButton(
      BuildContext context, String title, String content) async {
    await showAnimatedDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          // return Dialog(
          //   backgroundColor: Colors.deepPurple,
          //   child: Text('qqq'),
          // );// 커스텀 다이얼 로그로 만들수 있다.
          return AlertDialog(
            backgroundColor: Colors.white,
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(title,
                    style: const TextStyle(
                        color: Color(0xff000000),
                        fontWeight: FontWeight.w700,
                        fontFamily: 'NotoSansKR',
                        fontStyle: FontStyle.normal,
                        fontSize: 20.0),
                    textAlign: TextAlign.center),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      content,
                      style: TextStyle(
                        fontFamily: 'NotoSansKR',
                        color: Colors.grey,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      ),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
                SizedBox(height: 20),
                Center(
                  child: ConstrainedBox(
                    constraints: BoxConstraints.tightFor(
                        width: Get.mediaQuery.size.width, height: 42),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        elevation: MaterialStateProperty.all(0.0),
                        backgroundColor:
                            MaterialStateProperty.all(primaryColor),
                      ),
                      onPressed: () {
                        Get.back();
                      },
                      child: Text('지금 업데이트',
                          style: TextStyle(
                            fontFamily: 'NotoSansKR',
                            color: Color(0xffffffff),
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            fontStyle: FontStyle.normal,
                          )),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Center(
                  child: ConstrainedBox(
                    constraints: BoxConstraints.tightFor(
                        width: Get.mediaQuery.size.width, height: 42),
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Color(0x42566789)),
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          elevation: MaterialStateProperty.all(0.0),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.white),
                        ),
                        onPressed: () {
                          Get.back();
                        },
                        child: Text('다음에 할께요',
                            style: TextStyle(
                              fontFamily: 'NotoSansKR',
                              color: Color(0x80151920),
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              fontStyle: FontStyle.normal,
                            )),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
        animationType: DialogTransitionType.slideFromBottomFade,
        curve: Curves.fastOutSlowIn,
        duration: Duration(seconds: 1),
        // barrierColor: Colors.black
        alignment: Alignment.topCenter);
  }
}
