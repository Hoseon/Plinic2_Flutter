import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:line_icons/line_icons.dart';
import 'package:plinic2/constants.dart';
import 'package:plinic2/src/controller/care/monthly_care_controller.dart';
import 'package:plinic2/src/controller/profile_controller.dart';
import 'package:plinic2/src/pages/care/care_challenge.dart';
import 'package:plinic2/src/restclient/ChallengeClient.dart';
import 'package:plinic2/src/restclient/DeviceCountClient.dart';
import 'package:plinic2/src/restclient/DeviceLogClient.dart';
import 'package:shimmer/shimmer.dart';

class MonthlyCarePage extends GetView<MonthlyCareController> {
  MonthlyCarePage({Key? key}) : super(key: key);
  Dio dio = Dio();

  @override
  Widget build(BuildContext context) {
    var monthClient = DeviceCountClient(dio);
    Get.put<MonthlyCareController>(MonthlyCareController());

    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: spacing_xl),
          alignment: Alignment.centerLeft,
          child: AutoSizeText(
            '케어 챌린지',
            style: TextStyle(
              fontFamily: 'NotoSans',
              color: black,
              fontSize: 16,
              fontWeight: FontWeight.w700,
              fontStyle: FontStyle.normal,
            ),
          ),
        ),
        SizedBox(height: spacing_xxl),
        buildMain(monthClient)
      ],
    );
  }

  Widget buildMain(DeviceCountClient monthClient) {
    return FutureBuilder(
        future: controller.getFindIng(),
        builder: (_, AsyncSnapshot snapshot) {
          if (controller.isLoading.value == false) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return loading();
            }
            if (snapshot.hasData &&
                (snapshot.data as ChallengeModel).id != null) {
              return buildBody(snapshot.data, monthClient);
            } else {
              return buildEmptyBody();
            }
          } else {
            return loading();
          }
        });
  }

  Widget buildEmptyBody() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: spacing_xl),
      width: Get.mediaQuery.size.width,
      height: 172,
      alignment: Alignment.center,
      child: Text(
        '현재 진행중인 챌린지 존재하지 않습니다.\n아래 오픈 예정 챌린지를 기대해주세요.',
        style: TextStyle(
          fontFamily: 'NotoSans',
          color: grey_1,
          fontSize: 12,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
        ),
      ),
    );
  }

  Widget buildBody(ChallengeModel data, DeviceCountClient monthClient) {
    var client = DeviceLogClient(dio);
    var startAt = data.startAt!.add(Duration(hours: 9));
    var endAt = data.endAt!.add(Duration(hours: 9));
    var dDay = endAt.difference(DateTime.now());

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
      child: Row(
        children: [
          InkWell(
            onTap: () async {
              await Get.to(() => CareChallengePage(id: data.id));
            },
            child: Stack(alignment: Alignment.topRight, children: [
              Container(
                width: Get.mediaQuery.size.width * 0.352,
                height: Get.mediaQuery.size.height * 0.212,
                color: Colors.pinkAccent,
                child: CachedNetworkImage(
                    imageUrl: data.img1_url!,
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
                    fit: BoxFit.fitWidth),
              ),
              Positioned(
                right: spacing_xxs,
                top: spacing_xxs,
                child: Container(
                  width: Get.mediaQuery.size.width * 0.123,
                  height: Get.mediaQuery.size.height * 0.025,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                    color: grey_1,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        LineIcons.user,
                        size: 18,
                        color: white,
                      ),
                      SizedBox(width: 1),
                      FutureBuilder(
                        future: client.getAllUseTimeCount(),
                        builder: (_, AsyncSnapshot snapshot) {
                          if (snapshot.hasData) {
                            var data = (snapshot.data
                                as List<AllUseTimeCountResponse>);
                            if (data.isNotEmpty) {
                              return AutoSizeText(
                                data[0].monthTimeUseCount.toString(),
                                style: TextStyle(
                                  fontFamily: 'NotoSans',
                                  color: white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                ),
                              );
                            } else {
                              return AutoSizeText(
                                '00',
                                style: TextStyle(
                                  fontFamily: 'NotoSans',
                                  color: white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                ),
                              );
                            }
                          } else {
                            return AutoSizeText(
                              '00',
                              style: TextStyle(
                                fontFamily: 'NotoSans',
                                color: white,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                              ),
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ]),
          ),
          SizedBox(width: spacing_m),
          InkWell(
            onTap: () async {
              await Get.to(() => CareChallengePage(id: data.id));
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AutoSizeText(
                  data.title!,
                  style: TextStyle(
                    fontFamily: 'NotoSans',
                    color: black,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal,
                  ),
                ),
                SizedBox(height: spacing_xs),
                Container(
                  width: Get.mediaQuery.size.width * 0.4,
                  child: AutoSizeText(
                    data.desc!,
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
                ),
                SizedBox(height: spacing_s),
                Container(
                  width: Get.mediaQuery.size.width * 0.45,
                  child: RichText(
                    overflow: TextOverflow.ellipsis,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text:
                              '${data.startAt!.add(Duration(hours: 9)).toString().substring(0, 10).replaceAll('-', '.')} - ${data.endAt!.add(Duration(hours: 9)).toString().substring(0, 10).replaceAll('-', '.')}',
                          style: TextStyle(
                            fontFamily: 'NotoSans',
                            color: black,
                            fontSize: 11,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                        TextSpan(
                          text: '(D-${dDay.inDays.toString()})',
                          style: TextStyle(
                            fontFamily: 'NotoSans',
                            color: primary,
                            fontSize: 11,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: spacing_l),
                Container(
                  width: Get.mediaQuery.size.width * 0.44,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Obx(() => ProfileController.to.myProfile.value.uid != null
                          ? FutureBuilder(
                              future: monthClient.getMonthCount(
                                  ProfileController.to.myProfile.value.uid
                                      .toString()),
                              builder: (_, AsyncSnapshot snapshot) {
                                if (snapshot.hasData) {
                                  var monthCount = (snapshot.data
                                      as List<MonthCountResponse>);
                                  if (monthCount.isNotEmpty) {
                                    return AutoSizeText(
                                      '${monthCount[0].myMonthCount.toString()}일',
                                      style: TextStyle(
                                        fontFamily: 'NotoSans',
                                        color: black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700,
                                        fontStyle: FontStyle.normal,
                                      ),
                                    );
                                  } else {
                                    return AutoSizeText(
                                      '0일',
                                      style: TextStyle(
                                        fontFamily: 'NotoSans',
                                        color: black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700,
                                        fontStyle: FontStyle.normal,
                                      ),
                                    );
                                  }
                                }
                                return SizedBox();
                              },
                            )
                          : SizedBox()),
                      AutoSizeText('${data.useDay}일',
                          style: TextStyle(
                            fontFamily: 'NotoSans',
                            color: grey_1,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                          ))
                    ],
                  ),
                ),
                SizedBox(height: spacing_xs),
                Obx(
                  () => ProfileController.to.myProfile.value.uid != null
                      ? FutureBuilder(
                          future: monthClient.getMonthCount(ProfileController
                              .to.myProfile.value.uid
                              .toString()),
                          builder: (_, AsyncSnapshot snapshot) {
                            if (snapshot.hasData) {
                              var monthData =
                                  (snapshot.data as List<MonthCountResponse>);

                              if (monthData.isNotEmpty) {
                                var progressValue =
                                    monthData[0].myMonthCount!.toInt() /
                                        data.useDay!.toInt();
                                return Container(
                                  width: Get.mediaQuery.size.width * 0.44,
                                  child: ClipRRect(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    child: LinearProgressIndicator(
                                      value: progressValue,
                                      color: primary_dark,
                                      backgroundColor: grey_2,
                                      minHeight: 4.5,
                                    ),
                                  ),
                                );
                              } else {
                                return Container(
                                  width: Get.mediaQuery.size.width * 0.44,
                                  child: ClipRRect(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    child: LinearProgressIndicator(
                                      value: 0.0,
                                      color: primary_dark,
                                      backgroundColor: grey_2,
                                      minHeight: 4.5,
                                    ),
                                  ),
                                );
                              }
                            }
                            return SizedBox();
                          },
                        )
                      : SizedBox(),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget loading() {
    return Center(
      child: SpinKitCubeGrid(
        duration: Duration(seconds: 2),
        size: 70,
        color: primary,
      ),
    );
  }
}
