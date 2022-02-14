// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'UserClient.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetUser _$GetUserFromJson(Map<String, dynamic> json) => GetUser(
      id: json['id'] as String?,
      uid: json['uid'] as String?,
      email: json['email'] as String?,
      name: json['name'] as String?,
      nickname: json['nickname'] as String?,
      from: json['from'] as String?,
      gender: json['gender'] as String?,
      birthDay: json['birthDay'] as String?,
      avata_url: json['avata_url'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
    );

Map<String, dynamic> _$GetUserToJson(GetUser instance) => <String, dynamic>{
      'id': instance.id,
      'uid': instance.uid,
      'email': instance.email,
      'name': instance.name,
      'nickname': instance.nickname,
      'from': instance.from,
      'gender': instance.gender,
      'birthDay': instance.birthDay,
      'avata_url': instance.avata_url,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };

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

PhoneAuth _$PhoneAuthFromJson(Map<String, dynamic> json) => PhoneAuth(
      id: json['id'] as String?,
      uid: json['uid'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      birth: json['birth'] as String?,
      name: json['name'] as String?,
      foreigner: json['foreigner'] as String?,
      carrier: json['carrier'] as String?,
      gender: json['gender'] as int?,
    );

Map<String, dynamic> _$PhoneAuthToJson(PhoneAuth instance) => <String, dynamic>{
      'id': instance.id,
      'uid': instance.uid,
      'email': instance.email,
      'phone': instance.phone,
      'birth': instance.birth,
      'name': instance.name,
      'foreigner': instance.foreigner,
      'carrier': instance.carrier,
      'gender': instance.gender,
    };

UserPush _$UserPushFromJson(Map<String, dynamic> json) => UserPush(
      id: json['id'] as String?,
      uid: json['uid'] as String?,
      useYN: json['useYN'] as bool?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$UserPushToJson(UserPush instance) => <String, dynamic>{
      'id': instance.id,
      'uid': instance.uid,
      'useYN': instance.useYN,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };

UserAddress _$UserAddressFromJson(Map<String, dynamic> json) => UserAddress(
      id: json['_id'] as String?,
      uid: json['uid'] as String?,
      email: json['email'] as String?,
      toName: json['toName'] as String?,
      postNumber: json['postNumber'] as int?,
      address1: json['address1'] as String?,
      address2: json['address2'] as String?,
      phone: json['phone'] as String?,
      isDefault: json['isDefault'] as bool?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$UserAddressToJson(UserAddress instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'uid': instance.uid,
      'email': instance.email,
      'toName': instance.toName,
      'postNumber': instance.postNumber,
      'address1': instance.address1,
      'address2': instance.address2,
      'phone': instance.phone,
      'isDefault': instance.isDefault,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps

class _UserClient implements UserClient {
  _UserClient(this._dio, {this.baseUrl}) {
    baseUrl ??= 'http://localhost:8001';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<GetUser> getUser(id) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<GetUser>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/user/${id}',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = GetUser.fromJson(_result.data!);
    return value;
  }

  @override
  Future<String> getCheckUserNickName(nickname) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<String>(_setStreamType<String>(
        Options(method: 'GET', headers: _headers, extra: _extra)
            .compose(_dio.options, '/user/findNickName/${nickname}',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = _result.data!;
    return value;
  }

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

  @override
  Future<PhoneAuth> checkPhoneAuth(uid) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<PhoneAuth>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/user/userPhoneAuthCheck/${uid}',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = PhoneAuth.fromJson(_result.data!);
    return value;
  }

  @override
  Future<PhoneAuth> savePhoneAuth(phoneAuth) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(phoneAuth.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<PhoneAuth>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, '/user/userPhoneAuth',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = PhoneAuth.fromJson(_result.data!);
    return value;
  }

  @override
  Future<GetUser> userUpdateNickName(uid, nickname) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(nickname.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<GetUser>(
            Options(method: 'PATCH', headers: _headers, extra: _extra)
                .compose(_dio.options, '/user/userUpdateNickName/${uid}',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = GetUser.fromJson(_result.data!);
    return value;
  }

  @override
  Future<GetUser> userUpdateProfileImage(images, uid, email) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = FormData();
    _data.files.add(MapEntry(
        'images',
        MultipartFile.fromFileSync(images.path,
            filename: images.path.split(Platform.pathSeparator).last)));
    _data.fields.add(MapEntry('uid', uid));
    _data.fields.add(MapEntry('email', email));
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<GetUser>(Options(
                method: 'POST',
                headers: _headers,
                extra: _extra,
                contentType: 'multipart/form-data')
            .compose(_dio.options, '/user/userUpdateProfileImage',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = GetUser.fromJson(_result.data!);
    return value;
  }

  @override
  Future<UserPush> getUserNormalPush(uid) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<UserPush>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/user/getUserPush/${uid}',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = UserPush.fromJson(_result.data!);
    return value;
  }

  @override
  Future<UserPush> updateNormalPush(uid, useYN) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<UserPush>(
            Options(method: 'PATCH', headers: _headers, extra: _extra)
                .compose(_dio.options, '/user/updateNormalPush/${uid}/${useYN}',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = UserPush.fromJson(_result.data!);
    return value;
  }

  @override
  Future<UserPush> getUserMarketingPush(uid) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<UserPush>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/user/getUserMarketingPush/${uid}',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = UserPush.fromJson(_result.data!);
    return value;
  }

  @override
  Future<UserPush> updateMarketingPush(uid, useYN) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<UserPush>(
            Options(method: 'PATCH', headers: _headers, extra: _extra)
                .compose(
                    _dio.options, '/user/updateMarketingPush/${uid}/${useYN}',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = UserPush.fromJson(_result.data!);
    return value;
  }

  @override
  Future<List<UserAddress>> getUserAddress(uid) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<List<dynamic>>(
        _setStreamType<List<UserAddress>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/user/getUserAddress/${uid}',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) => UserAddress.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<UserAddress> createAddress(uid, body) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(body.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<UserAddress>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, '/user/createAddress/${uid}',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = UserAddress.fromJson(_result.data!);
    return value;
  }

  @override
  Future<UserAddress> deleteUserAddress(id) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<UserAddress>(
            Options(method: 'DELETE', headers: _headers, extra: _extra)
                .compose(_dio.options, '/user/delAddress/${id}',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = UserAddress.fromJson(_result.data!);
    return value;
  }

  @override
  Future<UserAddress> updateUserAddress(uid, id, body) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(body.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<UserAddress>(
            Options(method: 'PATCH', headers: _headers, extra: _extra)
                .compose(_dio.options, '/user/updateAddress/${uid}/${id}',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = UserAddress.fromJson(_result.data!);
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
