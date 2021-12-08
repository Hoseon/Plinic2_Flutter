import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:plinic2/constants.dart';

class NetworkController extends GetxService {
  RxInt connectionStatus = 0.obs;
  final Connectivity _connectivity = Connectivity();
  StreamSubscription<ConnectivityResult>? _connectivitySubscription;

  @override
  void onInit() {
    super.onInit();
    initConnectivity();
    _connectivitySubscription = _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  Future<void> initConnectivity() async {
    ConnectivityResult? result;
    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      print(e.toString());
    }
    return _updateConnectionStatus(result!);
  }

  dynamic _updateConnectionStatus(ConnectivityResult result) {
    switch (result) {
      case ConnectivityResult.wifi:
        connectionStatus.value = 1;
        break;
      case ConnectivityResult.mobile:
        connectionStatus.value = 2;
        break;
      case ConnectivityResult.none:
        connectionStatus.value = 0;
        showConnectDialog();
        break;
      default: showConnectDialog();
    }
  }

  void showConnectDialog() {
    Get.dialog(
       AlertDialog(
        backgroundColor: Colors.white,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('알림',
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
                  '네트워크에 연결되어 있지 않습니다.\n\n네트워크 연결 상태 확인 후,\n다시 시도해주세요.',
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
                    backgroundColor: MaterialStateProperty.all(primaryColor),
                  ),
                  onPressed: () {
                    initConnectivity();
                    Get.back();
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
            )
          ],
        ),
      ),
      barrierDismissible: false
    );
  }

  @override
  void onClose() {
    super.onClose();
    _connectivitySubscription!.cancel();
  }
}
