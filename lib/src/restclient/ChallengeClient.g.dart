// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ChallengeClient.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChallengeModel _$ChallengeModelFromJson(Map<String, dynamic> json) =>
    ChallengeModel(
      division: json['division'] as String?,
      startAt: json['startAt'] == null
          ? null
          : DateTime.parse(json['startAt'] as String),
      endAt: json['endAt'] == null
          ? null
          : DateTime.parse(json['endAt'] as String),
      useDay: json['useDay'] as int?,
      rewardType: json['rewardType'] as String?,
      rewardName: json['rewardName'] as String?,
      title: json['title'] as String?,
      desc: json['desc'] as String?,
      img1_url: json['img1_url'] as String?,
      img2_url: json['img2_url'] as String?,
      img3_url: json['img3_url'] as String?,
      status: json['status'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    )..id = json['_id'] as String?;

Map<String, dynamic> _$ChallengeModelToJson(ChallengeModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'division': instance.division,
      'startAt': instance.startAt?.toIso8601String(),
      'endAt': instance.endAt?.toIso8601String(),
      'useDay': instance.useDay,
      'rewardType': instance.rewardType,
      'rewardName': instance.rewardName,
      'title': instance.title,
      'desc': instance.desc,
      'img1_url': instance.img1_url,
      'img2_url': instance.img2_url,
      'img3_url': instance.img3_url,
      'status': instance.status,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps

class _ChallengeClient implements ChallengeClient {
  _ChallengeClient(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://admin.g1p.xyz';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<ChallengeModel> findIng() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ChallengeModel>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/challenge',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ChallengeModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<ChallengeModel> findEsti() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ChallengeModel>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/challenge/esti',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ChallengeModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<ChallengeModel> findOne(id) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ChallengeModel>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/challenge',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ChallengeModel.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
