import 'dart:convert';

import 'package:plinic2/src/model/person_model.dart';
import 'package:http/http.dart' as http;

class MovieRepository {
  Future<List<Person>> loadMovies(String pageView) async {
    var queryParameters = {
      'api_key': 'ffb636e867782adbb2da8f18cb1fa0f0',
      'language': 'ko-KR',
      'page': pageView
    };
    var uri =
        Uri.https('api.themoviedb.org', '/3/movie/popular', queryParameters);
    var response = await http.get(uri);
    Map<String, dynamic> body = json.decode(response.body);
    List<dynamic> list = body['results'];
    return list.map<Person>((item) => Person.fromJson(item)).toList();
  }

  Future<Map<String, dynamic>> getDetail(String id) async {
    var queryParameters = {
      'api_key': 'ffb636e867782adbb2da8f18cb1fa0f0',
      'language': 'ko-KR',
    };
    var uri = Uri.https('api.themoviedb.org', '/3/movie/$id', queryParameters);
    var response = await http.get(uri);
    Map<String, dynamic> body = json.decode(response.body);
    var list = body;
    return list;
  }
}
