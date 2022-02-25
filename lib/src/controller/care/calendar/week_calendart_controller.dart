import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:plinic2/src/controller/profile_controller.dart';
import 'package:plinic2/src/restclient/DeviceCountClient.dart';

class WeekCalendarController extends GetxController {
  static WeekCalendarController get to => Get.find();
  RxBool isLoading = true.obs;

  RxList<DeviceCountModel> deviceCountModel = RxList<DeviceCountModel>();
  Dio dio = Dio();

  @override
  void onInit() async {
    super.onInit();
    await getCalendarWeek();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> getCalendarWeek() async {
    var client = DeviceCountClient(dio);
    await client
        .getCalendarCountData(ProfileController.to.myProfile.value.uid)
        .then((value) {
      deviceCountModel(value);
    }).catchError((e) {
      return e;
    });
  }
}
