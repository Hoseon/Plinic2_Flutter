import 'dart:io';

import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'NoticeClient.g.dart';

// @RestApi() // ENV Setting
@RestApi(baseUrl: 'https://admin.g1p.xyz') //production
// @RestApi(baseUrl: 'http://localhost:8001') //develoment
abstract class NoticeClient {
  factory NoticeClient(Dio dio, {String baseUrl}) = _NoticeClient;

  @GET('/notice')
  Future<List<ScNotice>> getAllNotice();

  @GET('/notice/{id}')
  Future<ScNotice> getUser(@Path('id') String id);
}

@JsonSerializable()
class ScNotice {
  @JsonKey(name: '_id')
  String? id;
  String? title;
  String? content;
  DateTime? createdAt;
  DateTime? updatedAt;

  ScNotice({this.id, this.title, this.content, this.createdAt, this.updatedAt});

  factory ScNotice.fromJson(Map<String, dynamic> json) =>
      _$ScNoticeFromJson(json);
  Map<String, dynamic> toJson() => _$ScNoticeToJson(this);
}
