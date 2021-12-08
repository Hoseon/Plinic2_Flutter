import 'package:get/get.dart';
import 'package:plinic2/src/repository/movie_repository.dart';

class PersonDetailController extends GetxController {

  final MovieRepository _movieRepository = MovieRepository();
  final String? id;
  final RxMap<String, dynamic> _detail2 = RxMap();

  RxMap<String, dynamic> get personDetail => _detail2;
  PersonDetailController(
    {this.id}
  );

  @override
  void onInit() async {
    super.onInit();
    var listPerson = await _movieRepository.getDetail(id.toString());
    _detail2(listPerson);
    print('aaa');
  }
}