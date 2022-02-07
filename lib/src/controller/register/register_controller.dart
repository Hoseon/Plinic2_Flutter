import 'package:get/get.dart';
import 'package:plinic2/src/controller/profile_controller.dart';
import 'package:plinic2/src/repository/register/register_repository.dart';

class RegisterController extends GetxController {
  static RegisterController get to => Get.find();
  final RegisterRepository _registerRepository = RegisterRepository();
  final RxString _isUser = ''.obs;
  final RxBool isRegister = false.obs;

  RxString get isUser => _isUser;

  @override
  void onInit() async {
    super.onInit();
    var userData = ProfileController.to.myProfile.value;
    userData.birthDay = ProfileController.to.birthDay.value;
    if (ProfileController.to.isRegister.value == false) {
      ProfileController.to.isRegisterComplete(true);
      await _registerRepository
          .registerUser(
              userData, //사용자 회원정보
              ProfileController.to.userAgree, //사용자 약관정보
              ProfileController.to.pushToken.value.toString() //사용자 푸시토큰 정보
              )
          .then((value) => {isUser(value)});
    }
  }
}
