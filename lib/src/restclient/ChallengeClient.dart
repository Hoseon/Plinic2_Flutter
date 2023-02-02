import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'ChallengeClient.g.dart';

// @RestApi() // ENV Setting
@RestApi(baseUrl: 'https://admin.g1p.xyz') //production
// @RestApi(baseUrl: 'http://localhost:8001') //develoment
abstract class ChallengeClient {
  factory ChallengeClient(Dio dio, {String baseUrl}) = _ChallengeClient;

  @GET('/challenge')
  Future<ChallengeModel> findIng(); //현재 진행중인 챌린지 가져오기

  @GET('/challenge/esti')
  Future<ChallengeModel> findEsti(); //현재 진행중인 챌린지 가져오기

  @GET('/challenge')
  Future<ChallengeModel> findOne(@Path('id') String id); //챌린지 1건 조회
}

@JsonSerializable()
class ChallengeModel {
  @JsonKey(name: '_id')
  String? id;
  String? division;
  DateTime? startAt;
  DateTime? endAt;
  int? useDay;
  String? rewardType;
  String? rewardName;
  String? title;
  String? desc;
  String? img1_url;
  String? img2_url;
  String? img3_url;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;

  ChallengeModel({
    this.division,
    this.startAt,
    this.endAt,
    this.useDay,
    this.rewardType,
    this.rewardName,
    this.title,
    this.desc,
    this.img1_url,
    this.img2_url,
    this.img3_url,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory ChallengeModel.fromJson(Map<String, dynamic> json) =>
      _$ChallengeModelFromJson(json);
  Map<String, dynamic> toJson() => _$ChallengeModelToJson(this);
}
