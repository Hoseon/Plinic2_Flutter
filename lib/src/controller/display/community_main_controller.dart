import 'package:get/get.dart';
import 'package:plinic2/src/model/display/magazine_model.dart';
import 'package:plinic2/src/repository/magazine_repository.dart';

class CommunityMainController extends GetxController {
  final MagazineRepository _magazineRepository = MagazineRepository();
  Rx<MagazineModel> mainMagazine = MagazineModel().obs;

  static CommunityMainController get to => Get.find();

  @override
  void onInit() async {
    super.onInit();
    var listMagazine = await _magazineRepository.getMainMagazine();
    mainMagazine(listMagazine);
  }
}
