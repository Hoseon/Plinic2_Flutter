import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:plinic2/src/config/environment.dart';
import 'package:plinic2/src/restclient/ChallengeClient.dart';

class MonthlyCareController extends GetxController {
  static MonthlyCareController get to => Get.find();

  Rx<ChallengeModel> challData = ChallengeModel().obs;
  Rx<ChallengeModel> challNextData = ChallengeModel().obs;

  RxBool isLoading = true.obs; //월간케어 넥스트 로딩
  RxBool isNextLoading = true.obs; //월간케어 넥스트 로딩

  Dio dio = Dio();

  Future<ChallengeModel> getFindIng() async {
    var client = ChallengeClient(dio);

    await client.findIng().then((value) {
      isLoading(false);
      challData(value);
    }).catchError((e) {
      print(e);
      isLoading(false);
    });
    return challData.value;
  }

  Future<ChallengeModel> getFindNext() async {
    var client = ChallengeClient(dio);
    await client.findEsti().then((value) {
      isNextLoading(false);
      return challNextData(value);
    }).catchError((e) {
      isNextLoading(false);
      return challNextData.value;
    });
    isNextLoading(false);
    return challNextData.value;

    // var findResult = await client.findEsti();
    // if (findResult.id != null) {
    //   isNextLoading(false);
    //   challNextData(findResult);
    // }
    // isNextLoading(false);
    // return challNextData.value;
  }
}
