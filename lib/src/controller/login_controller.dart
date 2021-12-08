import 'package:get/get.dart';

class LoginController extends GetxController {
  static LoginController get to => Get.find();
  RxBool isLoading = false.obs;

  void toggleIsLoading() {
    isLoading(!isLoading.value);
  }

  void updateIsLoading(bool value) {
    isLoading(value);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    isLoading(false);
    print('로그인 컨트롤러 디스포즈 됨');
  }
}
