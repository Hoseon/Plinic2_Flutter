import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:plinic2/src/model/user_model.dart';

class FirebaseUserRepository {
  static Future<String> signup(UserModel user) async {
    var users = FirebaseFirestore.instance.collection('users');
    var drf = await users.add(user.toMap());
    return drf.id;
  }

  static Future<UserModel?> findUserByUid(String uid) async {
    var users = FirebaseFirestore.instance.collection('users');
    var data = await users.where('uid', isEqualTo: uid).get();
    if (data.size == 0) {
      return null;
    } else {
      return UserModel.fromJson(data.docs[0].data(), data.docs[0].id);
    }
  }

  static void updateLastLoginDate(String docId, DateTime time) {
    var users = FirebaseFirestore.instance.collection('users');
    users.doc(docId).update({'last_login_time': time});
  }
}
