// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'DeviceCountClient.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AllCountResponse _$AllCountResponseFromJson(Map<String, dynamic> json) =>
    AllCountResponse(
      id: json['_id'] as String?,
      myAllCount: json['myAllCount'] as int?,
    );

Map<String, dynamic> _$AllCountResponseToJson(AllCountResponse instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'myAllCount': instance.myAllCount,
    };

MonthCountResponse _$MonthCountResponseFromJson(Map<String, dynamic> json) =>
    MonthCountResponse(
      id: json['_id'] as String?,
      myMonthCount: json['myMonthCount'] as int?,
    );

Map<String, dynamic> _$MonthCountResponseToJson(MonthCountResponse instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'myMonthCount': instance.myMonthCount,
    };

DeviceCountModel _$DeviceCountModelFromJson(Map<String, dynamic> json) =>
    DeviceCountModel(
      id: json['_id'] == null ? null : DateTime.parse(json['_id'] as String),
      count: json['count'] as int?,
    );

Map<String, dynamic> _$DeviceCountModelToJson(DeviceCountModel instance) =>
    <String, dynamic>{
      '_id': instance.id?.toIso8601String(),
      'count': instance.count,
    };

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps

class _DeviceCountClient implements DeviceCountClient {
  _DeviceCountClient(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://admin.g1p.xyz';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<List<DeviceCountModel>> getCalendarCountData(uid) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<List<dynamic>>(
        _setStreamType<List<DeviceCountModel>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/devicecount/${uid}',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map(
            (dynamic i) => DeviceCountModel.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<List<MonthCountResponse>> getMonthCount(uid) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<List<dynamic>>(
        _setStreamType<List<MonthCountResponse>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/devicecount/getMonthUseCount/${uid}',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) =>
            MonthCountResponse.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<List<AllCountResponse>> getAllCount(uid) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<List<dynamic>>(
        _setStreamType<List<AllCountResponse>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/devicecount/getAllUseCount/${uid}',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map(
            (dynamic i) => AllCountResponse.fromJson(i as Map<String, dynamic>))
        .toList();
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
