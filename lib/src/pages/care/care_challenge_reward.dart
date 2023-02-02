import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:bootpay/bootpay.dart';
import 'package:bootpay/model/extra.dart';
import 'package:bootpay/model/payload.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:get/get.dart';
import 'package:plinic2/constants.dart';
import 'package:plinic2/src/component/custom_appbar.dart';
import 'package:plinic2/src/component/plinic_dialog_one_button.dart';
import 'package:plinic2/src/component/plinic_dialog_two_button.dart';
import 'package:plinic2/src/controller/care/care_challenge_reward_controller.dart';
import 'package:plinic2/src/controller/profile_controller.dart';
import 'package:plinic2/src/pages/care/care_reward_completed.dart';
import 'package:plinic2/src/pages/my/address/address_search.dart';
import 'package:plinic2/src/restclient/ChallengeClient.dart';
import 'package:plinic2/src/restclient/RewardClient.dart';
import 'package:plinic2/src/restclient/UserClient.dart';
import 'package:shimmer/shimmer.dart';

class CareChallengeRewardPage extends GetView<CareChallengeRewardController> {
  CareChallengeRewardPage(
      {Key? key, this.userAddress, required this.challengeModel})
      : super(key: key);

  UserAddress? userAddress;
  String? postNumber;
  ChallengeModel? challengeModel;

  @override
  Widget build(BuildContext context) {
    Get.put<CareChallengeRewardController>(CareChallengeRewardController());
    return Scaffold(
      appBar: CustomAppbar('보상 정보 입력'),
      backgroundColor: white,
      body: (userAddress != null && userAddress!.id!.isNotEmpty)
          ? buildBody(context, userAddress!, challengeModel!)
          : buildEmptyBody(context),
    );
  }

  Widget buildBody(BuildContext context, UserAddress userAddress,
      ChallengeModel challengeModel) {
    CareChallengeRewardController.to.toNameTextController!.text =
        userAddress.toName!;
    CareChallengeRewardController.to.address1TextController!.text =
        userAddress.address1!;
    CareChallengeRewardController.to.address2TextController!.text =
        userAddress.address2!;
    CareChallengeRewardController.to.phoneTextController!.text =
        userAddress.phone!;
    postNumber = userAddress.postNumber.toString();
    return GestureDetector(
      onTap: () {
        Get.focusScope!.unfocus();
      },
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: Get.mediaQuery.size.width,
              height: 48,
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(horizontal: spacing_xl),
              color: grey_3,
              child: Text(
                '상품정보',
                style: TextStyle(
                  fontFamily: 'NotoSans',
                  color: black,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.normal,
                ),
              ),
            ),
            SizedBox(height: spacing_l),
            Container(
              padding: EdgeInsets.symmetric(horizontal: spacing_xl),
              // color: Colors.yellow,
              child: Row(
                children: [
                  CachedNetworkImage(
                    width: Get.mediaQuery.size.width * 0.187,
                    // height: 172,
                    fit: BoxFit.fitWidth,
                    imageUrl: challengeModel.img1_url.toString(),
                    placeholder: (_, url) => Shimmer.fromColors(
                      direction: ShimmerDirection.ltr,
                      period: Duration(seconds: 2),
                      baseColor: grey_3,
                      highlightColor: Colors.grey.shade300,
                      child: Container(
                        width: Get.mediaQuery.size.width * 0.187,
                        height: 92,
                        color: grey_2,
                      ),
                    ),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                  SizedBox(width: spacing_l),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        challengeModel.title.toString(),
                        style: TextStyle(
                          fontFamily: 'NotoSans',
                          color: black,
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                      SizedBox(height: spacing_xs),
                      Container(
                        width: Get.mediaQuery.size.width * 0.55,
                        child: Text(
                          challengeModel.desc.toString(),
                          style: TextStyle(
                            fontFamily: 'NotoSans',
                            color: black,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: spacing_l),
            Container(
              padding: EdgeInsets.symmetric(horizontal: spacing_xl),
              alignment: Alignment.centerLeft,
              child: Text(
                '챌린지 성공을 축하드립니다 💜',
                style: TextStyle(
                  fontFamily: 'NotoSans',
                  color: black,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.normal,
                ),
              ),
            ),
            SizedBox(height: spacing_xl),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
              child: Text(
                '''보상 상품을 받기 위한 정보를 입력해 주세요.
*해당 정보 오 입력시 플리닉 카카오톡 채널로 문의해 주세요. 이미 발송된 상태에선 수정불가 하니 한번 더 확인 후 저장해주세요.*''',
                style: TextStyle(
                  fontFamily: 'NotoSans',
                  color: grey_1,
                  fontSize: 12,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            SizedBox(height: spacing_xl),
            Container(
              width: Get.mediaQuery.size.width,
              height: 48,
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(horizontal: spacing_xl),
              color: grey_3,
              child: Text(
                '수령정보',
                style: TextStyle(
                  fontFamily: 'NotoSans',
                  color: black,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.normal,
                ),
              ),
            ),
            SizedBox(height: spacing_xl),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
              child: Row(
                children: [
                  Text(
                    '받는사람',
                    style: TextStyle(
                      fontFamily: 'NotoSans',
                      color: black,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: spacing_s),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
              child: Container(
                // height: 48,
                child: TextField(
                  controller:
                      CareChallengeRewardController.to.toNameTextController,
                  onChanged: (value) {
                    // checkForm();
                    // _controller1.text = value;
                  },
                  // textAlignVertical: TextAlignVertical.center,
                  // keyboardType: TextInputType.text,
                  style: TextStyle(
                    fontFamily: 'NotoSans',
                    color: black,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                  ),
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(8),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: grey_2, width: 0.5),
                    ),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red, width: 1)),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: grey_1, width: 0.5),
                    ),
                    hintText: '이름을 입력해주세요',
                    hintStyle: TextStyle(
                      fontFamily: 'NotoSans',
                      color: textfields,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: spacing_l),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
              child: Row(
                children: [
                  buildText('주소'),
                ],
              ),
            ),
            SizedBox(height: spacing_xs),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
              child: Row(
                children: [
                  Flexible(
                    flex: 2,
                    child: Container(
                      child: TextField(
                        controller: CareChallengeRewardController
                            .to.address1TextController,
                        // onChanged: (value) {
                        //   checkForm();
                        // },
                        keyboardType: TextInputType.text,
                        style: TextStyle(
                          fontFamily: 'NotoSans',
                          color: black,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                        ),
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(8),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: grey_2, width: 0.5),
                            ),
                            border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.red, width: 1)),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: grey_1, width: 0.5),
                            ),
                            hintText: '주소찾기를 눌러주세요',
                            hintStyle: TextStyle(
                                color: textfields,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'NotoSans',
                                fontStyle: FontStyle.normal,
                                fontSize: 12.0),
                            filled: true,
                            fillColor: white,
                            enabled: false),
                      ),
                    ),
                  ),
                  SizedBox(width: spacing_xs),
                  Flexible(
                      flex: 1,
                      child: Container(
                        child: findPostButton(),
                      ))
                ],
              ),
            ),
            SizedBox(height: spacing_xs),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
              child: Row(
                children: [
                  Flexible(
                    flex: 2,
                    child: Container(
                      child: TextField(
                        controller: CareChallengeRewardController
                            .to.address2TextController,
                        // onChanged: (value) {
                        //   checkForm();
                        // },
                        // readOnly: true,
                        keyboardType: TextInputType.text,
                        style: TextStyle(
                          fontFamily: 'NotoSans',
                          color: black,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                        ),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(8),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: grey_2, width: 1),
                          ),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: grey_1, width: 1)),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: grey_1, width: 1),
                          ),
                          hintText: '상세정보를 입력해주세요',
                          hintStyle: TextStyle(
                            fontFamily: 'NotoSans',
                            color: textfields,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                          ),
                          filled: true,
                          fillColor: grey_3,
                          enabled: true,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: spacing_l),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
              child: Row(
                children: [
                  buildText('휴대폰'),
                ],
              ),
            ),
            SizedBox(height: spacing_s),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
              child: TextField(
                controller:
                    CareChallengeRewardController.to.phoneTextController,
                textAlignVertical: TextAlignVertical.center,
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  // checkForm();
                },
                style: TextStyle(
                  fontFamily: 'NotoSans',
                  color: black,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                ),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(8),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: grey_2, width: 0.5),
                  ),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red, width: 1)),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: grey_1, width: 0.5),
                  ),
                  hintText: '휴대폰번호를 입력해주세요',
                  hintStyle: TextStyle(
                    fontFamily: 'NotoSans',
                    color: textfields,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                  ),
                ),
              ),
            ),
            SizedBox(height: spacing_l),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
              child: Row(
                children: [
                  buildText('배송메시지'),
                ],
              ),
            ),
            SizedBox(height: spacing_s),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
              child: TextField(
                controller:
                    CareChallengeRewardController.to.deliverMsgTextController,
                textAlignVertical: TextAlignVertical.center,
                keyboardType: TextInputType.text,
                onChanged: (value) {
                  // checkForm();
                },
                style: TextStyle(
                  fontFamily: 'NotoSans',
                  color: black,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                ),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(8),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: grey_2, width: 0.5),
                  ),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red, width: 1)),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: grey_1, width: 0.5),
                  ),
                  hintText: '예)부재시 경비실에 맡겨주세요',
                  hintStyle: TextStyle(
                    fontFamily: 'NotoSans',
                    color: textfields,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                  ),
                ),
              ),
            ),
            SizedBox(height: spacing_xl),
            Obx(
              () => CareChallengeRewardController.to.pushSaveButton.value
                  ? saveCompBtn(challengeModel, context)
                  : saveBtn(challengeModel, context),
            ),
          ],
        ),
      ),
    );
  }

  Widget saveBtn(ChallengeModel challengeModel, BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          elevation: MaterialStateProperty.all(0.0),
          shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.zero)),
          side: MaterialStateProperty.all(BorderSide(color: primary)),
          minimumSize: MaterialStateProperty.all(
            Size(Get.mediaQuery.size.width, 60),
          ),
          backgroundColor: MaterialStateProperty.all(primary)),
      onPressed: () async {
        CareChallengeRewardController.to.pushButton(true);
        await CareChallengeRewardController.to
            .saveReward(RewardModel(
          uid: ProfileController.to.myProfile.value.uid,
          email: ProfileController.to.myProfile.value.email,
          toName: CareChallengeRewardController.to.toNameTextController!.text,
          address1:
              CareChallengeRewardController.to.address1TextController!.text,
          address2:
              CareChallengeRewardController.to.address2TextController!.text,
          deliverMsg:
              CareChallengeRewardController.to.deliverMsgTextController!.text,
          phone: CareChallengeRewardController.to.phoneTextController!.text,
          postNumber: postNumber,
          productName: challengeModel.rewardName,
          challengeId: challengeModel.id,
        ))
            .then((value) async {
          await Get.offAll(() => CareRewardCompletedPage());
        }).catchError((e) {
          CareChallengeRewardController.to.pushButton(false);
          errorDialog(context, '저장 오류', '보상 정보가 저장에\n실패하였습니다\n관리자에게 문의해주세요');
        });
      },
      child: AutoSizeText(
        '저장하기',
        minFontSize: 14,
        maxFontSize: 16,
        style: TextStyle(
          fontFamily: 'NotoSans',
          color: white,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
        ),
      ),
    );
  }

  Widget saveCompBtn(ChallengeModel challengeModel, BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          elevation: MaterialStateProperty.all(0.0),
          shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.zero)),
          side: MaterialStateProperty.all(BorderSide(color: primary)),
          minimumSize: MaterialStateProperty.all(
            Size(Get.mediaQuery.size.width, 60),
          ),
          backgroundColor: MaterialStateProperty.all(primary)),
      onPressed: () {},
      child: AutoSizeText(
        '처리중...',
        minFontSize: 14,
        maxFontSize: 16,
        style: TextStyle(
          fontFamily: 'NotoSans',
          color: white,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
        ),
      ),
    );
  }

  Widget buildEmptyBody(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.focusScope!.unfocus();
      },
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: Get.mediaQuery.size.width,
              height: 48,
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(horizontal: spacing_xl),
              color: grey_3,
              child: Text(
                '상품정보',
                style: TextStyle(
                  fontFamily: 'NotoSans',
                  color: black,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.normal,
                ),
              ),
            ),
            SizedBox(height: spacing_l),
            Container(
              padding: EdgeInsets.symmetric(horizontal: spacing_xl),
              // color: Colors.yellow,
              child: Row(
                children: [
                  Image.asset(
                    'assets/images/care/rewardSmallImage.png',
                    width: Get.mediaQuery.size.width * 0.187,
                    fit: BoxFit.fitWidth,
                  ),
                  SizedBox(width: spacing_l),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '커피쿠폰 챌린지',
                        style: TextStyle(
                          fontFamily: 'NotoSans',
                          color: black,
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                      SizedBox(height: spacing_xs),
                      Text(
                        '매일 2분30초씩 20일\n사용 성공시 아메리카노 증정! ',
                        style: TextStyle(
                          fontFamily: 'NotoSans',
                          color: black,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: spacing_l),
            Container(
              padding: EdgeInsets.symmetric(horizontal: spacing_xl),
              alignment: Alignment.centerLeft,
              child: Text(
                '챌린지 성공을 축하드립니다 💜',
                style: TextStyle(
                  fontFamily: 'NotoSans',
                  color: black,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.normal,
                ),
              ),
            ),
            SizedBox(height: spacing_xl),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
              child: Text(
                '''보상 상품을 받기 위한 정보를 입력해 주세요.
*해당 정보 오 입력시 플리닉 카카오톡 채널로 문의해 주세요. 이미 발송된 상태에선 수정불가 하니 한번 더 확인 후 저장해주세요.*''',
                style: TextStyle(
                  fontFamily: 'NotoSans',
                  color: grey_1,
                  fontSize: 12,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            SizedBox(height: spacing_xl),
            Container(
              width: Get.mediaQuery.size.width,
              height: 48,
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(horizontal: spacing_xl),
              color: grey_3,
              child: Text(
                '수령정보',
                style: TextStyle(
                  fontFamily: 'NotoSans',
                  color: black,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.normal,
                ),
              ),
            ),
            SizedBox(height: spacing_xl),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
              child: Row(
                children: [
                  Text(
                    '받는사람',
                    style: TextStyle(
                      fontFamily: 'NotoSans',
                      color: black,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: spacing_s),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
              child: Container(
                // height: 48,
                child: TextField(
                  controller:
                      CareChallengeRewardController.to.toNameTextController,
                  onChanged: (value) {
                    // checkForm();
                    // _controller1.text = value;
                  },
                  // textAlignVertical: TextAlignVertical.center,
                  // keyboardType: TextInputType.text,
                  style: TextStyle(
                    fontFamily: 'NotoSans',
                    color: black,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                  ),
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(8),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: grey_2, width: 0.5),
                    ),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red, width: 1)),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: grey_1, width: 0.5),
                    ),
                    hintText: '이름을 입력해주세요',
                    hintStyle: TextStyle(
                      fontFamily: 'NotoSans',
                      color: textfields,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: spacing_l),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
              child: Row(
                children: [
                  buildText('주소'),
                ],
              ),
            ),
            SizedBox(height: spacing_xs),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
              child: Row(
                children: [
                  Flexible(
                    flex: 2,
                    child: Container(
                      child: TextField(
                        controller: CareChallengeRewardController
                            .to.address1TextController,
                        // onChanged: (value) {
                        //   checkForm();
                        // },
                        keyboardType: TextInputType.text,
                        style: TextStyle(
                          fontFamily: 'NotoSans',
                          color: black,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                        ),
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(8),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: grey_2, width: 0.5),
                            ),
                            border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.red, width: 1)),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: grey_1, width: 0.5),
                            ),
                            hintText: '주소찾기를 눌러주세요',
                            hintStyle: TextStyle(
                                color: textfields,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'NotoSans',
                                fontStyle: FontStyle.normal,
                                fontSize: 12.0),
                            filled: true,
                            fillColor: white,
                            enabled: false),
                      ),
                    ),
                  ),
                  SizedBox(width: spacing_xs),
                  Flexible(
                      flex: 1,
                      child: Container(
                        child: findPostButton(),
                      ))
                ],
              ),
            ),
            SizedBox(height: spacing_xs),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
              child: Row(
                children: [
                  Flexible(
                    flex: 2,
                    child: Container(
                      child: TextField(
                        controller: CareChallengeRewardController
                            .to.address2TextController,
                        // onChanged: (value) {
                        //   checkForm();
                        // },
                        // readOnly: true,
                        keyboardType: TextInputType.text,
                        style: TextStyle(
                          fontFamily: 'NotoSans',
                          color: black,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                        ),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(8),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: grey_2, width: 1),
                          ),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: grey_1, width: 1)),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: grey_1, width: 1),
                          ),
                          hintText: '상세정보를 입력해주세요',
                          hintStyle: TextStyle(
                            fontFamily: 'NotoSans',
                            color: textfields,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                          ),
                          filled: true,
                          fillColor: grey_3,
                          enabled: true,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: spacing_l),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
              child: Row(
                children: [
                  buildText('휴대폰'),
                ],
              ),
            ),
            SizedBox(height: spacing_s),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
              child: TextField(
                controller:
                    CareChallengeRewardController.to.phoneTextController,
                textAlignVertical: TextAlignVertical.center,
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  // checkForm();
                },
                style: TextStyle(
                  fontFamily: 'NotoSans',
                  color: black,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                ),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(8),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: grey_2, width: 0.5),
                  ),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red, width: 1)),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: grey_1, width: 0.5),
                  ),
                  hintText: '휴대폰번호를 입력해주세요',
                  hintStyle: TextStyle(
                    fontFamily: 'NotoSans',
                    color: textfields,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                  ),
                ),
              ),
            ),
            SizedBox(height: spacing_l),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
              child: Row(
                children: [
                  buildText('배송메시지'),
                ],
              ),
            ),
            SizedBox(height: spacing_s),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
              child: TextField(
                controller:
                    CareChallengeRewardController.to.deliverMsgTextController,
                textAlignVertical: TextAlignVertical.center,
                keyboardType: TextInputType.text,
                onChanged: (value) {
                  // checkForm();
                },
                style: TextStyle(
                  fontFamily: 'NotoSans',
                  color: black,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                ),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(8),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: grey_2, width: 0.5),
                  ),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red, width: 1)),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: grey_1, width: 0.5),
                  ),
                  hintText: '예)부재시 경비실에 맡겨주세요',
                  hintStyle: TextStyle(
                    fontFamily: 'NotoSans',
                    color: textfields,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                  ),
                ),
              ),
            ),
            SizedBox(height: spacing_xl),
            ElevatedButton(
              style: ButtonStyle(
                  elevation: MaterialStateProperty.all(0.0),
                  shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(borderRadius: BorderRadius.zero)),
                  side: MaterialStateProperty.all(BorderSide(color: primary)),
                  minimumSize: MaterialStateProperty.all(
                    Size(Get.mediaQuery.size.width, 60),
                  ),
                  backgroundColor: MaterialStateProperty.all(primary)),
              onPressed: () async {
                await CareChallengeRewardController.to
                    .saveReward(RewardModel(
                  uid: ProfileController.to.myProfile.value.uid,
                  email: ProfileController.to.myProfile.value.email,
                  toName: CareChallengeRewardController
                      .to.toNameTextController!.text,
                  address1: CareChallengeRewardController
                      .to.address1TextController!.text,
                  address2: CareChallengeRewardController
                      .to.address2TextController!.text,
                  deliverMsg: CareChallengeRewardController
                      .to.deliverMsgTextController!.text,
                  phone: CareChallengeRewardController
                      .to.phoneTextController!.text,
                  postNumber: postNumber,
                  productName: challengeModel!.rewardName,
                  challengeId: challengeModel!.id,
                ))
                    .then((value) async {
                  await Get.offAll(() => CareRewardCompletedPage());
                }).catchError((e) {
                  errorDialog(
                      context, '저장 오류', '보상 정보가 저장에\n실패하였습니다\n관리자에게 문의해주세요');
                });
              },
              child: AutoSizeText(
                '저장하기',
                minFontSize: 14,
                maxFontSize: 16,
                style: TextStyle(
                  fontFamily: 'NotoSans',
                  color: white,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void errorDialog(context, title, content) async {
    await showAnimatedDialog(
      context: context,
      barrierDismissible: true,
      animationType: DialogTransitionType.fade,
      curve: Curves.easeIn,
      builder: (BuildContext context) {
        return PlinicDialogOneButton(
          title: title,
          content: content,
          buttonText: '확인',
          buttonClick: () {
            Get.back();
          },
        );
      },
    );
  }

  void completedDialog(context, title, content) async {
    await showAnimatedDialog(
      context: context,
      barrierDismissible: false,
      animationType: DialogTransitionType.fade,
      curve: Curves.easeIn,
      builder: (BuildContext context) {
        return PlinicDialogOneButton(
          title: title,
          content: content,
          buttonText: '확인',
          buttonClick: () async {
            Get.back();
            await Get.toNamed('/app');
          },
        );
      },
    );
  }

  Text buildText(String title) {
    return Text(
      title,
      style: TextStyle(
        fontFamily: 'NotoSansKR',
        color: black,
        fontSize: 14,
        fontWeight: FontWeight.w700,
        fontStyle: FontStyle.normal,
      ),
    );
  }

  Widget findPostButton() {
    return Container(
      height: 48,
      width: 200,
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(primaryColor)),
        onPressed: () async {
          var value = await Get.to(() => AddressSearchPage());
          if (value != null) {
            Map<String, dynamic> value2 = json.decode(value);
            print(value2['address']);
            print(value2['buildingName']);
            CareChallengeRewardController.to.address1TextController!.text =
                value2['address'];
            CareChallengeRewardController.to.address2TextController!.text =
                value2['buildingName'] != '' ? value2['buildingName'] : '';
            if (value2['zonecode'] != null && value2['zonecode'] != '') {
              postNumber = value2['zonecode'].toString();
            }
            // setState(() {
            //   _controller2.text = value2['address'];
            //   _controller3.text =
            //       value2['buildingName'] != '' ? value2['buildingName'] : '';
            //   // _controller1.text = value.bname.toString();
            //   // _controller1.text = value.bname.toString();
            // });
          }
        },
        child: Text(
          '주소찾기',
          style: TextStyle(
            fontFamily: 'NotoSansKR',
            color: white,
            fontSize: 13,
            fontWeight: FontWeight.w700,
            fontStyle: FontStyle.normal,
          ),
        ),
      ),
    );
  }
}
