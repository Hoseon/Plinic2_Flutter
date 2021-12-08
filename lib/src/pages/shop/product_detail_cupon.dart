import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:plinic2/constants.dart';
import 'package:plinic2/src/component/custom_appbar.dart';
import 'package:plinic2/src/component/plinic_dialog_two_button.dart';
import 'package:plinic2/src/controller/product_detail_controller.dart';
import 'package:plinic2/src/pages/shop/components/custom_drop_down_button.dart';
import 'package:plinic2/src/pages/shop/components/custom_shop_drop_down_menu.dart';
import 'package:plinic2/src/pages/shop/components/custom_shop_drop_down_menu_cupon.dart';
import 'package:plinic2/src/pages/shop/components/recommend_product.dart';
import 'package:plinic2/src/pages/shop/product_review.dart';
import 'package:plinic2/src/pages/shop/shop_cart.dart';
import 'package:plinic2/src/pages/shop/shop_order_detail_cupon.dart';

class ProductDetailCuponPage extends GetView<ProductDetailController> {
  const ProductDetailCuponPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ProductDetailController());
    var data = Get.arguments;
    return Scaffold(
      appBar: CustomAppbar('상품 상세 정보'),
      bottomSheet: buildBottom(context),
      backgroundColor: white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: spacing_s),
            Container(
              alignment: Alignment.center,
              child: Image.asset(
                'assets/images/shop/starbucks.png',
                width: Get.mediaQuery.size.width * 0.527,
                fit: BoxFit.fitWidth,
              ),
            ),
            SizedBox(height: spacing_xxl),
            Container(
              padding: EdgeInsets.symmetric(horizontal: spacing_xl),
              alignment: Alignment.centerLeft,
              child: Text(
                '모바일 상품권 - 스타벅스',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  color: black,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.normal,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            SizedBox(height: spacing_xxs),
            Container(
              padding: EdgeInsets.symmetric(horizontal: spacing_xl),
              alignment: Alignment.centerLeft,
              child: Text('#DSPT #DSPW #DRNW',
                  style: TextStyle(
                    fontFamily: 'NotoSansKR',
                    color: grey_1,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                  )),
            ),
            SizedBox(height: 25),
            Container(
              padding: EdgeInsets.symmetric(horizontal: spacing_xl),
              alignment: Alignment.centerLeft,
              child: Text('4,100원',
                  style: TextStyle(
                    decoration: TextDecoration.lineThrough,
                    fontFamily: 'NotoSansKR',
                    color: grey_1,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                  )),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
              child: Row(
                children: [
                  Text('11%',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        color: primary,
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.normal,
                      )),
                  SizedBox(width: 11),
                  Text('2,300원',
                      style: TextStyle(
                        fontFamily: 'NotoSansKR',
                        color: black,
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.normal,
                      ))
                ],
              ),
            ),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.symmetric(horizontal: spacing_xl),
              alignment: Alignment.centerLeft,
              child: Text('ⓒ 800 사용가능',
                  style: TextStyle(
                    fontFamily: 'NotoSansKR',
                    color: Colors.red,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                  )),
            ),
            SizedBox(height: spacing_s),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
              child: Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.symmetric(horizontal: 9),
                width: Get.mediaQuery.size.width,
                height: 56,
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    border: Border.all(color: grey_1)),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      LineIcons.bullhorn,
                      color: grey_1,
                      size: 17,
                    ),
                    SizedBox(width: 9),
                    Text('상품재고가 얼마 남지 않았어요! 구매 시 재고가\n소진 될 수 있으니 서두르세요!',
                        style: TextStyle(
                          fontFamily: 'NotoSansKR',
                          color: grey_1,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                        ))
                  ],
                ),
              ),
            ),
            SizedBox(height: spacing_xxl2),
            Divider(
              color: grey_3,
              thickness: 8,
              height: 0,
            ),
            Row(
              children: [
                Column(
                  children: [
                    InkWell(
                      onTap: () {
                        controller.changeTab(0);
                        // print('상품정보 클릭');
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: Get.mediaQuery.size.width * 0.5,
                        height: 51,
                        child: Text(
                          '상품설명',
                          style: TextStyle(
                            fontFamily: 'NotoSansKR',
                            color: black,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                      ),
                    ),
                    Obx(() => controller.currentTab.value == 0
                        ? Container(
                            width: Get.mediaQuery.size.width * 0.5,
                            height: 2,
                            color: black,
                          )
                        : Container(
                            width: Get.mediaQuery.size.width * 0.5,
                            height: 2,
                            color: white,
                          ))
                  ],
                ),
                Column(
                  children: [
                    InkWell(
                      onTap: () {
                        controller.changeTab(1);
                        // print('상품 리뷰 클릭');
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: Get.mediaQuery.size.width * 0.5,
                        height: 51,
                        child: Text(
                          '상세정보',
                          style: TextStyle(
                            fontFamily: 'NotoSansKR',
                            color: black,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                      ),
                    ),
                    Obx(() => controller.currentTab.value == 0
                        ? Container(
                            width: Get.mediaQuery.size.width * 0.5,
                            height: 2,
                            color: white,
                          )
                        : Container(
                            width: Get.mediaQuery.size.width * 0.5,
                            height: 2,
                            color: black,
                          ))
                  ],
                ),
              ],
            ),
            Obx(
              () => controller.currentTab.value == 0
                  ? buildReview(data)
                  : buildReview(data),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildReview(data) {
    return Column(
      children: [
        SizedBox(height: spacing_xl),
        ListTile(
          onTap: () {
            print('상품고시정보');
          },
          contentPadding: EdgeInsets.symmetric(horizontal: spacing_xl),
          trailing: Icon(LineIcons.angleDown, size: 18, color: black),
          title: Text('상품고시정보',
              style: TextStyle(
                fontFamily: 'NotoSansKR',
                color: black,
                fontSize: 14,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
              )),
        ),
        Divider(color: grey_2, height: 0),
        ListTile(
          onTap: () {
            print('취소/환불 정책 및 방법');
          },
          contentPadding: EdgeInsets.symmetric(horizontal: spacing_xl),
          trailing: Icon(LineIcons.angleDown, size: 18, color: black),
          title: Text('취소/환불 정책 및 방법',
              style: TextStyle(
                fontFamily: 'NotoSansKR',
                color: black,
                fontSize: 14,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
              )),
        ),
        Divider(color: grey_2, height: 0),
        ListTile(
          onTap: () {
            print('거래조건에 관한 정보');
          },
          contentPadding: EdgeInsets.symmetric(horizontal: spacing_xl),
          trailing: Icon(LineIcons.angleDown, size: 18, color: black),
          title: Text('거래조건에 관한 정보',
              style: TextStyle(
                fontFamily: 'NotoSansKR',
                color: black,
                fontSize: 14,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
              )),
        ),
        Divider(color: grey_2, height: 0),
        ListTile(
          onTap: () {
            print('구매 시 주의사항');
          },
          contentPadding: EdgeInsets.symmetric(horizontal: spacing_xl),
          trailing: Icon(LineIcons.angleDown, size: 18, color: black),
          title: Text('구매 시 주의사항',
              style: TextStyle(
                fontFamily: 'NotoSansKR',
                color: black,
                fontSize: 14,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
              )),
        ),

        // Divider(color: grey_2, thickness: 8, height: 4),
        // Padding(
        //   padding: const EdgeInsets.only(left: spacing_xl),
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.spaceAround,
        //     children: [
        //       Column(
        //         children: [
        //           Text('4.9',
        //               style: TextStyle(
        //                 fontFamily: 'Roboto',
        //                 color: black,
        //                 fontSize: 40,
        //                 fontWeight: FontWeight.w400,
        //                 fontStyle: FontStyle.normal,
        //               )),
        //           SizedBox(height: spacing_s),
        //           RatingBar(
        //             initialRating: 5,
        //             itemSize: 16,
        //             minRating: 0,
        //             maxRating: 5,
        //             direction: Axis.horizontal,
        //             allowHalfRating: true,
        //             itemCount: 5,
        //             ratingWidget: RatingWidget(
        //               full: Icon(
        //                 Icons.star,
        //                 color: primaryColor,
        //               ),
        //               half: Icon(
        //                 Icons.star_half,
        //                 color: primaryColor,
        //               ),
        //               empty: Icon(
        //                 Icons.star_border,
        //                 color: primaryColor,
        //               ),
        //             ),
        //             onRatingUpdate: (rating) {},
        //           ),
        //         ],
        //       ),
        //       Column(
        //         children: [
        //           Row(
        //             children: [
        //               Text('5점',
        //                   style: TextStyle(
        //                     fontFamily: 'NotoSansKR',
        //                     color: black,
        //                     fontSize: 12,
        //                     fontWeight: FontWeight.w400,
        //                     fontStyle: FontStyle.normal,
        //                   )),
        //               LinearPercentIndicator(
        //                 // padding: EdgeInsets.symmetric(horizontal: spacing_xl),
        //                 width: 130,
        //                 lineHeight: 4.0,
        //                 percent: 1,
        //                 linearStrokeCap: LinearStrokeCap.butt,
        //                 backgroundColor: grey_3,
        //                 progressColor: primary,
        //               ),
        //               Text('5점',
        //                   style: TextStyle(
        //                     fontFamily: 'NotoSansKR',
        //                     color: black,
        //                     fontSize: 12,
        //                     fontWeight: FontWeight.w400,
        //                     fontStyle: FontStyle.normal,
        //                   )),
        //             ],
        //           ),
        //           SizedBox(height: spacing_xs),
        //           Row(
        //             children: [
        //               Text('4점',
        //                   style: TextStyle(
        //                     fontFamily: 'NotoSansKR',
        //                     color: black,
        //                     fontSize: 12,
        //                     fontWeight: FontWeight.w400,
        //                     fontStyle: FontStyle.normal,
        //                   )),
        //               LinearPercentIndicator(
        //                 // padding: EdgeInsets.symmetric(horizontal: spacing_xl),
        //                 width: 130,
        //                 lineHeight: 4.0,
        //                 percent: 0.1,
        //                 linearStrokeCap: LinearStrokeCap.butt,
        //                 backgroundColor: grey_3,
        //                 progressColor: primary,
        //               ),
        //               Text('4점',
        //                   style: TextStyle(
        //                     fontFamily: 'NotoSansKR',
        //                     color: black,
        //                     fontSize: 12,
        //                     fontWeight: FontWeight.w400,
        //                     fontStyle: FontStyle.normal,
        //                   )),
        //             ],
        //           ),
        //           SizedBox(height: spacing_xs),
        //           Row(
        //             children: [
        //               Text('3점',
        //                   style: TextStyle(
        //                     fontFamily: 'NotoSansKR',
        //                     color: black,
        //                     fontSize: 12,
        //                     fontWeight: FontWeight.w400,
        //                     fontStyle: FontStyle.normal,
        //                   )),
        //               LinearPercentIndicator(
        //                 // padding: EdgeInsets.symmetric(horizontal: spacing_xl),
        //                 width: 130,
        //                 lineHeight: 4.0,
        //                 percent: 0.05,
        //                 linearStrokeCap: LinearStrokeCap.butt,
        //                 backgroundColor: grey_3,
        //                 progressColor: primary,
        //               ),
        //               Text('3점',
        //                   style: TextStyle(
        //                     fontFamily: 'NotoSansKR',
        //                     color: black,
        //                     fontSize: 12,
        //                     fontWeight: FontWeight.w400,
        //                     fontStyle: FontStyle.normal,
        //                   )),
        //             ],
        //           ),
        //           SizedBox(height: spacing_xs),
        //           Row(
        //             children: [
        //               Text('2점',
        //                   style: TextStyle(
        //                     fontFamily: 'NotoSansKR',
        //                     color: black,
        //                     fontSize: 12,
        //                     fontWeight: FontWeight.w400,
        //                     fontStyle: FontStyle.normal,
        //                   )),
        //               LinearPercentIndicator(
        //                 // padding: EdgeInsets.symmetric(horizontal: spacing_xl),
        //                 width: 130,
        //                 lineHeight: 4.0,
        //                 percent: 0.0,
        //                 linearStrokeCap: LinearStrokeCap.butt,
        //                 backgroundColor: grey_3,
        //                 progressColor: primary,
        //               ),
        //               Text('2점',
        //                   style: TextStyle(
        //                     fontFamily: 'NotoSansKR',
        //                     color: black,
        //                     fontSize: 12,
        //                     fontWeight: FontWeight.w400,
        //                     fontStyle: FontStyle.normal,
        //                   )),
        //             ],
        //           ),
        //           SizedBox(height: spacing_xs),
        //           Row(
        //             children: [
        //               Text('1점',
        //                   style: TextStyle(
        //                     fontFamily: 'NotoSansKR',
        //                     color: black,
        //                     fontSize: 12,
        //                     fontWeight: FontWeight.w400,
        //                     fontStyle: FontStyle.normal,
        //                   )),
        //               LinearPercentIndicator(
        //                 // padding: EdgeInsets.symmetric(horizontal: spacing_xl),
        //                 width: 130,
        //                 lineHeight: 4.0,
        //                 percent: 0.0,
        //                 linearStrokeCap: LinearStrokeCap.butt,
        //                 backgroundColor: grey_3,
        //                 progressColor: primary,
        //               ),
        //               Text('1점',
        //                   style: TextStyle(
        //                     fontFamily: 'NotoSansKR',
        //                     color: black,
        //                     fontSize: 12,
        //                     fontWeight: FontWeight.w400,
        //                     fontStyle: FontStyle.normal,
        //                   )),
        //             ],
        //           ),
        //         ],
        //       )
        //     ],
        //   ),
        // ),
        // SizedBox(height: spacing_xl),
        // Divider(thickness: 8, color: grey_3, height: 0),
        // SizedBox(height: spacing_xl),
        // Container(
        //   padding: EdgeInsets.symmetric(horizontal: spacing_xl),
        //   alignment: Alignment.centerLeft,
        //   child: Text('전체리뷰 (127)',
        //       style: TextStyle(
        //         fontFamily: 'NotoSansKR',
        //         color: black,
        //         fontSize: 16,
        //         fontWeight: FontWeight.w700,
        //         fontStyle: FontStyle.normal,
        //       )),
        // ),
        // SizedBox(height: spacing_xl),
        // buildReview_2(
        //     'assets/images/care/ranking-1.png',
        //     '이미나',
        //     '2021.08.21',
        //     5,
        //     'assets/images/shop/review-image-1.png',
        //     '아비브 어성초 토너는 진짜 제가 너무너무 애정하는 제품입니다😍❣ 제가 원래도 아비브 제품을 엄청 애용하긴 하지만 그 중에는 아비브 토너의 아비브 제품을 엄청 애용하긴 하지만 그 중에는 아비브 토너의 아비브 제품을 엄청 애용하긴 하지만 그 중에는 아비브 토너의'),
        // buildReview_2(
        //     'assets/images/care/ranking-2.png',
        //     '해맑다',
        //     '2021.08.16',
        //     5,
        //     'assets/images/shop/review-image-2.png',
        //     '아비브 신상 어성초 토너 체험하게 되어 너무 좋네요 우선 택배로 받았을때 케이스며 상자며 심플해서 기분좋게 오픈했네요^ㅡ^*...'),
        // buildReview_2(
        //     'assets/images/care/ranking-3.png',
        //     '이미나',
        //     '2021.08.21',
        //     5,
        //     'assets/images/shop/review-image-1.png',
        //     '아비브 어성초 토너는 진짜 제가 너무너무 애정하는 제품입니다😍❣ 제가 원래도 아비브 제품을 엄청 애용하긴 하지만 그 중에는 아비브 토너의 아비브 제품을 엄청 애용하긴 하지만 그 중에는 아비브 토너의 아비브 제품을 엄청 애용하긴 하지만 그 중에는 아비브 토너의'),
        // buildReview_2(
        //     'assets/images/care/ranking-4.png',
        //     '해맑다',
        //     '2021.08.16',
        //     5,
        //     'assets/images/shop/review-image-2.png',
        //     '아비브 신상 어성초 토너 체험하게 되어 너무 좋네요 우선 택배로 받았을때 케이스며 상자며 심플해서 기분좋게 오픈했네요^ㅡ^*...'),
        SizedBox(height: spacing_xxl),
        SizedBox(height: spacing_xxl),
      ],
    );
  }

  Widget buildReview_2(String userImgPath, String name, String date,
      double rating, String reviewImgPath, String review) {
    return Column(
      children: [
        Divider(color: grey_3, thickness: 1, height: 0),
        SizedBox(height: spacing_m),
        InkWell(
          onTap: () {
            Get.to(() => ProductReviewPage(), transition: Transition.native);
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
            child: Container(
              width: Get.mediaQuery.size.width,
              color: Colors.transparent,
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        userImgPath,
                        width: 16,
                        fit: BoxFit.fitWidth,
                      ),
                      SizedBox(width: spacing_xxs),
                      Text(name,
                          style: TextStyle(
                            fontFamily: 'NotoSansKR',
                            color: grey_1,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                          )),
                      SizedBox(width: spacing_m),
                      Expanded(
                        child: Text(date,
                            style: TextStyle(
                              fontFamily: 'NotoSansKR',
                              color: grey_1,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                            )),
                      ),
                      RatingBar(
                        initialRating: rating,
                        itemSize: 16,
                        minRating: 0,
                        maxRating: 5,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        ratingWidget: RatingWidget(
                          full: Icon(
                            Icons.star,
                            color: black,
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
                  SizedBox(height: 21),
                  Row(
                    children: [
                      Image.asset(
                        reviewImgPath,
                        width: Get.mediaQuery.size.width * 0.219,
                        fit: BoxFit.fitWidth,
                      ),
                      SizedBox(width: 17),
                      Expanded(
                        child: Text(
                          review,
                          style: TextStyle(
                            fontFamily: 'NotoSansKR',
                            color: black,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 4,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(height: spacing_xl),
      ],
    );
  }

  Widget buildImg(data) {
    return Column(
      children: [
        Obx(
          () => controller.more.value
              ? Image.asset(
                  data['detailPath'],
                  width: Get.mediaQuery.size.width,
                  // height: 200,
                  fit: BoxFit.fitWidth,
                )
              : Image.asset(
                  data['detailPath'],
                  width: Get.mediaQuery.size.width,
                  height: 1351,
                  alignment: AlignmentDirectional.topStart,
                  fit: BoxFit.cover,
                ),
        ),
        SizedBox(height: spacing_xl),
        Obx(
          () => controller.more.value
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      alignment: Alignment.center,
                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                        if (states.contains(MaterialState.pressed)) {
                          return Colors.grey.shade200;
                        }
                        return white;
                      }),
                      elevation: MaterialStateProperty.all(0),
                      side: MaterialStateProperty.all(
                        BorderSide(
                          color: grey_2,
                        ),
                      ),
                      minimumSize: MaterialStateProperty.all(
                        Size(Get.mediaQuery.size.width, 44),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('상세정보 접기',
                            style: TextStyle(
                              fontFamily: 'NotoSansKR',
                              color: grey_1,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                            )),
                        SizedBox(width: spacing_xs),
                        Icon(
                          LineIcons.angleUp,
                          color: grey_1,
                          size: 15,
                        )
                      ],
                    ),
                    onPressed: () {
                      ProductDetailController.to.changeMore(false);
                    },
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      alignment: Alignment.center,
                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                        if (states.contains(MaterialState.pressed)) {
                          return Colors.grey.shade200;
                        }
                        return white;
                      }),
                      elevation: MaterialStateProperty.all(0),
                      side: MaterialStateProperty.all(
                        BorderSide(
                          color: grey_2,
                        ),
                      ),
                      minimumSize: MaterialStateProperty.all(
                        Size(Get.mediaQuery.size.width, 44),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('상세정보 펼쳐보기',
                            style: TextStyle(
                              fontFamily: 'NotoSansKR',
                              color: grey_1,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                            )),
                        SizedBox(width: spacing_xs),
                        Icon(
                          LineIcons.angleDown,
                          color: grey_1,
                          size: 15,
                        )
                      ],
                    ),
                    onPressed: () {
                      ProductDetailController.to.changeMore(true);
                    },
                  ),
                ),
        ),
        SizedBox(height: 36),
        Divider(color: grey_2, thickness: 8, height: 0),
        ListTile(
          onTap: () {
            print('상품 추가 정보 클릭');
          },
          contentPadding: EdgeInsets.symmetric(horizontal: spacing_xl),
          trailing: Icon(LineIcons.angleDown, size: 18, color: black),
          title: Text('상품 추가 정보',
              style: TextStyle(
                fontFamily: 'NotoSansKR',
                color: black,
                fontSize: 14,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
              )),
        ),
        Divider(color: grey_2, height: 0),
        ListTile(
          onTap: () {
            print('상품 정보제공 고시');
          },
          contentPadding: EdgeInsets.symmetric(horizontal: spacing_xl),
          trailing: Icon(LineIcons.angleDown, size: 18, color: black),
          title: Text('상품 정보제공 고시',
              style: TextStyle(
                fontFamily: 'NotoSansKR',
                color: black,
                fontSize: 14,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
              )),
        ),
        Divider(color: grey_2, thickness: 8, height: 4),
        RecommendProduct()
      ],
    );
  }

  Widget buildBottom(BuildContext context) {
    return Container(
      width: Get.mediaQuery.size.width,
      height: 56,
      color: black,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextButton(
            style: ButtonStyle(
              minimumSize: MaterialStateProperty.all(Size(100, 50)),
            ),
            onPressed: () {
              addCart(context);
            },
            child: Text('장바구니 담기',
                style: TextStyle(
                  fontFamily: 'NotoSansKR',
                  color: white,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.normal,
                )),
          ),
          Container(
            width: 1,
            height: 20,
            decoration: BoxDecoration(border: Border.all(color: white)),
          ),
          TextButton(
            style: ButtonStyle(
              minimumSize: MaterialStateProperty.all(Size(100, 50)),
            ),
            onPressed: () {
              showModalBottomSheet(
                enableDrag: true,
                isDismissible: true,
                backgroundColor: Colors.transparent,
                // barrierColor: Colors.transparent,
                isScrollControlled: true,
                context: context,
                builder: (context) => buildSheet(context),
              );
            },
            child: Text('바로 구매 하기',
                style: TextStyle(
                  fontFamily: 'NotoSansKR',
                  color: white,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.normal,
                )),
          ),
        ],
      ),
    );
  }

  Widget makeDismissible({required Widget child}) => GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => Get.back(),
        child: GestureDetector(
          onTap: () {},
          child: child,
        ),
      );

  Widget buildSheet(context) => makeDismissible(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(25),
            ),
          ),
          padding: EdgeInsets.only(top: 16.1),
          // padding: EdgeInsets.symmetric(horizontal: 0, vertical: spacing_xxl2),
          child: Column(
            // controller: controller,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Icon(LineIcons.angleDown))
                ],
              ),
              SizedBox(height: 24.9),
              // CustomDropDownButton(key: controller.dropKey),
              // CustomShopDropDownMenu(),
              CustomShopDropDownMenuCupon(),
              SizedBox(height: 22),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('수량',
                        style: TextStyle(
                          fontFamily: 'NotoSansKR',
                          color: black,
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                        )),
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            print('aaa');
                          },
                          child: Container(
                            width: 30,
                            height: 24,
                            color: grey_2,
                            child:
                                Icon(LineIcons.minus, color: white, size: 10),
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          width: 30,
                          height: 24,
                          decoration: BoxDecoration(
                            border: Border.all(color: grey_2),
                          ),
                          child: Text('1',
                              style: TextStyle(
                                fontFamily: 'Roboto',
                                color: black,
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                fontStyle: FontStyle.normal,
                              )),
                        ),
                        InkWell(
                          onTap: () {
                            print('bb');
                          },
                          child: Container(
                            width: 30,
                            height: 24,
                            color: grey_2,
                            child: Icon(LineIcons.plus, color: white, size: 10),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: spacing_m),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('배송비',
                        style: TextStyle(
                          fontFamily: 'NotoSansKR',
                          color: black,
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                        )),
                    Text('무료배송',
                        style: TextStyle(
                          fontFamily: 'NotoSansKR',
                          color: grey_1,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                        ))
                  ],
                ),
              ),
              SizedBox(height: 23),
              Divider(thickness: 1, color: grey_3, height: 1),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(),
              ),
              SizedBox(height: spacing_s),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('총 결제금액',
                        style: TextStyle(
                          fontFamily: 'NotoSansKR',
                          color: black,
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                        )),
                    Text('4,100원',
                        style: TextStyle(
                          fontFamily: 'NotoSansKR',
                          color: Colors.red,
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                        ))
                  ],
                ),
              ),
              SizedBox(height: spacing_s),
              Container(
                width: Get.mediaQuery.size.width,
                height: 56,
                color: black,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                      style: ButtonStyle(
                        minimumSize: MaterialStateProperty.all(Size(100, 50)),
                      ),
                      onPressed: () {
                        addCart(context);
                      },
                      child: Text('장바구니 담기',
                          style: TextStyle(
                            fontFamily: 'NotoSansKR',
                            color: white,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            fontStyle: FontStyle.normal,
                          )),
                    ),
                    Container(
                      width: 1,
                      height: 20,
                      decoration:
                          BoxDecoration(border: Border.all(color: white)),
                    ),
                    TextButton(
                      style: ButtonStyle(
                        minimumSize: MaterialStateProperty.all(Size(100, 50)),
                      ),
                      onPressed: () {
                        Get.to(() => ShopOrderDetailCuponPage(),
                            transition: Transition.native);
                      },
                      child: Text('바로 구매 하기',
                          style: TextStyle(
                            fontFamily: 'NotoSansKR',
                            color: white,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            fontStyle: FontStyle.normal,
                          )),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      );

  void addCart(context) async {
    await showAnimatedDialog(
      context: context,
      barrierDismissible: true,
      animationType: DialogTransitionType.fade,
      curve: Curves.fastOutSlowIn,
      // duration: Duration(seconds: 1),
      builder: (BuildContext context) {
        return PlinicDialogTwoButton(
          button1Text: '쇼핑 계속하기',
          button2Text: '장바구니로 이동',
          title: '알림',
          content: '해당 상품이 장바구니에 추가 되었습니다.',
          button1Click: () {
            // Get.back();
            Get.back();
          },
          button2Click: () {
            Get.back();
            Get.to(() => ShopCartPage(), transition: Transition.native);
          },
        );
      },
    );
  }
}
