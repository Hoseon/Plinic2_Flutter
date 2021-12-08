import 'package:get/get.dart';
import 'package:plinic2/src/model/display/magazine_model.dart';
import 'package:plinic2/src/repository/magazine_repository.dart';

class MagazineController extends GetxController {
  final MagazineRepository _magazineRepository = MagazineRepository();
  final RxList<MagazineModel> _magazineList = RxList<MagazineModel>();
  RxList<Map<String, dynamic>> _getMagazineList =
      RxList<Map<String, dynamic>>();
  RxList<Map<String, dynamic>> get getMagazineList => _getMagazineList;

  static MagazineController get to => Get.find();

  @override
  void onInit() async {
    super.onInit();
    var listMagazine = await _magazineRepository.getAllMagazine();
    _getMagazineList(listMagazine);
  }
}
