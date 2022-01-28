import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:plinic2/src/model/user_model.dart';

class RegisterRepository {
  Future<dynamic> registerUser(UserModel userData, var agree) async {
    var dio = Dio(BaseOptions(baseUrl: 'https://admin.g1p.xyz'));
    try {
      var response = await dio.post('/register', data: {
        'user': {
          'uid': userData.uid,
          'email': userData.email,
          'name': userData.name,
          'nickname': userData.nickname ?? '닉네임없음',
          'from': userData.uid!.indexOf('kakao') == 1 ? '카카오' : '구글',
          'gender': userData.gender,
          'birthDay': userData.birthDay,
          'avata_url': userData.avataUrl
        },
        'token': {'uid': userData.uid, 'token': 'asdfasdfasdf'},
        'agree': {
          'uid': userData.uid,
          'agree1': agree['agree1'],
          'agree2': agree['agree2'],
          'agree3': agree['agree3'],
          'opt_agree4': agree['opt_agree4'],
          'opt_agree5': agree['opt_agree5']
        }
      });
      if (response.statusCode == 201) {
        return '201';
      }
    } on DioError catch (e) {
      if (e.response!.statusCode == 409) {
        return '409';
      } else if (e.response!.statusCode == 400) {
        return '400';
      }
    }
  }
}
