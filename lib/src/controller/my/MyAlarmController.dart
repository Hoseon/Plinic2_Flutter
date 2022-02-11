import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:plinic2/src/controller/profile_controller.dart';
import 'package:plinic2/src/restclient/UserClient.dart';

class MyAlarmController extends GetxController {
  static MyAlarmController get to => Get.find();
  final String? uid;
  MyAlarmController({this.uid}); //생성자 초기화

  RxBool pushYN = false.obs; //서비스 알림 상태
  RxBool marketYN = false.obs;
  Rx<UserPush> pushData = UserPush().obs; //서비스 알림 상태 데이터
  Rx<UserPush> marketData = UserPush().obs; //마케팅 알림 상태 데이터
  Dio dio = Dio();

  @override
  void onInit() async {
    super.onInit();
    var client = UserClient(dio);

    var pushResult = await client
        .getUserNormalPush(ProfileController.to.myProfile.value.uid!);
    var marketResult = await client
        .getUserMarketingPush(ProfileController.to.myProfile.value.uid!);

    //사용자 알람 정보 데이터 저장 RX obx에...
    pushData(pushResult);
    pushYN(pushResult.useYN);
    marketData(marketResult);
    marketYN(marketResult.useYN);
  }

  void updateUserPush(bool value) async {
    //서비스 알림 설정 변경
    var client = UserClient(dio);

    var saveResult = await client.updateNormalPush(
        ProfileController.to.myProfile.value.uid.toString(), value);

    pushYN(saveResult.useYN);
  }

  void updateMarketUserPush(bool value) async {
    //마케팅 알림 설정 변경
    var client = UserClient(dio);

    var saveResult2 = await client.updateMarketingPush(
        ProfileController.to.myProfile.value.uid.toString(), value);

    marketYN(saveResult2.useYN);
  }
}
