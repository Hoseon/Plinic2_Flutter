// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'UserClient.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserLogin _$UserLoginFromJson(Map<String, dynamic> json) => UserLogin(
      id: json['id'] as String?,
      uid: json['uid'] as String?,
      email: json['email'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
    );

Map<String, dynamic> _$UserLoginToJson(UserLogin instance) => <String, dynamic>{
      'id': instance.id,
      'uid': instance.uid,
      'email': instance.email,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };

UserToken _$UserTokenFromJson(Map<String, dynamic> json) => UserToken(
      id: json['id'] as String?,
      uid: json['uid'] as String?,
      token: json['token'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
    );

Map<String, dynamic> _$UserTokenToJson(UserToken instance) => <String, dynamic>{
      'id': instance.id,
      'uid': instance.uid,
      'token': instance.token,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps

class _UserClient implements UserClient {
  _UserClient(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://admin.g1p.xyz';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<UserLogin> saveLoginRecord(user) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(user.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<UserLogin>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, '/user/lastLoginRecord',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = UserLogin.fromJson(_result.data!);
    return value;
  }

  @override
  Future<UserToken> savePushTokenRecord(user) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(user.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<UserToken>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, '/user/lastPushTokenRecord',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = UserToken.fromJson(_result.data!);
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
