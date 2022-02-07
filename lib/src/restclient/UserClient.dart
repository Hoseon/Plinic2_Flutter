import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'UserClient.g.dart';

@RestApi(baseUrl: 'https://admin.g1p.xyz')
abstract class UserClient {
  factory UserClient(Dio dio, {String baseUrl}) = _UserClient;

  @POST('/user/lastLoginRecord')
  Future<UserLogin> saveLoginRecord(@Body() UserLogin user);

  @POST('/user/lastPushTokenRecord')
  Future<UserToken> savePushTokenRecord(@Body() UserToken user);
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
