// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'NoticeClient.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ScNotice _$ScNoticeFromJson(Map<String, dynamic> json) => ScNotice(
      id: json['_id'] as String?,
      title: json['title'] as String?,
      content: json['content'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$ScNoticeToJson(ScNotice instance) => <String, dynamic>{
      '_id': instance.id,
      'title': instance.title,
      'content': instance.content,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps

class _NoticeClient implements NoticeClient {
  _NoticeClient(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://admin.g1p.xyz';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<List<ScNotice>> getAllNotice() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<List<dynamic>>(
        _setStreamType<List<ScNotice>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/notice',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) => ScNotice.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<ScNotice> getUser(id) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ScNotice>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/notice/${id}',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ScNotice.fromJson(_result.data!);
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
