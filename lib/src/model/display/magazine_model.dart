class MagazineModel {
  String? docId;
  String? content;
  String? code;
  String? title;
  String? sub_title;
  DateTime? create_time;
  DateTime? update_time;
  String? status;
  String? sliver_image;

  MagazineModel(
      {this.docId,
      this.code,
      this.title,
      this.sub_title,
      this.content,
      this.create_time,
      this.status,
      this.sliver_image,
      this.update_time});

  MagazineModel.fromJson(Map<String, dynamic> json, String docId)
      : docId = docId,
        code = json['code'] as String,
        content = json['content'] as String,
        create_time = json['create_time'].toDate(),
        sliver_image = json['sliver_image'] as String,
        status = json['status'] as String,
        sub_title = json['sub_title'] as String,
        title = json['title'] as String,
        update_time = json['update_time'].toDate();

  Map<String, dynamic> toMap() {
    return {
      'code': code,
      'title': title,
      'content': content,
      'create_time': create_time,
      'status': status,
      'sliver_image': sliver_image
    };
  }
}
