import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:plinic2/src/model/display/magazine_model.dart';

class MagazineRepository {
  final CollectionReference _collectionReference =
      FirebaseFirestore.instance.collection('magazine');

  Future<List<Map<String, dynamic>>> getAllMagazine() {
    return _collectionReference.get().then((onValue) {
      var magazineList = <Map<String, dynamic>>[];
      onValue.docs.forEach((element) {
        magazineList.add({
          'code': element.get('code'),
          'docId': element.id,
          'content': element.get('content') ?? '',
          'create_time': element.get('create_time') ?? '',
          // 'update_time': element.get('update_time') ?? '',
          'sliver_image': element.get('sliver_image') ?? '',
          'status': element.get('status') ?? '',
          'title': element.get('title') ?? '',
          'sub_title': element.get('sub_title') ?? '',
        });
      });
      return magazineList;
    });
  }

  Future<MagazineModel?> getMainMagazine() async {
    var magazine = FirebaseFirestore.instance.collection('magazine');
    var data = await magazine.limit(1).get();
    if (data.size == 0) {
      return null;
    } else {
      // list.map<Person>((item) => Person.fromJson(item)).toList();
      return MagazineModel.fromJson(data.docs[0].data(), data.docs[0].id);
    }
  }
}
