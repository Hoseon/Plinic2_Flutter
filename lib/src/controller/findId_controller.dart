import 'package:get/get.dart';
import 'package:plinic2/src/repository/findId_repository.dart';

class FindIdController extends GetxController {
  FindIdController({required this.phone});

  static FindIdController get to => Get.find();

  final FindIdRepository _findIdRepository = FindIdRepository();
  RxBool isFindPhone = false.obs;
  String phone;
  RxString updatephone = ''.obs;
  RxMap<String, dynamic> findResult = RxMap();

  @override
  void onInit() async {
    super.onInit();
    var mapResult;
    mapResult = await _findIdRepository.findUserByPhone(phone);
    findResult(mapResult);
  }

  // void searchPhone() async {
  //   isFindPhone = await _findIdRepository.findUserByPhone('01036020852');
  // }
}
