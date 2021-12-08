import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:plinic2/constants.dart';
import 'package:plinic2/src/component/appbar_title.dart';
import 'package:plinic2/src/component/plinic_dialog_two_button.dart';
import 'package:plinic2/src/controller/person_detail_controller.dart';
import 'package:plinic2/src/pages/review/review_edit.dart';
import 'package:shimmer/shimmer.dart';

class ReviewDetailPage extends StatelessWidget {
  final String? id;

  ReviewDetailPage({Key? key, this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.3,
        centerTitle: true,
        title: AppbarTitle(title: '상품리뷰 상세보기'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.black,
          onPressed: () {
            Get.back();
          },
        ),
        actions: [
          IconButton(
              icon: Icon(Icons.more_vert),
              onPressed: () {
                showActionSheet(context);
              })
        ],
        actionsIconTheme: IconThemeData(color: Colors.black),
      ),
      body: buildGetX(),
      // GetX<PersonDetailController>(
      //   init: Get.put<PersonDetailController>(PersonDetailController(id: id)),
      //   builder: (PersonDetailController detailController) {
      //     return Text('aaa');
      //   },
      // ),
    );
  }

  Widget buildGetX() {
    return GetX<PersonDetailController>(
      init: Get.put<PersonDetailController>(PersonDetailController(id: id)),
      builder: (PersonDetailController detailController) {
        if (detailController.personDetail.isNotEmpty) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
            child: Column(
              children: [
                SizedBox(height: spacing_xl),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                        detailController.personDetail['release_date']
                            .toString()
                            .replaceAll('-', '.'),
                        style: TextStyle(
                          fontFamily: 'NotoSansKR',
                          color: grey_1,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                        )),
                    RatingBar(
                      initialRating: detailController
                              .personDetail['vote_average']
                              .toDouble() *
                          0.5,
                      itemSize: 12,
                      minRating: 0,
                      maxRating: 5,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      ratingWidget: RatingWidget(
                        full: Icon(
                          Icons.star,
                          color: primaryColor,
                        ),
                        half: Icon(
                          Icons.star_half,
                          color: primaryColor,
                        ),
                        empty: Icon(
                          Icons.star_border,
                          color: primaryColor,
                        ),
                      ),
                      onRatingUpdate: (rating) {},
                    ),
                  ],
                ),
                SizedBox(
                  height: spacing_l,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CachedNetworkImage(
                      imageUrl: 'https://image.tmdb.org/t/p/w500/' +
                          detailController.personDetail['poster_path']
                              .toString(),
                      placeholder: (_, url) => Shimmer.fromColors(
                        direction: ShimmerDirection.ltr,
                        period: Duration(seconds: 2),
                        baseColor: grey_3,
                        highlightColor: Colors.grey.shade300,
                        child: Container(
                          width: 82,
                          height: 82,
                          color: grey_2,
                        ),
                      ),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                      width: 82,
                      height: 82,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(
                      width: spacing_xxs,
                    ),
                    CachedNetworkImage(
                      imageUrl: 'https://image.tmdb.org/t/p/w500/' +
                          detailController.personDetail['backdrop_path']
                              .toString(),
                      placeholder: (_, url) => Shimmer.fromColors(
                        direction: ShimmerDirection.ltr,
                        period: Duration(seconds: 2),
                        baseColor: grey_3,
                        highlightColor: Colors.grey.shade300,
                        child: Container(
                          width: 82,
                          height: 82,
                          color: grey_2,
                        ),
                      ),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                      width: 82,
                      height: 82,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(
                      width: spacing_xxs,
                    ),
                    CachedNetworkImage(
                      imageUrl: 'https://image.tmdb.org/t/p/w500/' +
                          detailController.personDetail['production_companies']
                                  [0]['logo_path']
                              .toString(),
                      placeholder: (_, url) => Shimmer.fromColors(
                        direction: ShimmerDirection.ltr,
                        period: Duration(seconds: 2),
                        baseColor: grey_3,
                        highlightColor: Colors.grey.shade300,
                        child: Container(
                          width: 82,
                          height: 82,
                          color: grey_2,
                        ),
                      ),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                      width: 82,
                      height: 82,
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
                SizedBox(height: spacing_s),
                Container(
                  width: 1000,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        detailController.personDetail['title'].toString(),
                        style: TextStyle(
                          fontFamily: 'NotoSansKR',
                          color: Color(0xff000000),
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: spacing_xs),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Flexible(
                      child: Text(
                        detailController.personDetail['overview'].toString(),
                        style: TextStyle(
                          fontFamily: 'NotoSansKR',
                          color: Color(0xff000000),
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                        ),
                        textAlign: TextAlign.left,
                        // overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
        }

        return buildLoading();
      },
    );
  }

  Center buildLoading() {
    return Center(
      child: CircularProgressIndicator(
        color: primaryColor,
      ),
    );
  }

  void showActionSheet(BuildContext context) {
    Get.put<PersonDetailController>(PersonDetailController());
    Get.bottomSheet(
      Container(
          height: 180,
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: spacing_xxs),
            child: Column(
              children: [
                ListTile(
                  onTap: () {
                    Get.back();
                    print(Get.find<PersonDetailController>()
                        .personDetail['id']
                        .toString());
                    Get.to(
                        () => ReviewEditPage(
                            id: Get.find<PersonDetailController>()
                                .personDetail['id']
                                .toString()),
                        transition: Transition.fadeIn);
                  },
                  title: Row(
                    children: [
                      Icon(Icons.create, size: 24),
                      SizedBox(width: spacing_xl),
                      Text('수정',
                          style: TextStyle(
                            fontFamily: 'NotoSansKR',
                            color: Color(0xff000000),
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                          )),
                    ],
                  ),
                ),
                ListTile(
                  onTap: () async {
                    Get.back();
                    await showAnimatedDialog(
                      context: context,
                      barrierDismissible: true,
                      builder: (BuildContext context) {
                        return PlinicDialogTwoButton(
                          button1Text: '삭제하기',
                          button2Text: '취소하기',
                          title: '알림',
                          content: '작성하신 상품리뷰를\n삭제하시겠습니까?',
                          button1Click: () {
                            Get.back();
                            Get.back();
                          },
                          button2Click: () {
                            Get.back();
                          },
                        );
                      },
                    );
                  },
                  title: Row(
                    children: [
                      Icon(Icons.content_cut_outlined, size: 24),
                      SizedBox(width: spacing_xl),
                      Text('삭제',
                          style: TextStyle(
                            fontFamily: 'NotoSansKR',
                            color: Color(0xff000000),
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                          )),
                    ],
                  ),
                ),
                ListTile(
                  onTap: () {
                    print('취소');
                    Get.back();
                  },
                  title: Row(
                    children: [
                      Icon(Icons.reply_all_outlined, size: 24),
                      SizedBox(width: spacing_xl),
                      Text('취소',
                          style: TextStyle(
                            fontFamily: 'NotoSansKR',
                            color: Color(0xff000000),
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                          )),
                    ],
                  ),
                ),
              ],
            ),
          )),
      // barrierColor: Colors.red[50],
      isDismissible: true,
    );
  }
}
