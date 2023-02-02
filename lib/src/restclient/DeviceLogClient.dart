import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'DeviceLogClient.g.dart';

// @RestApi() // ENV Setting
@RestApi(baseUrl: 'https://admin.g1p.xyz') //production
// @RestApi(baseUrl: 'http://localhost:8001') //develoment
abstract class DeviceLogClient {
  factory DeviceLogClient(Dio dio, {String baseUrl}) = _DeviceLogClient;

  @POST('/devicelog')
  Future<List<DeviceLogResponse>> saveDeviceLog(@Body() DeviceLogRequest body);

  @GET('/devicelog/getMonthUseTime/{uid}')
  Future<List<MonthTimeResponse>> getMonthTime(@Path('uid') String uid);

  @GET('/devicelog/monthlyTimeUserCount')
  Future<List<AllUseTimeCountResponse>>
      getAllUseTimeCount(); //이달의 모든 총 사용시간 카운트를 해온다. 사진 위에 사용자 수로 활용

}

@JsonSerializable()
class AllUseTimeCountResponse {
  int? monthTimeUseCount;

  AllUseTimeCountResponse({this.monthTimeUseCount});

  factory AllUseTimeCountResponse.fromJson(Map<String, dynamic> json) =>
      _$AllUseTimeCountResponseFromJson(json);
  Map<String, dynamic> toJson() => _$AllUseTimeCountResponseToJson(this);
}

@JsonSerializable()
class MonthTimeResponse {
  @JsonKey(name: '_id')
  String? id;
  int? monthTime;

  MonthTimeResponse({this.id, this.monthTime});

  factory MonthTimeResponse.fromJson(Map<String, dynamic> json) =>
      _$MonthTimeResponseFromJson(json);
  Map<String, dynamic> toJson() => _$MonthTimeResponseToJson(this);
}

@JsonSerializable()
class DeviceLogResponse {
  @JsonKey(name: '_id')
  String? id;
  int? pointsum;

  DeviceLogResponse({this.id, this.pointsum});

  factory DeviceLogResponse.fromJson(Map<String, dynamic> json) =>
      _$DeviceLogResponseFromJson(json);
  Map<String, dynamic> toJson() => _$DeviceLogResponseToJson(this);
}

@JsonSerializable()
class DeviceLogRequest {
  @JsonKey(name: '_id')
  String? id;
  String? uid;
  String? email;
  String? from;
  @JsonKey(name: 'log')
  List<Map<String, dynamic>>? log;
  DateTime? createdAt;
  DateTime? updatedAt;

  DeviceLogRequest(
      {this.id,
      this.uid,
      this.email,
      this.from,
      this.log,
      this.createdAt,
      this.updatedAt});

  factory DeviceLogRequest.fromJson(Map<String, dynamic> json) =>
      _$DeviceLogRequestFromJson(json);
  Map<String, dynamic> toJson() => _$DeviceLogRequestToJson(this);
}
