import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:plinic2/src/config/environment.dart';
import 'package:plinic2/src/restclient/ChallengeClient.dart';

class CareMainController extends GetxController {
  static CareMainController get to => Get.find();
  Dio dio = Dio();
  Rx<ChallengeModel> challgeData = ChallengeModel().obs;

  RxBool isLoading = true.obs;
  RxBool isFabVisible = true.obs;

  Future<ChallengeModel> getFindIng() async {
    var client = ChallengeClient(dio);
    await client.findIng().then((value) {
      challgeData(value);
    });
    return challgeData.value;
    // await client.findIng().then((value) {
    //   challgeData(value);
    //   return value;
    // }).catchError((e) {
    //   return e;
    // });
    // return challgeData.value;
  }

  void changeFabVisible(bool value) {
    isFabVisible(value);
  }
}
