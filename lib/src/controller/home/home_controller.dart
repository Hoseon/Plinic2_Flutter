import 'package:get/get.dart';
import 'package:plinic2/src/controller/profile_controller.dart';

class HomeController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    //홈컨트롤러에 진입하게 되면은 무조건 사용자의 푸시 정보, 마지막 로그인 일시를 저장한다.
    print(ProfileController.to.pushToken.value);
    print(ProfileController.to.myProfile.value.uid);
    print(ProfileController.to.myProfile.value.email);
  }
}
