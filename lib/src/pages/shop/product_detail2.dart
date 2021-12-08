import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:plinic2/constants.dart';
import 'package:plinic2/src/component/custom_appbar.dart';
import 'package:plinic2/src/controller/product_detail_controller.dart';
import 'package:plinic2/src/pages/shop/components/recommend_product.dart';

class ProductDetail2Page extends GetView<ProductDetailController> {
  const ProductDetail2Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ProductDetailController());
    var data = Get.arguments;
    return Scaffold(
      appBar: CustomAppbar('상품 상세 정보'),
      backgroundColor: white,
      bottomSheet: buildBottom(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: spacing_s),
            Container(
              alignment: Alignment.center,
              child: Image.asset(
                data['imgPath'],
                width: Get.mediaQuery.size.width * 0.427,
                fit: BoxFit.fitWidth,
              ),
            ),
            SizedBox(height: spacing_xxl),
            Container(
              padding: EdgeInsets.symmetric(horizontal: spacing_xl),
              alignment: Alignment.centerLeft,
              child: Text(
                data['title'],
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
              child: Text('${data['originalPrice']}원',
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
                  Text('${data['percent']}%',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        color: primary,
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.normal,
                      )),
                  SizedBox(width: 11),
                  Text('${data['salePrice']}원',
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
              child: Text('ⓒ ${data['point']} 사용가능',
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
                        print('상품정보 클릭');
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: Get.mediaQuery.size.width * 0.5,
                        height: 51,
                        child: Text(
                          '상품정보',
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
                    Container(
                      width: Get.mediaQuery.size.width * 0.5,
                      height: 2,
                      color: black,
                    )
                  ],
                ),
                Column(
                  children: [
                    InkWell(
                      onTap: () {
                        print('상품 리뷰 클릭');
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: Get.mediaQuery.size.width * 0.5,
                        height: 51,
                        child: Text(
                          '상품리뷰(127)',
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
                    Container(
                      width: Get.mediaQuery.size.width * 0.5,
                      height: 2,
                      color: white,
                    )
                  ],
                ),
              ],
            ),
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
                      padding:
                          const EdgeInsets.symmetric(horizontal: spacing_xl),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          alignment: Alignment.center,
                          backgroundColor:
                              MaterialStateProperty.resolveWith<Color>(
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
                      padding:
                          const EdgeInsets.symmetric(horizontal: spacing_xl),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          alignment: Alignment.center,
                          backgroundColor:
                              MaterialStateProperty.resolveWith<Color>(
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
                                  fontSize: 12,
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
        ),
      ),
    );
  }

  Widget buildBottom() {
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
            onPressed: () {},
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
            onPressed: () {},
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
}
