import 'package:dio/dio.dart';
import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plinic2/src/config/environment.dart';
import 'package:plinic2/src/restclient/RewardClient.dart';

class CareChallengeRewardController extends GetxController {
  static CareChallengeRewardController get to => Get.find();
  Dio dio = Dio();
  TextEditingController? toNameTextController;
  TextEditingController? address1TextController;
  TextEditingController? address2TextController;
  MaskedTextController? phoneTextController;
  TextEditingController? deliverMsgTextController;

  RxBool pushSaveButton = false.obs;

  @override
  void onInit() {
    super.onInit();
    toNameTextController = TextEditingController();
    address1TextController = TextEditingController();
    address2TextController = TextEditingController();
    phoneTextController = MaskedTextController(mask: '000-0000-0000');
    deliverMsgTextController = TextEditingController();
  }

  @override
  void onClose() {
    toNameTextController!.dispose();
    address1TextController!.dispose();
    address2TextController!.dispose();
    phoneTextController!.dispose();
    deliverMsgTextController!.dispose();
    super.onClose();
  }

  Future<RewardModel> saveReward(RewardModel body) async {
    final client = RewardClient(dio);
    var result = await client.saveReward(body);
    if (result.uid!.isEmpty) {
      throw Exception('보상 저장 실패');
    }
    return result;
  }

  void pushButton(bool value) {
    pushSaveButton(value);
  }
}
