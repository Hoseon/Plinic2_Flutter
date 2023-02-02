import 'dart:io';

import 'package:json_annotation/json_annotation.dart';
import 'package:plinic2/src/restclient/UserClient.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'RewardClient.g.dart';

// @RestApi() //ENV Setting
@RestApi(baseUrl: 'https://admin.g1p.xyz') //production
// @RestApi(baseUrl: 'http://localhost:8001') //development
abstract class RewardClient {
  factory RewardClient(Dio dio, {String baseUrl}) = _RewardClient;

  @GET('/reward/{id}')
  Future<RewardModel> getUser(@Path('id') String id);

  @GET('/reward/checkUserAddress/{id}')
  Future<UserAddress> checkUserAddress(@Path('id') String id);

  @POST('/reward')
  Future<RewardModel> saveReward(@Body() RewardModel body);

  @GET('/reward/findCheckReward/{uid}/{chid}')
  Future<RewardModel> findCheckReward(
      @Path('uid') String id, @Path('chid') String chid);
}

@JsonSerializable()
class RewardModel {
  String? uid;
  String? email;
  String? toName;
  String? phone;
  String? address1;
  String? address2;
  String? postNumber;
  String? deliverMsg;
  String? productName;
  String? challengeId;

  RewardModel(
      {this.uid,
      this.email,
      this.toName,
      this.phone,
      this.address1,
      this.address2,
      this.postNumber,
      this.deliverMsg,
      this.productName,
      this.challengeId});
  factory RewardModel.fromJson(Map<String, dynamic> json) =>
      _$RewardModelFromJson(json);
  Map<String, dynamic> toJson() => _$RewardModelToJson(this);
}
