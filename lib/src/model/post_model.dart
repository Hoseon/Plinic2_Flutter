import 'package:plinic2/src/model/user_model.dart';

class PostModel {
  String? postcode;
  String? postcode1;
  String? postcode2;
  String? postcodeSeq;
  String? zonecode;
  String? address;
  String? addressEnglish;
  String? addressType;
  String? bcode;
  String? bname;
  String? bnameEnglish;
  String? bname1;
  String? bname1English;
  String? bname2;
  String? bname2English;
  String? sidoEnglish;
  String? sigungu;
  String? sigunguEnglish;
  String? sigunguCode;
  String? userLanguageType;
  String? query;
  String? buildingName;
  String? buildingCode;
  String? apartment;
  String? jibunAddress;
  String? jibunAddressEnglish;
  String? roadAddress;
  String? roadAddressEnglish;
  String? autoRoadAddress;

  PostModel({
    this.postcode,
    this.postcode1,
    this.postcode2,
    this.postcodeSeq,
    this.zonecode,
    this.address,
    this.addressEnglish,
    this.addressType,
    this.bcode,
    this.bname,
    this.bnameEnglish,
    this.bname1,
    this.bname1English,
    this.bname2,
    this.bname2English,
    this.sidoEnglish,
    this.sigungu,
    this.sigunguEnglish,
    this.sigunguCode,
    this.userLanguageType,
    this.query,
    this.buildingName,
    this.buildingCode,
    this.apartment,
    this.jibunAddress,
    this.jibunAddressEnglish,
    this.roadAddress,
    this.roadAddressEnglish,
    this.autoRoadAddress,
  });

  PostModel.fromJson(Map<String, dynamic> json) 
  : zonecode = json['zonecode'] as String,
    address = json['address'] as String,
    buildingName = json['buildingName'] as String;

}