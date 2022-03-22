import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:plinic2/src/restclient/UserClient.dart';

// enum RouteName { Home, Care, Community, Shop, Temp }
enum RouteName { Care, My, Temp }

class TabsController extends GetxService {
  Rx<GetUser> getUserData = GetUser().obs;
  RxBool isLoading = true.obs;
  Dio dio = Dio();

  //앱이 꺼지기 전까지 서비스가 유지되어야 하기 때문에 GetxService로 했다
  static TabsController get to => Get.find();
  RxInt currentIndex = 0.obs;

  @override
  void onInit() async {
    super.onInit();
  }

  Future<GetUser> getFindUser(String uid) async {
    var client = UserClient(dio);
    await client.getUser(uid).then((value) {
      getUserData(value);
      isLoading(false);
    }).catchError((Object obj) {
      if ((obj as DioError).response!.statusCode == 404) {
        getUserData(null);
        isLoading(false);
      }
    });
    return getUserData.value;
  }

  void changePageIndex(int index) {
    currentIndex(index);
  }
}
