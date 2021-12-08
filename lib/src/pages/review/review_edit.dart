import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:plinic2/constants.dart';
import 'package:plinic2/src/component/appbar_title.dart';
import 'package:plinic2/src/component/plinic_dialog_two_button.dart';
import 'package:plinic2/src/controller/person_detail_controller.dart';
import 'package:shimmer/shimmer.dart';

class ReviewEditPage extends StatelessWidget {
  final String? id;

  ReviewEditPage({Key? key, this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.3,
        centerTitle: true,
        title: AppbarTitle(title: '상품리뷰 수정'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.black,
          onPressed: () async {
            await showAnimatedDialog(
              context: context,
              barrierDismissible: true,
              builder: (BuildContext context) {
                return PlinicDialogTwoButton(
                  button1Text: '계속 수정하기',
                  button2Text: '다음에 할게요',
                  title: '알림',
                  content: '이전화면으로 이동 시\n수정내역이 저장되지 않습니다.',
                  button1Click: () {
                    Get.back();
                  },
                  button2Click: () {
                    Get.back();
                    Get.back();
                    // Get.to(() => ReviewDetailPage(),
                    //     transition: Transition.fadeIn);
                  },
                );
              },
            );
          },
        ),
        actions: [
          TextButton(
            onPressed: () {
              // showActionSheet();
              Get.back();
            },
            child: Text(
              '완료',
              style: TextStyle(
                fontFamily: 'NotoSansKR',
                color: Color(0xff000000),
                fontSize: 14,
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.normal,
              ),
            ),
          )
        ],
        actionsIconTheme: IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Builder(
          builder: (context) {
            return GestureDetector(
              onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
              child: buildGetX(),
            );
          },
        ),
      ),
      bottomNavigationBar: Container(
        color: grey_2,
        width: Get.mediaQuery.size.width,
        height: 150,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: spacing_xl,
              ),
              Text(
                '상품리뷰 등록안내',
                style: TextStyle(
                  fontFamily: 'NotoSansKR',
                  color: grey_1,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                ),
              ),
              SizedBox(height: spacing_s),
              Row(
                children: [
                  Column(
                    children: [],
                  ),
                  Text(
                    '• 상품리뷰는 구매 확정 후 작성이 가능합니다.\n• 작성하신 내용이 올바르지 않거나 운영원칙에 \n   위배될 경우 관리자에 의해 삭제 될 수 있습니다.',
                    style: TextStyle(
                      fontFamily: 'NotoSansKR',
                      color: grey_1,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      resizeToAvoidBottomInset: true,

      // TextField(
      //   maxLines: null,
      //   keyboardType: TextInputType.multiline,
      // ),
    );
  }

  Widget buildGetX() {
    return GetX<PersonDetailController>(
      init: Get.put<PersonDetailController>(PersonDetailController(id: id)),
      builder: (PersonDetailController detailController) {
        final TextEditingController? _controller = TextEditingController(
            text: detailController.personDetail['overview'].toString());
        if (detailController.personDetail.isNotEmpty) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
                child: Column(
                  children: [
                    SizedBox(height: spacing_xl),
                    Container(
                      width: Get.mediaQuery.size.width,
                      color: Colors.transparent,
                      child: Row(
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
                    ),
                    SizedBox(
                      height: spacing_l,
                    ),
                    Container(
                      width: Get.mediaQuery.size.width,
                      color: Colors.transparent,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Stack(
                            alignment: Alignment.center,
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
                                errorWidget: (context, url, error) =>
                                    Icon(Icons.error),
                                width: 82,
                                height: 82,
                                fit: BoxFit.cover,
                              ),
                              Positioned(
                                right: -10,
                                top: -10,
                                child: IconButton(
                                  icon: Icon(
                                    Icons.close,
                                    size: 25,
                                    color: Colors.black,
                                  ),
                                  onPressed: () {},
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: spacing_xxs,
                          ),
                          Stack(
                            children: [
                              CachedNetworkImage(
                                imageUrl: 'https://image.tmdb.org/t/p/w500/' +
                                    detailController
                                        .personDetail['backdrop_path']
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
                                errorWidget: (context, url, error) =>
                                    Icon(Icons.error),
                                width: 82,
                                height: 82,
                                fit: BoxFit.cover,
                              ),
                              Positioned(
                                right: -10,
                                top: -10,
                                child: IconButton(
                                  icon: Icon(
                                    Icons.close,
                                    size: 25,
                                    color: Colors.black,
                                  ),
                                  onPressed: () {},
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: spacing_xxs,
                          ),
                          Stack(
                            children: [
                              CachedNetworkImage(
                                imageUrl: 'https://image.tmdb.org/t/p/w500/' +
                                    detailController
                                        .personDetail['production_companies'][0]
                                            ['logo_path']
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
                                errorWidget: (context, url, error) =>
                                    Icon(Icons.error),
                                width: 82,
                                height: 82,
                                fit: BoxFit.cover,
                              ),
                              Positioned(
                                right: -10,
                                top: -10,
                                child: IconButton(
                                  icon: Icon(
                                    Icons.close,
                                    size: 25,
                                    color: Colors.black,
                                  ),
                                  onPressed: () {},
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: spacing_s),
                    Container(
                      width: Get.mediaQuery.size.width,
                      color: Colors.transparent,
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
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.start,
                    //   children: [
                    //     Flexible(
                    //       child: Text(
                    //         detailController.personDetail['overview'].toString(),
                    //         style: TextStyle(
                    //           fontFamily: 'NotoSansKR',
                    //           color: Color(0xff000000),
                    //           fontSize: 14,
                    //           fontWeight: FontWeight.w400,
                    //           fontStyle: FontStyle.normal,
                    //         ),
                    //         textAlign: TextAlign.left,
                    //         // overflow: TextOverflow.ellipsis,
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    TextField(
                      decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: grey_2)),
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(4))),
                          focusColor: Colors.black,
                          hoverColor: primaryColor,
                          fillColor: primaryColor),
                      controller: _controller,
                      maxLines: null,
                      keyboardType: TextInputType.multiline,
                    ),
                    // Container(
                    //   width: Get.mediaQuery.size.width,
                    //   height: 100,
                    //   color: grey_1,
                    // )
                  ],
                ),
              ),
            ],
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
}
