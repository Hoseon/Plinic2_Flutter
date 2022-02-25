// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'RewardClient.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RewardModel _$RewardModelFromJson(Map<String, dynamic> json) => RewardModel(
      uid: json['uid'] as String?,
      email: json['email'] as String?,
      toName: json['toName'] as String?,
      phone: json['phone'] as String?,
      address1: json['address1'] as String?,
      address2: json['address2'] as String?,
      postNumber: json['postNumber'] as String?,
      deliverMsg: json['deliverMsg'] as String?,
      productName: json['productName'] as String?,
      challengeId: json['challengeId'] as String?,
    );

Map<String, dynamic> _$RewardModelToJson(RewardModel instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'email': instance.email,
      'toName': instance.toName,
      'phone': instance.phone,
      'address1': instance.address1,
      'address2': instance.address2,
      'postNumber': instance.postNumber,
      'deliverMsg': instance.deliverMsg,
      'productName': instance.productName,
      'challengeId': instance.challengeId,
    };

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps

class _RewardClient implements RewardClient {
  _RewardClient(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://admin.g1p.xyz';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<RewardModel> getUser(id) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<RewardModel>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/reward/${id}',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = RewardModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<UserAddress> checkUserAddress(id) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<UserAddress>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/reward/checkUserAddress/${id}',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = UserAddress.fromJson(_result.data!);
    return value;
  }

  @override
  Future<RewardModel> saveReward(body) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(body.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<RewardModel>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, '/reward',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = RewardModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<RewardModel> findCheckReward(id, chid) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<RewardModel>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/reward/findCheckReward/${id}/${chid}',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = RewardModel.fromJson(_result.data!);
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
