import 'dart:io';

import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'UserClient.g.dart';

// @RestApi(baseUrl: 'https://admin.g1p.xyz') //production
@RestApi(baseUrl: 'http://localhost:8001') //develoment
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

  //사용자 주소 정보 가져오기
  @GET('/user/getUserAddress/{uid}')
  Future<List<UserAddress>> getUserAddress(@Path('uid') String uid);

  //사용자 주소 정보 저장하기
  @POST('/user/createAddress/{uid}')
  Future<UserAddress> createAddress(
      @Path('uid') String uid, @Body() UserAddress body);

  //사용자 주소 정보 삭제하기
  @DELETE('/user/delAddress/{id}')
  Future<UserAddress> deleteUserAddress(@Path('id') String id);

  //사용자 주소 정보 수정하기
  @PATCH('/user/updateAddress/{uid}/{id}')
  Future<UserAddress> updateUserAddress(
      @Path('uid') String uid, @Path('id') String id, @Body() UserAddress body);
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

@JsonSerializable()
class UserAddress {
  @JsonKey(name: '_id')
  String? id;
  String? uid;
  String? email;
  String? toName;
  int? postNumber;
  String? address1;
  String? address2;
  String? phone;
  bool? isDefault;
  DateTime? createdAt;
  DateTime? updatedAt;

  UserAddress(
      {this.id,
      this.uid,
      this.email,
      this.toName,
      this.postNumber,
      this.address1,
      this.address2,
      this.phone,
      this.isDefault,
      this.createdAt,
      this.updatedAt});

  factory UserAddress.fromJson(Map<String, dynamic> json) =>
      _$UserAddressFromJson(json);
  Map<String, dynamic> toJson() => _$UserAddressToJson(this);
}
