import 'package:dio/dio.dart';
import 'package:plinic2/src/model/user_model.dart';

//Dio + Retrofit을 활용하여 개발할 필요가 있어 보인다.

class ProfileRepository {
  static Future<UserModel?> findUserByUid(String uid) async {
    // var users = FirebaseFirestore.instance.collection('users');
    // var data = await users.where('uid', isEqualTo: uid).get();
    // if (data.size == 0) {
    // return null;
    // } else {
    // return UserModel.fromJson(data.docs[0].data(), data.docs[0].id);
    // }
  }
}
