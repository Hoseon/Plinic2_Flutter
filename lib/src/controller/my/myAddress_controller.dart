import 'package:dio/dio.dart';
import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plinic2/src/config/environment.dart';
import 'package:plinic2/src/controller/profile_controller.dart';
import 'package:plinic2/src/restclient/UserClient.dart';

class MyAddressController extends GetxController {
  static MyAddressController get to => Get.find();
  final GlobalKey<FormState> editAddressKey = GlobalKey<FormState>();
  final GlobalKey<FormState> address1Key = GlobalKey<FormState>();
  final GlobalKey<FormState> address2Key = GlobalKey<FormState>();
  final GlobalKey<FormState> phoneKey = GlobalKey<FormState>();
  TextEditingController? toNameTextController;
  TextEditingController? address1TextController;
  TextEditingController? address2TextController;
  MaskedTextController? phoneTextController;

  Dio dio = Dio();

  RxList<UserAddress> userAddress = RxList<UserAddress>();

  RxBool isLoading = true.obs;

  RxString toName = ''.obs;
  RxString address1 = ''.obs;
  RxString address2 = ''.obs;
  RxString phone = ''.obs;
  RxBool isDefault = false.obs;
  RxBool tempIsDefault = false.obs; //사용자 배송지 수정시 기본 배송지

  @override
  void onInit() async {
    toNameTextController = TextEditingController();
    address1TextController = TextEditingController();
    address2TextController = TextEditingController();
    phoneTextController = MaskedTextController(mask: '000-0000-0000');
    super.onInit();
    var client = UserClient(dio);

    await client
        .getUserAddress(ProfileController.to.myProfile.value.uid!)
        .then((value) {
      isLoading(false);
      userAddress(value);
    });
  }

  @override
  void onClose() {
    toNameTextController?.dispose();
    address1TextController?.dispose();
    address2TextController?.dispose();
    phoneTextController?.dispose();
    tempIsDefault(false);
    super.onClose();
  }

  Future<RxList<UserAddress>> deleteUserAddress(id) async {
    var client = UserClient(dio);
    isLoading(true);

    await client.deleteUserAddress(id);

    await client
        .getUserAddress(ProfileController.to.myProfile.value.uid!)
        .then((value) {
      isLoading(false);
      userAddress(value);
    });

    return userAddress;
  }

  Future<RxList<UserAddress>> creatUserAddress(
      String name,
      String address,
      String address_detail,
      String address_phone,
      String postNumber,
      bool addressDefault) async {
    var client = UserClient(dio);

    toName(name);
    address1(address);
    address2(address_detail);
    phone(address_phone);
    isDefault(addressDefault);

    await client.createAddress(
      ProfileController.to.myProfile.value.uid!,
      UserAddress(
          uid: ProfileController.to.myProfile.value.uid,
          email: ProfileController.to.myProfile.value.email,
          toName: toName.value,
          address1: address1.value,
          address2: address2.value,
          phone: phone.value,
          postNumber: int.parse(postNumber),
          isDefault: isDefault.value),
    );
    isLoading(true);
    await client
        .getUserAddress(ProfileController.to.myProfile.value.uid!)
        .then((value) {
      isLoading(false);
      userAddress(value);
    });

    return userAddress;
  }

  Future<RxList<UserAddress>> updateUserAddress(
      uid, id, UserAddress body) async {
    final client = UserClient(dio);

    //주소 데이터 수정하기
    await client.updateUserAddress(uid, id, body);

    await client
        .getUserAddress(ProfileController.to.myProfile.value.uid!)
        .then((value) {
      isLoading(false);
      userAddress(value);
    });

    return userAddress;
  }

  void preUpdateValue(UserAddress userAddress) {
    toNameTextController!.text = userAddress.toName.toString();
    address1TextController!.text = userAddress.address1.toString();
    address2TextController!.text = userAddress.address2.toString();
    phoneTextController!.text = userAddress.phone.toString();
    // isDefault(userAddress.isDefault);
  }

  //사용자 주소 업데이트 시 기본 배송지로 할 것인지
  void updateTempIsDefault(bool value) {
    tempIsDefault(value);
  }
}
