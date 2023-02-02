import 'package:dio/dio.dart';

// RetroFit을 사용하여 더 개선할 필요가 있음
class DioConfing {
  var dio = Dio(BaseOptions(baseUrl: 'https://admin.g1p.xyz'));
}
