import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'DeviceCountClient.g.dart';

// @RestApi() // ENV Setting
@RestApi(baseUrl: 'https://admin.g1p.xyz') //production
// @RestApi(baseUrl: 'http://localhost:8001') //develoment
abstract class DeviceCountClient {
  factory DeviceCountClient(Dio dio, {String baseUrl}) = _DeviceCountClient;

  @GET('/devicecount/{uid}')
  Future<List<DeviceCountModel>> getCalendarCountData(@Path('uid') String? uid);

  //사용자의 이번달 챌린지 성공 횟수를 가져 온다.
  @GET('/devicecount/getMonthUseCount/{uid}')
  Future<List<MonthCountResponse>> getMonthCount(@Path('uid') String uid);

  @GET('/devicecount/getAllUseCount/{uid}')
  Future<List<AllCountResponse>> getAllCount(@Path('uid') String uid);
}

@JsonSerializable()
class AllCountResponse {
  @JsonKey(name: '_id')
  String? id;
  int? myAllCount;

  AllCountResponse({
    this.id,
    this.myAllCount,
  });

  factory AllCountResponse.fromJson(Map<String, dynamic> json) =>
      _$AllCountResponseFromJson(json);
  Map<String, dynamic> toJson() => _$AllCountResponseToJson(this);
}

@JsonSerializable()
class MonthCountResponse {
  @JsonKey(name: '_id')
  String? id;
  int? myMonthCount;

  MonthCountResponse({
    this.id,
    this.myMonthCount,
  });

  factory MonthCountResponse.fromJson(Map<String, dynamic> json) =>
      _$MonthCountResponseFromJson(json);
  Map<String, dynamic> toJson() => _$MonthCountResponseToJson(this);
}

@JsonSerializable()
class DeviceCountModel {
  @JsonKey(name: '_id')
  DateTime? id;
  int? count;

  DeviceCountModel({
    this.id,
    this.count,
  });

  factory DeviceCountModel.fromJson(Map<String, dynamic> json) =>
      _$DeviceCountModelFromJson(json);
  Map<String, dynamic> toJson() => _$DeviceCountModelToJson(this);
}
