import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:bootpay/bootpay.dart';
import 'package:bootpay/model/extra.dart';
import 'package:bootpay/model/payload.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:plinic2/constants.dart';
import 'package:plinic2/src/component/custom_appbar.dart';
import 'package:plinic2/src/component/loading.dart';
import 'package:plinic2/src/component/plinic_dialog_two_button.dart';
import 'package:plinic2/src/config/environment.dart';
import 'package:plinic2/src/controller/care/care_challenge_deatil_controller.dart';
import 'package:plinic2/src/controller/care/care_main_controller.dart';
import 'package:plinic2/src/controller/profile_controller.dart';
import 'package:plinic2/src/pages/ble_connect/components/all_confetti.dart';
import 'package:plinic2/src/pages/care/care_challenge_reward.dart';
import 'package:plinic2/src/pages/plinic_fab.dart';
import 'package:plinic2/src/restclient/ChallengeClient.dart';
import 'package:plinic2/src/restclient/DeviceCountClient.dart';
import 'package:plinic2/src/restclient/DeviceLogClient.dart';
import 'package:plinic2/src/restclient/RewardClient.dart';
import 'package:plinic2/src/restclient/UserClient.dart';
import 'package:shimmer/shimmer.dart';

class CareChallengePage extends GetView<CareChallDetailController> {
  CareChallengePage({Key? key, this.id}) : super(key: key);
  final String? id;
  Dio dio = Dio();

  @override
  Widget build(BuildContext context) {
    Get.put<CareChallDetailController>(CareChallDetailController());
    return Scaffold(
      appBar: CustomAppbar('챌린지'),
      backgroundColor: white,
      body: NotificationListener<UserScrollNotification>(
        onNotification: (notification) {
          if (notification.direction == ScrollDirection.forward) {
            CareMainController.to.isFabVisible(false);
          } else if (notification.direction == ScrollDirection.reverse) {
            CareMainController.to.isFabVisible(false);
          } else if (notification.direction == ScrollDirection.idle) {
            CareMainController.to.isFabVisible(true);
          }
          return true;
        },
        child: FutureBuilder(
          future: controller.findOne(id!),
          builder: (_, AsyncSnapshot snapshot) {
            if (controller.isLoading.value) {
              return LoadingPage();
            } else {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return LoadingPage();
              }
              if (snapshot.hasData) {
                return buildBody(context, snapshot.data);
                // return buildBody(context, snapshot.data);
              }
            }
            return LoadingPage();
          },
        ),
      ),
      floatingActionButton: Obx(
        () => Visibility(
            visible: CareMainController.to.isFabVisible.value,
            child: PlinicFaB()),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget buildBody(BuildContext context, ChallengeModel data) {
    print(data.useDay);
    var client = DeviceLogClient(dio);
    var deviceCC = DeviceCountClient(dio);
    var checkRewardClient = RewardClient(dio);
    return FutureBuilder(
      future: checkRewardClient.findCheckReward(
          ProfileController.to.myProfile.value.uid!, data.id!),
      builder: (_, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return buildMain(data, client, deviceCC, context, true);
        }
        return buildMain(data, client, deviceCC, context, false);
      },
    );
  }

  SingleChildScrollView buildMain(ChallengeModel data, DeviceLogClient client,
      DeviceCountClient deviceCC, BuildContext context, bool isRewarded) {
    return SingleChildScrollView(
      child: Column(
        children: [
          CachedNetworkImage(
            width: Get.mediaQuery.size.width,
            height: 172,
            fit: BoxFit.fitWidth,
            imageUrl: data.img2_url!,
            placeholder: (_, url) => Shimmer.fromColors(
              direction: ShimmerDirection.ltr,
              period: Duration(seconds: 2),
              baseColor: grey_3,
              highlightColor: Colors.grey.shade300,
              child: Container(
                width: Get.mediaQuery.size.width,
                height: 520,
                color: grey_2,
              ),
            ),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
          SizedBox(height: spacing_xxl),
          Container(
            padding: EdgeInsets.symmetric(horizontal: spacing_xl),
            alignment: Alignment.centerLeft,
            child: Text(
              data.title!,
              style: TextStyle(
                fontFamily: 'NotoSans',
                color: black,
                fontSize: 18,
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.normal,
              ),
            ),
          ),
          SizedBox(height: spacing_xxs),
          FutureBuilder(
              future: client.getAllUseTimeCount(),
              builder: (_, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  var data = (snapshot.data as List<AllUseTimeCountResponse>);
                  return data.isNotEmpty
                      ? Container(
                          padding: EdgeInsets.symmetric(horizontal: spacing_xl),
                          alignment: Alignment.centerLeft,
                          child: Text(
                              '많은 분들이 현재 ${data[0].monthTimeUseCount}회 도전 중이예요👍',
                              style: TextStyle(
                                fontFamily: 'NotoSans',
                                color: black,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                              )),
                        )
                      : Container(
                          padding: EdgeInsets.symmetric(horizontal: spacing_xl),
                          alignment: Alignment.centerLeft,
                          child: Text('많은 분들이 현재 00회 도전 중이예요👍',
                              style: TextStyle(
                                fontFamily: 'NotoSans',
                                color: black,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                              )),
                        );
                }
                return Container(
                  padding: EdgeInsets.symmetric(horizontal: spacing_xl),
                  alignment: Alignment.centerLeft,
                  child: Text('많은 분들이 현재 00회 도전 중이예요👍',
                      style: TextStyle(
                        fontFamily: 'NotoSans',
                        color: black,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      )),
                );
              }),
          SizedBox(height: spacing_l),
          FutureBuilder(
              future: deviceCC.getMonthCount(
                  ProfileController.to.myProfile.value.uid.toString()),
              builder: (_, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  var monthCountdata =
                      (snapshot.data as List<MonthCountResponse>);
                  if (monthCountdata.isNotEmpty) {
                    if (data.useDay == monthCountdata[0].myMonthCount) {
                      if (isRewarded) {
                        //보상받은적이 있다면 완료 버튼을
                        return rewardCompletedButton(context);
                      } else {
                        //보상받은적이 없다면 보상받기 버튼을 제공
                        return AllConfettiWidget(
                            child: completedButton(context, data));
                        // return completedButton(context, data);
                      }
                    } else {
                      return inCompletedButton(context);
                    }
                  } else {
                    return inCompletedButton(context);
                  }
                }
                return inCompletedButton(context);
              }),
          // inCompletedButton(context),
          // completedButton(context, data),
          SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
            child: Column(
              children: [
                Row(
                  children: [
                    Icon(LineIcons.calendarCheck, color: black, size: 20),
                    SizedBox(width: 7.1),
                    AutoSizeText(
                      '참여기간',
                      minFontSize: 10,
                      maxFontSize: 14,
                      style: TextStyle(
                        fontFamily: 'NotoSans',
                        color: black,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                    SizedBox(width: spacing_m),
                    AutoSizeText(
                      '${data.startAt!.add(Duration(hours: 9)).toString().substring(0, 10).replaceAll('-', '.')} - ${data.endAt!.add(Duration(hours: 9)).toString().substring(0, 10).replaceAll('-', '.')}',
                      // '2022.03.01 - 2022.03.31',
                      minFontSize: 10,
                      maxFontSize: 14,
                      style: TextStyle(
                        fontFamily: 'NotoSans',
                        color: grey_1,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                    AutoSizeText(
                      // var dDay = endAt.difference(DateTime.now());
                      '(D-${data.endAt!.add(Duration(hours: 9)).difference(DateTime.now()).inDays.toString()})',
                      minFontSize: 10,
                      maxFontSize: 14,
                      style: TextStyle(
                        fontFamily: 'NotoSans',
                        color: primary,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: spacing_xs),
                Row(
                  children: [
                    Icon(LineIcons.award, color: black, size: 20),
                    SizedBox(width: 7.1),
                    AutoSizeText(
                      '성공조건',
                      minFontSize: 10,
                      maxFontSize: 14,
                      style: TextStyle(
                        fontFamily: 'NotoSans',
                        color: black,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                    SizedBox(width: spacing_m),
                    AutoSizeText(
                      '${data.useDay}일 (매일 2분 30초씩)',
                      minFontSize: 10,
                      maxFontSize: 14,
                      style: TextStyle(
                        fontFamily: 'NotoSans',
                        color: grey_1,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: spacing_xs),
                Row(
                  children: [
                    Icon(LineIcons.gift, color: black, size: 20),
                    SizedBox(width: 7.1),
                    AutoSizeText(
                      '보상상품',
                      minFontSize: 10,
                      maxFontSize: 14,
                      style: TextStyle(
                        fontFamily: 'NotoSans',
                        color: black,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                    SizedBox(width: spacing_m),
                    Container(
                      width: Get.mediaQuery.size.width * 0.6,
                      child: AutoSizeText(
                        data.rewardName!,
                        minFontSize: 10,
                        maxFontSize: 14,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontFamily: 'NotoSans',
                          color: grey_1,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          SizedBox(height: spacing_xl),
          divider(),
          SizedBox(height: spacing_xl),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
            child: Row(
              children: [
                Icon(
                  LineIcons.infoCircle,
                  color: black,
                  size: 20,
                ),
                SizedBox(width: spacing_xs),
                AutoSizeText(
                  '필독해주세요.',
                  minFontSize: 10,
                  maxFontSize: 14,
                  style: TextStyle(
                    fontFamily: 'NotoSans',
                    color: Color(0xff000000),
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: spacing_xs),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              children: [
                Text('•', style: TextStyle(color: grey_1)),
                SizedBox(width: spacing_xxs),
                AutoSizeText('플리닉 디바이스 보유 회원만 참여가 가능합니다.',
                    minFontSize: 10,
                    maxFontSize: 14,
                    style: TextStyle(
                      fontFamily: 'NotoSans',
                      color: grey_1,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    ))
              ],
            ),
          ),
          SizedBox(height: 3),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              children: [
                Text('•', style: TextStyle(color: grey_1)),
                SizedBox(width: spacing_xxs),
                AutoSizeText('성공하면 상품 배송정보가 요구됩니다.',
                    minFontSize: 10,
                    maxFontSize: 14,
                    style: TextStyle(
                      fontFamily: 'NotoSans',
                      color: grey_1,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    ))
              ],
            ),
          ),
          SizedBox(height: 3),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              children: [
                Text('•', style: TextStyle(color: grey_1)),
                SizedBox(width: spacing_xxs),
                AutoSizeText('비정상적인 참여/계정은 제재가 있을 수 있습니다.',
                    minFontSize: 10,
                    maxFontSize: 14,
                    style: TextStyle(
                      fontFamily: 'NotoSans',
                      color: grey_1,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    ))
              ],
            ),
          ),
          SizedBox(height: 3),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              children: [
                Text('•', style: TextStyle(color: grey_1)),
                SizedBox(width: spacing_xxs),
                AutoSizeText('보상 및 챌린지 정책은 언제든 변경 될 수 있습니다.',
                    minFontSize: 10,
                    maxFontSize: 14,
                    style: TextStyle(
                      fontFamily: 'NotoSans',
                      color: grey_1,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    ))
              ],
            ),
          ),
          SizedBox(height: 3),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              children: [
                Text('•', style: TextStyle(color: grey_1)),
                SizedBox(width: spacing_xxs),
                AutoSizeText('서버 장애로 인한 미적립은 복구가 불가합니다.',
                    minFontSize: 10,
                    maxFontSize: 14,
                    style: TextStyle(
                      fontFamily: 'NotoSans',
                      color: grey_1,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    ))
              ],
            ),
          ),
          SizedBox(height: spacing_xl),
          divider(),
          SizedBox(height: spacing_xl),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
            child: Row(
              children: [
                Icon(LineIcons.stickyNote, color: black, size: 20),
                SizedBox(width: spacing_xxs),
                AutoSizeText(
                  '상품상세정보',
                  minFontSize: 10,
                  maxFontSize: 14,
                  style: TextStyle(
                    fontFamily: 'NotoSans',
                    color: black,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal,
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: spacing_xs),
          Obx(
            () => controller.more.value
                ? CachedNetworkImage(
                    width: Get.mediaQuery.size.width,
                    // height: 800,
                    alignment: Alignment.topCenter,
                    fit: BoxFit.cover,
                    imageUrl: data.img3_url!,
                    placeholder: (_, url) => Shimmer.fromColors(
                      direction: ShimmerDirection.ltr,
                      period: Duration(seconds: 2),
                      baseColor: grey_3,
                      highlightColor: Colors.grey.shade300,
                      child: Container(
                        width: Get.mediaQuery.size.width,
                        height: 520,
                        color: grey_2,
                      ),
                    ),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  )
                : CachedNetworkImage(
                    width: Get.mediaQuery.size.width,
                    height: 800,
                    alignment: Alignment.topCenter,
                    fit: BoxFit.cover,
                    imageUrl: data.img3_url!,
                    placeholder: (_, url) => Shimmer.fromColors(
                      direction: ShimmerDirection.ltr,
                      period: Duration(seconds: 2),
                      baseColor: grey_3,
                      highlightColor: Colors.grey.shade300,
                      child: Container(
                        width: Get.mediaQuery.size.width,
                        height: 520,
                        color: grey_2,
                      ),
                    ),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
          ),
          SizedBox(height: spacing_xl),
          Obx(
            () => controller.more.value
                ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
                    child: ElevatedButton(
                      onPressed: () {
                        controller.toggleMore();
                      },
                      style: ButtonStyle(
                        minimumSize: MaterialStateProperty.all(
                            Size(Get.mediaQuery.size.width, 44)),
                        backgroundColor:
                            MaterialStateProperty.resolveWith<Color>(
                                (Set<MaterialState> states) {
                          if (states.contains(MaterialState.pressed)) {
                            return Colors.grey.shade200;
                          }
                          return white;
                        }),
                        elevation: MaterialStateProperty.all(0.0),
                        side: MaterialStateProperty.all(
                            BorderSide(color: grey_2)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          AutoSizeText(
                            '상세정보 접기',
                            minFontSize: 5,
                            maxFontSize: 12,
                            style: TextStyle(
                              fontFamily: 'NotoSans',
                              color: grey_1,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                            ),
                          ),
                          SizedBox(width: 15),
                          Icon(LineIcons.angleUp, size: 15, color: grey_1)
                        ],
                      ),
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
                    child: ElevatedButton(
                      onPressed: () {
                        controller.toggleMore();
                      },
                      style: ButtonStyle(
                        minimumSize: MaterialStateProperty.all(
                            Size(Get.mediaQuery.size.width, 44)),
                        backgroundColor:
                            MaterialStateProperty.resolveWith<Color>(
                                (Set<MaterialState> states) {
                          if (states.contains(MaterialState.pressed)) {
                            return Colors.grey.shade200;
                          }
                          return white;
                        }),
                        elevation: MaterialStateProperty.all(0.0),
                        side: MaterialStateProperty.all(
                            BorderSide(color: grey_2)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          AutoSizeText(
                            '상세정보 펼쳐보기',
                            minFontSize: 5,
                            maxFontSize: 12,
                            style: TextStyle(
                              fontFamily: 'NotoSans',
                              color: grey_1,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                            ),
                          ),
                          SizedBox(width: 15),
                          Icon(LineIcons.angleDown, size: 15, color: grey_1)
                        ],
                      ),
                    ),
                  ),
          ),
          SizedBox(height: 130),
        ],
      ),
    );
  }

  Widget inCompletedButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
      child: ElevatedButton(
        style: ButtonStyle(
          minimumSize: MaterialStateProperty.all(
            Size(Get.mediaQuery.size.width, 44),
          ),
          backgroundColor: MaterialStateProperty.all(grey_2),
          elevation: MaterialStateProperty.all(0.0),
        ),
        onPressed: () {},
        child: AutoSizeText(
          '보상 받으러가기',
          style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w400,
              fontFamily: 'NotoSans',
              fontStyle: FontStyle.normal,
              fontSize: 14.0),
          minFontSize: 1,
          maxFontSize: 14,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget rewardCompletedButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
      child: ElevatedButton(
        style: ButtonStyle(
          minimumSize: MaterialStateProperty.all(
            Size(Get.mediaQuery.size.width, 44),
          ),
          backgroundColor: MaterialStateProperty.all(grey_2),
          elevation: MaterialStateProperty.all(0.0),
        ),
        onPressed: () {},
        child: AutoSizeText(
          '보상 받기 완료',
          style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w400,
              fontFamily: 'NotoSans',
              fontStyle: FontStyle.normal,
              fontSize: 14.0),
          minFontSize: 1,
          maxFontSize: 14,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget completedButton(BuildContext context, ChallengeModel challengeModel) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
      child: ElevatedButton(
        style: ButtonStyle(
          minimumSize: MaterialStateProperty.all(
            Size(Get.mediaQuery.size.width, 44),
          ),
          backgroundColor: MaterialStateProperty.all(primary),
          elevation: MaterialStateProperty.all(0.0),
        ),
        onPressed: () async {
          // await Get.to(() => CareChallengeRewardPage());
          userAuthDialog(context, challengeModel);
        },
        child: AutoSizeText(
          '보상 받으러가기',
          style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w400,
              fontFamily: 'NotoSans',
              fontStyle: FontStyle.normal,
              fontSize: 14.0),
          minFontSize: 1,
          maxFontSize: 14,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Container divider() {
    return Container(
      width: Get.mediaQuery.size.width,
      height: 8,
      color: grey_3,
    );
  }

  void userAuthDialog(context, ChallengeModel challengeModel) async {
    await showAnimatedDialog(
      context: context,
      barrierDismissible: true,
      animationType: DialogTransitionType.fade,
      curve: Curves.easeIn,
      builder: (BuildContext context) {
        return PlinicDialogTwoButton(
          button1Text: '본인인증 하러가기',
          button2Text: '취소',
          title: '본인인증',
          content: '보상 상품 수령을 위해\n본인인증 페이지로 이동됩니다.',
          button1Click: () async {
            Get.back();
            goBootpayRequest(context, challengeModel);
          },
          button2Click: () {
            Get.back();
          },
        );
      },
    );
  }

  void goBootpayRequest(
      BuildContext context, ChallengeModel challengeModel) async {
    var payload = Payload();
    payload.androidApplicationId = '60e24e465b2948001ddc501b';
    payload.iosApplicationId = '60e24e465b2948001ddc501c';

    payload.pg = 'danal';
    payload.method = 'auth';
    payload.name = '본인인증';
    payload.orderId = DateTime.now().millisecondsSinceEpoch.toString();

    var extra = Extra();
    extra.appScheme = 'bootpaySample';

    Bootpay().request(
      context: context,
      payload: payload,
      onDone: (String json) async {
        Map<String, dynamic> test = jsonDecode(json); //String to Json으로 변환
        var test2 = UnRegisterModel.fromJson(test); //JSON PhonAuth모델화
        test2.uid = ProfileController.to.myProfile.value.uid;
        test2.email = ProfileController.to.myProfile.value.email;
        final client = RewardClient(dio);
        await client
            .checkUserAddress(ProfileController.to.myProfile.value.uid!)
            .then((value) async {
          await Get.to(() => CareChallengeRewardPage(
              userAddress: value, challengeModel: challengeModel));
        }).catchError((e) async {
          await Get.to(
              () => CareChallengeRewardPage(challengeModel: challengeModel));
        });
        // final client = UserClient(dio);
        //본인인증 1회도 한적이 없다면 본인인증 데이터 저장 api call
        // await client.savePhoneAuth(test2).then((value) {
        //   //처리가 완료 되면은 해당 페이지를 닫고 수정 페이지로 이동한다.
        //   Get.back();
        //   Get.to(() => EditProfilePage());
        // });
        Get.back();
      },
      onReady: (String json) {
        //flutter는 가상계좌가 발급되었을때  onReady가 호출되지 않는다. onDone에서 처리해주어야 한다.
        print('onReady: $json');
      },
      onCancel: (String json) {
        print('onCancel: $json');
        Get.back();
      },
      onError: (String json) {
        print('onError: $json');
        Get.back();
      },
    );
  }
}
