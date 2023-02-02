import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:plinic2/src/config/environment.dart';
import 'package:plinic2/src/restclient/ChallengeClient.dart';

class CareChallDetailController extends GetxController {
  static CareChallDetailController get to => Get.find();

  RxBool isLoading = true.obs; //로딩
  RxBool more = false.obs; //상품 이미지 더보기
  Dio dio = Dio();
  Rx<ChallengeModel> data = ChallengeModel().obs;

  Future<ChallengeModel> findOne(String id) async {
    var client = ChallengeClient(dio);
    await client.findOne(id).then((value) {
      isLoading(false);
      data(value);
    }).catchError((e) {
      isLoading(false);
      print(e);
    });
    return data.value;
  }

  void toggleMore() {
    more(!more.value);
  }
}
