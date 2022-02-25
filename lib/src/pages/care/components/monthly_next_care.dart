import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:line_icons/line_icons.dart';
import 'package:plinic2/constants.dart';
import 'package:plinic2/src/config/environment.dart';
import 'package:plinic2/src/controller/care/monthly_care_controller.dart';
import 'package:plinic2/src/pages/care/care_challenge.dart';
import 'package:plinic2/src/restclient/ChallengeClient.dart';
import 'package:shimmer/shimmer.dart';

class MonthlyNextCarePage extends GetView<MonthlyCareController> {
  MonthlyNextCarePage({Key? key}) : super(key: key);
  Dio dio = Dio();
  ChallengeModel? _challengeModel;

  @override
  Widget build(BuildContext context) {
    Get.put<MonthlyCareController>(MonthlyCareController());

    return Column(
      children: [SizedBox(height: spacing_xxl), buildMain()],
    );
  }

  Widget buildMain() {
    return FutureBuilder(
        future: controller.getFindNext().then((value) {
          _challengeModel = value;
        }).catchError((e) {
          print('eeeeee');
        }),
        builder: (_, AsyncSnapshot snapshot) {
          if (controller.isNextLoading.value == false) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return loading();
            }
            if (_challengeModel != null) {
              return buildBody(_challengeModel!);
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
        '현재 넥스트 챌린지 존재하지 않습니다.\n다음 챌린지를 기대해주세요.',
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

  Widget buildBody(ChallengeModel data) {
    var startAt = data.startAt!.add(Duration(hours: 9));
    var endAt = data.endAt!.add(Duration(hours: 9));
    var dDay = endAt.difference(DateTime.now());

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
      child: Row(
        children: [
          InkWell(
            onTap: () async {
              // await Get.to(() => CareChallengePage());
            },
            child: Stack(alignment: Alignment.center, children: [
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
                    width: Get.mediaQuery.size.width,
                    // height: 82,
                    fit: BoxFit.fitWidth),
              ),
              Positioned(
                child: Container(
                  width: Get.mediaQuery.size.width * 0.352,
                  height: Get.mediaQuery.size.height * 0.212,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                    color: black.withOpacity(0.7),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '오픈예정',
                        style: TextStyle(
                          fontFamily: 'NotoSans',
                          color: white,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ]),
          ),
          SizedBox(width: spacing_m),
          InkWell(
            onTap: () async {
              // await Get.to(() => CareChallengePage());
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'NEXT 챌린지 안내!',
                  style: TextStyle(
                    fontFamily: 'NotoSans',
                    color: grey_1,
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
                      AutoSizeText('0일',
                          style: TextStyle(
                            fontFamily: 'NotoSans',
                            color: grey_1,
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            fontStyle: FontStyle.normal,
                          )),
                      AutoSizeText('-일',
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
                SizedBox(height: spacing_xs),
                Container(
                  width: Get.mediaQuery.size.width * 0.44,
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    child: LinearProgressIndicator(
                      value: 0.0,
                      color: primary_dark,
                      backgroundColor: grey_2,
                      minHeight: 4.5,
                    ),
                  ),
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
