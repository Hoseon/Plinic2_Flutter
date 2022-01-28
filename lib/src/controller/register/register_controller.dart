import 'package:get/get.dart';
import 'package:plinic2/src/controller/profile_controller.dart';
import 'package:plinic2/src/repository/register/register_repository.dart';

class RegisterController extends GetxController {
  static RegisterController get to => Get.find();
  final RegisterRepository _registerRepository = RegisterRepository();
  final RxString _isUser = ''.obs;

  RxString get isUser => _isUser;

  @override
  void onInit() async {
    super.onInit();
    // _agree(agree);
    var email = Get.find<ProfileController>().myProfile.value.email.toString();
    print(email);
    var userData = Get.find<ProfileController>().myProfile.value;
    var result = await _registerRepository.registerUser(
        userData, ProfileController.to.userAgree);
    _isUser(result);
  }
}
