// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'DeviceLogClient.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AllUseTimeCountResponse _$AllUseTimeCountResponseFromJson(
        Map<String, dynamic> json) =>
    AllUseTimeCountResponse(
      monthTimeUseCount: json['monthTimeUseCount'] as int?,
    );

Map<String, dynamic> _$AllUseTimeCountResponseToJson(
        AllUseTimeCountResponse instance) =>
    <String, dynamic>{
      'monthTimeUseCount': instance.monthTimeUseCount,
    };

MonthTimeResponse _$MonthTimeResponseFromJson(Map<String, dynamic> json) =>
    MonthTimeResponse(
      id: json['_id'] as String?,
      monthTime: json['monthTime'] as int?,
    );

Map<String, dynamic> _$MonthTimeResponseToJson(MonthTimeResponse instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'monthTime': instance.monthTime,
    };

DeviceLogResponse _$DeviceLogResponseFromJson(Map<String, dynamic> json) =>
    DeviceLogResponse(
      id: json['_id'] as String?,
      pointsum: json['pointsum'] as int?,
    );

Map<String, dynamic> _$DeviceLogResponseToJson(DeviceLogResponse instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'pointsum': instance.pointsum,
    };

DeviceLogRequest _$DeviceLogRequestFromJson(Map<String, dynamic> json) =>
    DeviceLogRequest(
      id: json['_id'] as String?,
      uid: json['uid'] as String?,
      email: json['email'] as String?,
      from: json['from'] as String?,
      log: (json['log'] as List<dynamic>?)
          ?.map((e) => e as Map<String, dynamic>)
          .toList(),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$DeviceLogRequestToJson(DeviceLogRequest instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'uid': instance.uid,
      'email': instance.email,
      'from': instance.from,
      'log': instance.log,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps

class _DeviceLogClient implements DeviceLogClient {
  _DeviceLogClient(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://admin.g1p.xyz';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<List<DeviceLogResponse>> saveDeviceLog(body) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(body.toJson());
    final _result = await _dio.fetch<List<dynamic>>(
        _setStreamType<List<DeviceLogResponse>>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, '/devicelog',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) =>
            DeviceLogResponse.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<List<MonthTimeResponse>> getMonthTime(uid) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<List<dynamic>>(
        _setStreamType<List<MonthTimeResponse>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/devicelog/getMonthUseTime/${uid}',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) =>
            MonthTimeResponse.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<List<AllUseTimeCountResponse>> getAllUseTimeCount() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<List<dynamic>>(
        _setStreamType<List<AllUseTimeCountResponse>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/devicelog/monthlyTimeUserCount',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) =>
            AllUseTimeCountResponse.fromJson(i as Map<String, dynamic>))
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
