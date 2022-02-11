import 'dart:io';

import 'package:json_annotation/json_annotation.dart';
import 'package:plinic2/src/model/user_model.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'UserClient.g.dart';

@RestApi(baseUrl: 'https://admin.g1p.xyz') //production
// @RestApi(baseUrl: 'http://localhost:8001') //develoment
abstract class UserClient {
  factory UserClient(Dio dio, {String baseUrl}) = _UserClient;

  @GET('/user/{id}')
  Future<GetUser> getUser(@Path('id') String id);

  @GET('/user/findNickName/{nickname}')
  Future<String> getCheckUserNickName(@Path('nickname') String nickname);

  @POST('/user/lastLoginRecord')
  Future<UserLogin> saveLoginRecord(@Body() UserLogin user);

  @POST('/user/lastPushTokenRecord')
  Future<UserToken> savePushTokenRecord(@Body() UserToken user);

  @GET('/user/userPhoneAuthCheck/{uid}')
  Future<PhoneAuth> checkPhoneAuth(@Path('uid') String uid);

  //사용자 휴대폰 인증 정보 저장 api call
  @POST('/user/userPhoneAuth')
  Future<PhoneAuth> savePhoneAuth(@Body() PhoneAuth phoneAuth);

  @PATCH('/user/userUpdateNickName/{uid}')
  Future<GetUser> userUpdateNickName(
      @Path('uid') String uid, @Body() GetUser nickname);

  @POST('/user/userUpdateProfileImage')
  @MultiPart()
  Future<GetUser> userUpdateProfileImage(
      @Part() File images, @Part() String uid, @Part() String email);

  @GET('/user/getUserPush/{uid}')
  Future<UserPush> getUserNormalPush(@Path('uid') String uid);

  @PATCH('/user/updateNormalPush/{uid}/{useYN}')
  Future<UserPush> updateNormalPush(
      @Path('uid') String uid, @Path('useYN') bool useYN);

  @GET('/user/getUserMarketingPush/{uid}')
  Future<UserPush> getUserMarketingPush(@Path('uid') String uid);

  @PATCH('/user/updateMarketingPush/{uid}/{useYN}')
  Future<UserPush> updateMarketingPush(
      @Path('uid') String uid, @Path('useYN') bool useYN);
}

@JsonSerializable()
class GetUser {
  String? id;
  String? uid;
  String? email;
  String? name;
  String? nickname;
  String? from;
  String? gender;
  String? birthDay;
  String? avata_url;
  String? createdAt;
  String? updatedAt;

  GetUser(
      {this.id,
      this.uid,
      this.email,
      this.name,
      this.nickname,
      this.from,
      this.gender,
      this.birthDay,
      this.avata_url,
      this.createdAt,
      this.updatedAt});
  factory GetUser.fromJson(Map<String, dynamic> json) =>
      _$GetUserFromJson(json);
  Map<String, dynamic> toJson() => _$GetUserToJson(this);
}

@JsonSerializable()
class UserLogin {
  String? id;
  String? uid;
  String? email;
  String? createdAt;
  String? updatedAt;

  UserLogin({this.id, this.uid, this.email, this.createdAt, this.updatedAt});

  factory UserLogin.fromJson(Map<String, dynamic> json) =>
      _$UserLoginFromJson(json);
  Map<String, dynamic> toJson() => _$UserLoginToJson(this);
}

@JsonSerializable()
class UserToken {
  String? id;
  String? uid;
  String? token;
  String? createdAt;
  String? updatedAt;

  UserToken({this.id, this.uid, this.token, this.createdAt, this.updatedAt});

  factory UserToken.fromJson(Map<String, dynamic> json) =>
      _$UserTokenFromJson(json);
  Map<String, dynamic> toJson() => _$UserTokenToJson(this);
}

@JsonSerializable()
class PhoneAuth {
  String? id;
  String? uid;
  String? email;
  String? phone;
  String? birth;
  String? name;
  String? foreigner;
  String? carrier;
  int? gender;

  PhoneAuth(
      {this.id,
      this.uid,
      this.email,
      this.phone,
      this.birth,
      this.name,
      this.foreigner,
      this.carrier,
      this.gender});

  factory PhoneAuth.fromJson(Map<String, dynamic> json) =>
      _$PhoneAuthFromJson(json);
  Map<String, dynamic> toJson() => _$PhoneAuthToJson(this);
}

@JsonSerializable()
class UserPush {
  String? id;
  String? uid;
  bool? useYN;
  DateTime? createdAt;
  DateTime? updatedAt;

  UserPush({this.id, this.uid, this.useYN, this.createdAt, this.updatedAt});

  factory UserPush.fromJson(Map<String, dynamic> json) =>
      _$UserPushFromJson(json);
  Map<String, dynamic> toJson() => _$UserPushToJson(this);
}
