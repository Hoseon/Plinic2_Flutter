import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plinic2/src/model/person_model.dart';
import 'package:plinic2/src/repository/movie_repository.dart';

class PersonController extends GetxController {
  final MovieRepository _movieRepository = MovieRepository();
  final RxList<Person> _person = RxList<Person>();
  RxInt pageView = 1.obs;

  RxList<Person> get person => _person;
  final ScrollController scrollController = ScrollController();

  @override
  void onInit() async {
    super.onInit();
    // _event();
    var listPerson = await _movieRepository.loadMovies(pageView.toString());
    _person(listPerson);
  }

  @override
  void onClose() {
    print('클로즈됨 - 스크롤 컨트롤러');
    // scrollController.dispose();
    super.onClose();
  }

  @override
  void dispose() {
    print('디스포즈됨');
    super.dispose();
  }

  void _event() {
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        reload();
      }
    });
  }

  void reload() async {
    pageView++;
    var listUpdatePerson =
        await _movieRepository.loadMovies(pageView.toString());
    _person.addAll(listUpdatePerson);
  }
}
