import 'package:get/get.dart';
import 'package:plinic2/src/model/tv_model.dart';
import 'package:plinic2/src/repository/tv_repository.dart';

class TvController extends GetxController {

  final TvRepository _tvRepository = TvRepository();
  final RxList<Tv> _tvshow = RxList<Tv>();

  RxList<Tv> get tvShow => _tvshow;

  @override
  void onInit() async {
    super.onInit();
    var listTvShow = await _tvRepository.loadTv();
    _tvshow(listTvShow);
  }

  void shopBagClick(index, isClick) {
    _tvshow[index].isClick = isClick;
    _tvshow.refresh();
  }

  void listDelete(index) {
    _tvshow.removeAt(index);
    _tvshow.refresh();
  }



}