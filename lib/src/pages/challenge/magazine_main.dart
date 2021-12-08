import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:plinic2/constants.dart';
import 'package:plinic2/src/component/custom_appbar.dart';
import 'package:plinic2/src/controller/display/magazine_controller.dart';
import 'package:plinic2/src/pages/challenge/magazine_detail.dart';
import 'package:shimmer/shimmer.dart';

class MagazineMainPage extends StatelessWidget {
  const MagazineMainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar('매거진 보기'),
      backgroundColor: Colors.white,
      body: buildMagazine(),
    );
  }

  Widget buildMagazine() {
    return GetX<MagazineController>(
      init: Get.put<MagazineController>(MagazineController()),
      builder: (MagazineController magazineController) {
        if (magazineController.getMagazineList.isNotEmpty) {
          return ListView.builder(
            itemCount: magazineController.getMagazineList.length,
            itemBuilder: (_, index) {
              return Column(
                children: [
                  InkWell(
                    onTap: () {
                      Get.to(MagazineDetailPage(),
                          arguments: magazineController.getMagazineList[index]);
                    },
                    child: Column(
                      children: [
                        Stack(
                          alignment: Alignment.bottomLeft,
                          children: [
                            CachedNetworkImage(
                              imageUrl: magazineController
                                  .getMagazineList[index]['sliver_image']
                                  .toString(),
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
                              errorWidget: (context, url, error) =>
                                  Icon(Icons.error),
                              width: Get.mediaQuery.size.width,
                              // height: 82,
                              fit: BoxFit.fitWidth,
                            ),
                            Positioned(
                              left: spacing_l,
                              child: Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(5),
                                        topRight: Radius.circular(5))),
                                width: 112,
                                height: 28,
                                child: Text(
                                  '플리닉 매거진',
                                  style: TextStyle(
                                    fontFamily: 'Roboto',
                                    color: white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                    fontStyle: FontStyle.normal,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: spacing_l),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: spacing_xl),
                          child: Row(
                            children: [
                              Text(
                                magazineController.getMagazineList[index]
                                        ['title']
                                    .toString(),
                                style: TextStyle(
                                  fontFamily: 'NotoSansKR',
                                  color: black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                  fontStyle: FontStyle.normal,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: spacing_s),
                        Row(
                          children: [
                            Container(
                              padding:
                                  EdgeInsets.symmetric(horizontal: spacing_xl),
                              width: Get.mediaQuery.size.width,
                              child: Text(
                                magazineController.getMagazineList[index]
                                        ['sub_title']
                                    .toString(),
                                style: TextStyle(
                                  fontFamily: 'NotoSansKR',
                                  color: black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: spacing_s),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: spacing_xl),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              InkWell(
                                  splashColor: primary_light,
                                  onTap: () {
                                    print('Heart');
                                  },
                                  child: Icon(LineIcons.heart)),
                              SizedBox(width: spacing_xs),
                              Text('152명이 좋아했어요',
                                  style: TextStyle(
                                    fontFamily: 'NotoSansKR',
                                    color: black,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    fontStyle: FontStyle.normal,
                                  ))
                            ],
                          ),
                        ),
                        SizedBox(height: 47),
                      ],
                    ),
                  )
                  // HtmlWidget(
                  //   magazineController.getMagazineList[index]['content']
                  //       .toString(),
                  //   webView: true,
                  // ),
                  // CachedNetworkImage(
                  //   imageUrl: magazineController.getMagazineList[index]
                  //           ['sliver_image']
                  //       .toString(),
                  //   placeholder: (_, url) => Shimmer.fromColors(
                  //     direction: ShimmerDirection.ltr,
                  //     period: Duration(seconds: 2),
                  //     baseColor: grey_3,
                  //     highlightColor: Colors.grey.shade300,
                  //     child: Container(
                  //       width: 82,
                  //       height: 82,
                  //       color: grey_2,
                  //     ),
                  //   ),
                  //   errorWidget: (context, url, error) => Icon(Icons.error),
                  //   width: 82,
                  //   height: 82,
                  //   fit: BoxFit.cover,
                  // ),
                ],
              );
            },
          );
        }
        return loading();
      },
    );
  }

  Widget loading() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Shimmer.fromColors(
            direction: ShimmerDirection.ltr,
            period: Duration(seconds: 2),
            baseColor: grey_3,
            highlightColor: Colors.grey.shade300,
            child: Container(
              width: Get.mediaQuery.size.width,
              height: 520,
              color: grey_3,
            ),
          ),
          SizedBox(height: spacing_m),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
            child: Shimmer.fromColors(
              direction: ShimmerDirection.ltr,
              period: Duration(seconds: 2),
              baseColor: grey_3,
              highlightColor: Colors.grey.shade300,
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2), color: grey_3),
                    width: 160,
                    height: 32,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: spacing_xs),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
            child: Shimmer.fromColors(
              direction: ShimmerDirection.ltr,
              period: Duration(seconds: 2),
              baseColor: grey_3,
              highlightColor: Colors.grey.shade300,
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2), color: grey_3),
                    width: 260,
                    height: 32,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: spacing_s),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
            child: Shimmer.fromColors(
              direction: ShimmerDirection.ltr,
              period: Duration(seconds: 2),
              baseColor: grey_3,
              highlightColor: Colors.grey.shade300,
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2), color: grey_3),
                    width: 327,
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: spacing_xxs),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
            child: Shimmer.fromColors(
              direction: ShimmerDirection.ltr,
              period: Duration(seconds: 2),
              baseColor: grey_3,
              highlightColor: Colors.grey.shade300,
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2), color: grey_3),
                    width: 327,
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
            child: Shimmer.fromColors(
              direction: ShimmerDirection.ltr,
              period: Duration(seconds: 2),
              baseColor: grey_3,
              highlightColor: Colors.grey.shade300,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(LineIcons.heart, color: grey_3, size: 17.5),
                  SizedBox(width: 9.2),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2), color: grey_3),
                    width: 100,
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 46),
          Shimmer.fromColors(
            direction: ShimmerDirection.ltr,
            period: Duration(seconds: 2),
            baseColor: grey_3,
            highlightColor: Colors.grey.shade300,
            child: Container(
              width: Get.mediaQuery.size.width,
              height: 520,
              color: grey_3,
            ),
          ),
          SizedBox(height: spacing_m),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
            child: Shimmer.fromColors(
              direction: ShimmerDirection.ltr,
              period: Duration(seconds: 2),
              baseColor: grey_3,
              highlightColor: Colors.grey.shade300,
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2), color: grey_3),
                    width: 160,
                    height: 32,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: spacing_xs),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
            child: Shimmer.fromColors(
              direction: ShimmerDirection.ltr,
              period: Duration(seconds: 2),
              baseColor: grey_3,
              highlightColor: Colors.grey.shade300,
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2), color: grey_3),
                    width: 260,
                    height: 32,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: spacing_s),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
            child: Shimmer.fromColors(
              direction: ShimmerDirection.ltr,
              period: Duration(seconds: 2),
              baseColor: grey_3,
              highlightColor: Colors.grey.shade300,
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2), color: grey_3),
                    width: 327,
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: spacing_xxs),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
            child: Shimmer.fromColors(
              direction: ShimmerDirection.ltr,
              period: Duration(seconds: 2),
              baseColor: grey_3,
              highlightColor: Colors.grey.shade300,
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2), color: grey_3),
                    width: 327,
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
            child: Shimmer.fromColors(
              direction: ShimmerDirection.ltr,
              period: Duration(seconds: 2),
              baseColor: grey_3,
              highlightColor: Colors.grey.shade300,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(LineIcons.heart, color: grey_3, size: 17.5),
                  SizedBox(width: 9.2),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2), color: grey_3),
                    width: 100,
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
