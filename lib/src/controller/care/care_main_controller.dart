import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:plinic2/src/config/environment.dart';
import 'package:plinic2/src/controller/profile_controller.dart';
import 'package:plinic2/src/restclient/ChallengeClient.dart';
import 'package:plinic2/src/restclient/UserClient.dart';

class CareMainController extends GetxController {
  CareMainController({this.uid});
  String? uid;
  static CareMainController get to => Get.find();
  Dio dio = Dio();
  Rx<ChallengeModel> challgeData = ChallengeModel().obs;
  Rx<GetUser> getUserData = GetUser().obs;

  RxBool isLoading = true.obs;
  RxBool isFabVisible = true.obs;

  @override
  void onInit() async {
    // if (uid != null) {
    //   var client = UserClient(dio);
    //   await client.getUser(uid!).then((value) {
    //     getUserData(value);
    //     isLoading(false);
    //   }).catchError((Object obj) {
    //     if ((obj as DioError).response!.statusCode == 404) {
    //       getUserData(null);
    //       isLoading(false);
    //     }
    //   });
    // }
    super.onInit();
  }

  Future<GetUser> getFindUser(String uid) async {
    var client = UserClient(dio);
    await client.getUser(uid).then((value) {
      getUserData(value);
      isLoading(false);
    }).catchError((Object obj) {
      if ((obj as DioError).response!.statusCode == 404) {
        isLoading(false);
        return null;
      }
    });
    return getUserData.value;
  }

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
