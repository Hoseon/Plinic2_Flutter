import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:plinic2/src/repository/firebase_user_repository.dart';

class FindIdRepository {
  // final CollectionReference _collectionReference =
  //     FirebaseFirestore.instance.collection('users');

// static Future<PermModel?> findbyCode(String code, PermModel permModel) async {
//     var perm = FirebaseFirestore.instance.collection('perm');
//     var data = await perm.where('code', isEqualTo: code).get();
//     if (data.size == 0) {
//       return null;
//     } else {
//       return PermModel.fromJson(data.docs[0].data(), data.docs[0].id);
//     }
//   }

  Future<Map<String, dynamic>> findUserByPhone(String phone) async {
    Map<String, dynamic>? result;
    var users = FirebaseFirestore.instance.collection('users');
    var data = await users.where('phone', isEqualTo: phone).get();
    if (data.size == 0) {
      result = {'phone': null};
      return result;
    } else {
      result = data.docs[0].data();
      print(result);
      return result;
      // return UserModel.fromJson(data.docs[0].data(), data.docs[0].id);
    }
  }

  void test() {
    // _collectionReference.where(field)
  }
}
