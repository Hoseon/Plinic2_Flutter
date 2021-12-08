import 'dart:io';

class UserModel {
  String? uid;
  String? docId;
  String? name;
  String? nickname;
  String? email;
  String? from;
  int? phone;
  String? description;
  String? avataUrl;
  String? backgroundUrl;
  String? type;
  String? status;
  File? avatarFile;
  File? backgroudFile;
  DateTime? lastLoginTime; //마지막 로그인 시간
  DateTime? createdTime; //가입일시
  String? grade; //기기 사용 등급
  String? recommender; //내가 -> 추천한 사람
  String? gender;
  String? birthDay;
  String? skinType; //최신피부 타입

  UserModel({
    this.uid,
    this.docId,
    this.name,
    this.nickname,
    this.email,
    this.from,
    this.phone,
    this.description,
    this.avataUrl,
    this.backgroundUrl,
    this.type,
    this.status,
    this.lastLoginTime,
    this.createdTime,
    this.grade,
    this.recommender,
    this.gender,
    this.birthDay,
    this.skinType,
  });

  UserModel.clone(UserModel user)
      : this(
          uid: user.uid,
          docId: user.docId,
          name: user.name,
          nickname: user.nickname,
          email: user.email,
          from: user.from,
          phone: user.phone,
          description: user.description,
          avataUrl: user.avataUrl,
          backgroundUrl: user.backgroundUrl,
          type: user.type,
          status: user.status,
          lastLoginTime: user.lastLoginTime,
          createdTime: user.createdTime,
          grade: user.grade,
          recommender: user.recommender,
          gender: user.gender,
          birthDay: user.birthDay,
          skinType: user.skinType,
        );

  void initImageFile() {
    avatarFile = null;
    backgroudFile = null;
  }

  UserModel.fromJson(Map<String, dynamic> json, String docId)
      : uid = json['uid'] as String?,
        docId = docId,
        name = json['name'] as String?,
        nickname = json['nickname'] as String?,
        email = json['email'] as String?,
        from = json['from'] as String?,
        phone = json['phone'] as int?,
        description = json['description'] as String?,
        avataUrl = json['avata_url'] as String?,
        backgroundUrl = json['description'] as String?,
        type = json['type'] as String?,
        status = json['status'] as String?,
        lastLoginTime = json['last_login_time'].toDate(),
        createdTime = json['created_time'].toDate(),
        grade = json['grade'] as String?, //기기사용 등급
        recommender = json['recommender'] as String?;
  // gender = json['gender'] as String?,
  // birthDay = json['birthDay'] as String?,
  // skinType = json['skinType'] as String;

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'nickname': nickname,
      'email': email,
      'from': from,
      'phone': phone,
      'description': description,
      'avata_url': avataUrl,
      'background_url': backgroundUrl,
      'type': type,
      'status': status,
      'last_login_time': lastLoginTime,
      'created_time': createdTime,
      'grade': grade,
      'recommender': recommender,
      'gender': gender,
      'birthDay': birthDay,
      'skinType': skinType,
    };
  }
}
