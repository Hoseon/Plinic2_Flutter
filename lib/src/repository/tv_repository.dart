import 'dart:convert';

import 'package:plinic2/src/model/tv_model.dart';
import 'package:http/http.dart' as http;

class TvRepository {
  Future<List<Tv>> loadTv() async {
    var queryParameters = {
      'api_key' : 'ffb636e867782adbb2da8f18cb1fa0f0',
      'language' : 'ko-KR'
    };

    var uri = Uri.https('api.themoviedb.org', '/3/tv/popular', queryParameters);
    var response = await http.get(uri);

    if(response.statusCode == 200) {
      Map<String, dynamic> body = json.decode(response.body);
      List<dynamic> list = body['results'];
      return list.map((item)=> Tv.fromJson(item)).toList();
    } else {
      throw Exception('인기 TV쇼 가져 오기 에러');
    }

  }

}