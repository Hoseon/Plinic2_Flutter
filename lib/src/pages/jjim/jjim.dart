import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:line_icons/line_icons.dart';
import 'package:plinic2/constants.dart';
import 'package:plinic2/src/component/appbar_title.dart';
import 'package:plinic2/src/controller/tv_controller.dart';
import 'package:shimmer/shimmer.dart';

class JJimPage extends GetView<TvController> {
  const JJimPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: AppbarTitle(title: '찜상품'),
        elevation: 0.3,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(LineIcons.arrowLeft, color: Colors.black),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: _existData(context),
      // _nothingData(),
    );
  }

  Widget _nothingData() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: spacing_xl, top: spacing_xl),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '찜 상품',
                style: TextStyle(
                  fontFamily: 'NotoSansKR',
                  color: Color(0xff000000),
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                ),
              ),
              SizedBox(width: spacing_xxs),
              Text(
                '00',
                style: TextStyle(
                  fontFamily: 'NotoSansKR',
                  color: Color(0xff000000),
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.normal,
                ),
              )
            ],
          ),
        ),
        SizedBox(height: Get.mediaQuery.size.height * 0.072),
        Image.asset('assets/images/crying-1.png'),
        SizedBox(height: Get.mediaQuery.size.height * 0.021),
        Text(
          '찜 상품이 존재하지 않습니다.',
          style: TextStyle(
            fontFamily: 'NotoSansKR',
            color: grey_2,
            fontSize: 14,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
        )
      ],
    );
  }

  Widget _existData(BuildContext context) {
    return GetX<TvController>(
      init: Get.put<TvController>(TvController()),
      builder: (TvController tvController) {
        if (tvController.tvShow.isNotEmpty) {
          return GetX<TvController>(
            init: Get.put<TvController>(TvController()),
            builder: (TvController tvController) {
              if (tvController.tvShow.isNotEmpty) {
                return ListView.builder(
                  controller: PrimaryScrollController.of(context),
                  itemCount: tvController.tvShow.length + 1,
                  itemBuilder: (_, index) {
                    if (index == 0) {
                      return Padding(
                        padding: const EdgeInsets.only(
                            left: spacing_xl, top: spacing_xl),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          // mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '찜 상품',
                              style: TextStyle(
                                fontFamily: 'NotoSansKR',
                                color: Color(0xff000000),
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                              ),
                            ),
                            SizedBox(width: spacing_xxs),
                            Text(
                              tvController.tvShow.length.toString(),
                              style: TextStyle(
                                fontFamily: 'NotoSansKR',
                                color: Color(0xff000000),
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                fontStyle: FontStyle.normal,
                              ),
                            )
                          ],
                        ),
                      );
                    }
                    index -= 1;

                    return InkWell(
                      onTap: () {},
                      splashColor: grey_2,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: spacing_xl,
                            top: spacing_xl,
                            right: spacing_xl),
                        child: Container(
                          height: 82,
                          color: Colors.transparent,
                          child: Row(
                            children: [
                              Stack(
                                alignment: Alignment.bottomRight,
                                children: [
                                  CachedNetworkImage(
                                    imageUrl:
                                        tvController.tvShow[index].posterUrl,
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
                                  tvController.tvShow[index].isClick == true
                                      ? InkWell(
                                          onTap: () {
                                            Get.showSnackbar(
                                              GetBar(
                                                  // title: 'Snackbar',
                                                  // message: '찜 상품이 삭제 되었습니다.',
                                                  messageText: Row(
                                                    children: [
                                                      Text('찜 상품이 삭제 되었습니다.',
                                                          style: TextStyle(
                                                            fontFamily:
                                                                'NotoSansKR',
                                                            color: white,
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            fontStyle: FontStyle
                                                                .normal,
                                                          ))
                                                    ],
                                                  ),
                                                  duration:
                                                      Duration(seconds: 3),
                                                  forwardAnimationCurve: Curves
                                                      .fastLinearToSlowEaseIn,
                                                  reverseAnimationCurve:
                                                      Curves.easeInBack,
                                                  snackPosition:
                                                      SnackPosition.BOTTOM),
                                            );
                                            tvController.listDelete(index);
                                            // tvController.shopBagClick(index, false);
                                          },
                                          splashColor: Colors.black,
                                          child: Container(
                                            key: Key(tvController
                                                .tvShow[index].id
                                                .toString()),
                                            width: 28,
                                            height: 28,
                                            color: primary_dark,
                                            child: Icon(
                                              Icons.favorite_border,
                                              color: grey_3,
                                            ),
                                          ),
                                        )
                                      : InkWell(
                                          onTap: () {
                                            tvController.shopBagClick(
                                                index, true);
                                          },
                                          splashColor: Colors.black,
                                          child: Container(
                                            key: Key(tvController
                                                .tvShow[index].id
                                                .toString()),
                                            width: 28,
                                            height: 28,
                                            color: grey_2,
                                            child: Icon(
                                              Icons.favorite_border,
                                              color: grey_3,
                                            ),
                                          ),
                                        ),
                                ],
                              ),
                              SizedBox(width: spacing_m),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Container(
                                    width: Get.mediaQuery.size.width * 0.6,
                                    child: Text(
                                      tvController.tvShow[index].overview
                                          .toString(),
                                      style: TextStyle(
                                        fontFamily: 'NotoSansKR',
                                        color: Color(0xff000000),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        fontStyle: FontStyle.normal,
                                      ),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  Container(
                                    width: Get.mediaQuery.size.width * 0.60,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          alignment: Alignment.centerLeft,
                                          width: 68,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Text(
                                                  numberWithComma(tvController
                                                          .tvShow[index]
                                                          .vote_count!
                                                          .toInt()) +
                                                      '원',
                                                  style: TextStyle(
                                                    fontFamily: 'NotoSansKR',
                                                    color: black,
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w700,
                                                    fontStyle: FontStyle.normal,
                                                  ),
                                                  textAlign: TextAlign.start),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          alignment: Alignment.centerLeft,
                                          width: 63,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Text(
                                                numberWithComma(tvController
                                                        .tvShow[index]
                                                        .vote_count!
                                                        .toInt()) +
                                                    '원',
                                                style: TextStyle(
                                                  decoration: TextDecoration
                                                      .lineThrough,
                                                  fontFamily: 'NotoSansKR',
                                                  color: grey_2,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,
                                                  fontStyle: FontStyle.normal,
                                                ),
                                                textAlign: TextAlign.end,
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(width: 20),
                                        InkWell(
                                          splashColor: grey_2,
                                          onTap: () {
                                            Get.showSnackbar(
                                              GetBar(
                                                messageText: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      '찜 상품이 장바구니에 추가 되었습니다.\n장바구니로 이동할까요?',
                                                      style: TextStyle(
                                                        fontFamily:
                                                            'NotoSansKR',
                                                        color: white,
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontStyle:
                                                            FontStyle.normal,
                                                      ),
                                                    ),
                                                    TextButton(
                                                      onPressed: () {},
                                                      child: Text('바로가기',
                                                          style: TextStyle(
                                                            fontFamily:
                                                                'NotoSansKR',
                                                            color:
                                                                primary_light,
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            fontStyle: FontStyle
                                                                .normal,
                                                          )),
                                                    )
                                                  ],
                                                ),
                                                forwardAnimationCurve: Curves
                                                    .fastLinearToSlowEaseIn,
                                                reverseAnimationCurve:
                                                    Curves.easeInBack,
                                                duration: Duration(seconds: 4),
                                                snackPosition:
                                                    SnackPosition.BOTTOM,
                                              ),
                                            );
                                          },
                                          child: Icon(
                                            LineIcons.shoppingBag,
                                            color: icons_colors,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              )

                              // Column(
                              //   children: [
                              //     Row(
                              //       mainAxisAlignment:
                              //           MainAxisAlignment.start,
                              //       children: [
                              //         Text(
                              //           tvController
                              //               .tvShow[index].overview
                              //               .toString(),
                              //           style: TextStyle(
                              //             fontFamily: 'NotoSansKR',
                              //             color: Color(0xff000000),
                              //             fontSize: 12,
                              //             fontWeight: FontWeight.w400,
                              //             fontStyle: FontStyle.normal,
                              //           ),
                              //           maxLines: 2,
                              //           overflow:
                              //               TextOverflow.ellipsis,
                              //         ),
                              //       ],
                              //     ),
                              //     Row(
                              //       mainAxisAlignment:
                              //           MainAxisAlignment.spaceBetween,
                              //       children: [
                              //         Container(
                              //           color: Colors.red,
                              //           width: Get.mediaQuery.size.width *
                              //               0.169,
                              //           child: Text(
                              //             numberWithComma(tvController
                              //                     .tvShow[index]
                              //                     .vote_count!
                              //                     .toInt()) +
                              //                 '원',
                              //             style: TextStyle(
                              //               decoration: TextDecoration
                              //                   .lineThrough,
                              //               fontFamily: 'NotoSansKR',
                              //               color: grey_2,
                              //               fontSize: 14,
                              //               fontWeight: FontWeight.w400,
                              //               fontStyle: FontStyle.normal,
                              //             ),
                              //             textAlign: TextAlign.left,
                              //           ),
                              //         ),
                              //         SizedBox(
                              //             width:
                              //                 Get.mediaQuery.size.width *
                              //                     0.043),
                              //         Container(
                              //           width: Get.mediaQuery.size.width *
                              //               0.169,
                              //           child: Text(
                              //             numberWithComma(tvController
                              //                     .tvShow[index]
                              //                     .vote_count!
                              //                     .toInt()) +
                              //                 '원',
                              //             style: TextStyle(
                              //               fontFamily: 'NotoSansKR',
                              //               color: black,
                              //               fontSize: 14,
                              //               fontWeight: FontWeight.w700,
                              //               fontStyle: FontStyle.normal,
                              //             ),
                              //             textAlign: TextAlign.right,
                              //           ),
                              //         ),
                              //         Expanded(
                              //           child: IconButton(
                              //             icon: Icon(
                              //               Icons.shopping_bag_outlined,
                              //               size: 16,
                              //             ),
                              //             color: grey_2,
                              //             onPressed: () {
                              //               Get.showSnackbar(GetBar(
                              //                 messageText: Row(
                              //                   mainAxisAlignment:
                              //                       MainAxisAlignment
                              //                           .spaceBetween,
                              //                   children: [
                              //                     Text(
                              //                       '찜 상품이 장바구니에 추가 되었습니다.\n장바구니로 이동할까요?',
                              //                       style: TextStyle(
                              //                         fontFamily:
                              //                             'NotoSansKR',
                              //                         color: white,
                              //                         fontSize: 14,
                              //                         fontWeight:
                              //                             FontWeight.w400,
                              //                         fontStyle: FontStyle
                              //                             .normal,
                              //                       ),
                              //                     ),
                              //                     TextButton(
                              //                       onPressed: () {},
                              //                       child: Text('바로가기',
                              //                           style: TextStyle(
                              //                             fontFamily:
                              //                                 'NotoSansKR',
                              //                             color:
                              //                                 primary_light,
                              //                             fontSize: 14,
                              //                             fontWeight:
                              //                                 FontWeight
                              //                                     .w700,
                              //                             fontStyle:
                              //                                 FontStyle
                              //                                     .normal,
                              //                           )),
                              //                     )
                              //                   ],
                              //                 ),
                              //                 duration:
                              //                     Duration(seconds: 3),
                              //                 snackPosition:
                              //                     SnackPosition.BOTTOM,
                              //               ));
                              //             },
                              //           ),
                              //         )
                              //       ],
                              //     ),

                              //   ],
                              // ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              }

              return Center(
                  child: CircularProgressIndicator(color: primaryColor));
            },
          );
          // Expanded(
          //   child: Padding(
          //     padding: const EdgeInsets.only(
          //         left: spacing_xl, top: spacing_xl, right: spacing_xl, bottom: 1),
          //     child: ListView.builder(
          //       itemCount: tvController.tvShow.length,
          //       itemBuilder: (_, index) {
          //         return Column(
          //           children: [
          //             Padding(
          //               padding: const EdgeInsets.symmetric(vertical: 4.0),
          //               child: Container(
          //                 height: 82,
          //                 color: Colors.transparent,
          //                 child:
          //               ),
          //             ),
          //           ],
          //         );
          //       },
          //     ),
          //   ),
          // ),
        }

        return Center(child: CircularProgressIndicator(color: primaryColor));
      },
    );

    //   return Column(
    //     children: [
    //       Padding(
    //         padding: const EdgeInsets.only(left: spacing_xl, top: spacing_xl),
    //         child: Row(
    //           crossAxisAlignment: CrossAxisAlignment.center,
    //           // mainAxisAlignment: MainAxisAlignment.center,
    //           children: [
    //             Text(
    //               '찜 상품',
    //               style: TextStyle(
    //                 fontFamily: 'NotoSansKR',
    //                 color: Color(0xff000000),
    //                 fontSize: 14,
    //                 fontWeight: FontWeight.w400,
    //                 fontStyle: FontStyle.normal,
    //               ),
    //             ),
    //             SizedBox(width: spacing_xxs),
    //             Text(
    //               '12',
    //               style: TextStyle(
    //                 fontFamily: 'NotoSansKR',
    //                 color: Color(0xff000000),
    //                 fontSize: 14,
    //                 fontWeight: FontWeight.w700,
    //                 fontStyle: FontStyle.normal,
    //               ),
    //             )
    //           ],
    //         ),
    //       ),
    //       SizedBox(height: Get.mediaQuery.size.height * 0.072),
    //       Image.asset('assets/images/crying-1.png'),
    //     ],
    //   );
    // }
  }

  String numberWithComma(int param) {
    return NumberFormat('###,###,###,###').format(param).replaceAll(' ', '');
  }
}
