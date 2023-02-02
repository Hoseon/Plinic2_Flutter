import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:plinic2/src/repository/findId_repository.dart';
import 'package:plinic2/src/restclient/UserClient.dart';

class FindIdController extends GetxController {
  FindIdController({required this.phone});

  static FindIdController get to => Get.find();

  final FindIdRepository _findIdRepository = FindIdRepository();
  RxBool isFindPhone = false.obs;
  String phone;
  RxString updatephone = ''.obs;
  RxMap<String, dynamic> findResult = RxMap();
  Rx<PhoneAuth> phoneAuth = PhoneAuth().obs;
  Dio dio = Dio();
  RxBool isLoading = true.obs;

  @override
  void onInit() async {
    super.onInit();
    var client = UserClient(dio);
    await client.userPhoneAuthCheckFindId(phone).then((value) {
      isLoading(false);
      phoneAuth(value);
    }).catchError((Object obj) {
      if ((obj as DioError).response!.statusCode == 404) {
        phoneAuth(null);
        isLoading(false);
      }
    });
  }

  // void searchPhone() async {
  //   isFindPhone = await _findIdRepository.findUserByPhone('01036020852');
  // }
}
