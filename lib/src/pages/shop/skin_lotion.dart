import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:plinic2/constants.dart';
import 'package:plinic2/src/pages/shop/product_detail.dart';

class SkinLotionPage extends StatelessWidget {
  SkinLotionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      backgroundColor: white,
      body: buildBody(),
    );
  }

  Widget buildBody() {
    return Container(
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 11),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text('신상품순',
                        style: TextStyle(
                          fontFamily: 'NotoSansKR',
                          color: grey_1,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                        )),
                    SizedBox(width: spacing_xxs),
                    Icon(
                      LineIcons.angleDown,
                      color: grey_1,
                      size: 13,
                    )
                  ],
                ),
                Row(
                  children: [
                    Text('상품',
                        style: TextStyle(
                          fontFamily: 'NotoSansKR',
                          color: grey_1,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                        )),
                    SizedBox(width: spacing_xxs),
                    Text('16개',
                        style: TextStyle(
                          fontFamily: 'NotoSansKR',
                          color: primary,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                        ))
                  ],
                )
              ],
            ),
          ),
          SizedBox(height: spacing_m),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
                    child: GridView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: data.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        childAspectRatio: 0.48,
                      ),
                      itemBuilder: (_, index) {
                        return InkWell(
                          onTap: () {
                            Get.to(
                              () => ProductDetailPage(),
                              arguments: data[index],
                              transition: Transition.native,
                            );
                          },
                          child: Column(
                            children: [
                              Image.asset(
                                data[index]['imgPath'],
                                width: Get.mediaQuery.size.width * 0.416,
                                fit: BoxFit.fitWidth,
                              ),
                              SizedBox(height: 11.1),
                              Row(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      print('abcd');
                                    },
                                    child: Icon(
                                      LineIcons.heart,
                                      size: 20,
                                    ),
                                  ),
                                  SizedBox(width: 12.3),
                                  InkWell(
                                    onTap: () {
                                      print('bcda');
                                    },
                                    child: Icon(
                                      LineIcons.shoppingBag,
                                      size: 20,
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(height: 9.8),
                              Text(
                                data[index]['title'],
                                style: TextStyle(
                                  fontFamily: 'NotoSansKR',
                                  color: black,
                                  fontSize: 12,
                                  height: 1.63,
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                              ),
                              SizedBox(height: spacing_xxs),
                              Row(
                                children: [
                                  Text('${data[index]['percent']}%',
                                      style: TextStyle(
                                        fontFamily: 'Roboto',
                                        color: primary,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700,
                                        fontStyle: FontStyle.normal,
                                      )),
                                  SizedBox(width: spacing_xxs),
                                  Text('${data[index]['originalPrice']}원',
                                      style: TextStyle(
                                        fontFamily: 'NotoSansKR',
                                        color: grey_2,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        fontStyle: FontStyle.normal,
                                      ))
                                ],
                              ),
                              SizedBox(height: spacing_xxs),
                              Row(
                                children: [
                                  Text('${data[index]['salePrice']}원',
                                      style: TextStyle(
                                        fontFamily: 'NotoSansKR',
                                        color: black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                        fontStyle: FontStyle.normal,
                                      )),
                                ],
                              ),
                              SizedBox(height: spacing_xxs),
                              Row(
                                children: [
                                  Text('ⓒ ${data[index]['point']} 사용가능',
                                      style: TextStyle(
                                        fontFamily: 'NotoSansKR',
                                        color: Colors.red,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        fontStyle: FontStyle.normal,
                                      )),
                                ],
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      centerTitle: true,
      backgroundColor: white,
      elevation: 0.3,
      leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: Icon(LineIcons.arrowLeft, color: black)),
      title: Text('스킨/로션/올인원',
          style: TextStyle(
            fontFamily: 'NotoSansKR',
            color: black,
            fontSize: 16,
            fontWeight: FontWeight.w700,
            fontStyle: FontStyle.normal,
          )),
      actions: [
        IconButton(
          onPressed: () {
            print(';');
          },
          icon: Icon(LineIcons.shoppingBag, color: black),
        )
      ],
    );
  }

  final List<Map<String, dynamic>> data = [
    {
      'title': '아비브 어성초 카밍 토너 스킨부스터 더블 기획',
      'originalPrice': '39,000',
      'percent': 11,
      'salePrice': '27,300',
      'point': '2,800',
      'imgPath': 'assets/images/shop/shopping-list-1.png',
      'detailPath': 'assets/images/shop/shopping_detail_1.png'
    },
    {
      'title': '바이오힐보 프로바이오덤 리페어 스킨&에멀전 2종세트',
      'originalPrice': '54,000',
      'percent': 21,
      'salePrice': '30,240',
      'point': '5,760',
      'imgPath': 'assets/images/shop/shopping-list-2.png',
      'detailPath': 'assets/images/shop/shopping_detail_2.jpg'
    },
    {
      'title': '넘버즈인 3번 결광가득 에센스 토너 200ml',
      'originalPrice': '22,000',
      'percent': 7,
      'salePrice': '13,800',
      'point': '1,740',
      'imgPath': 'assets/images/shop/shopping-list-3.png',
      'detailPath': 'assets/images/shop/shopping_detail_3.jpg'
    },
    {
      'title': '에스트라 테라크네365 하이드레이션 토너 대용량 기획 320ml',
      'originalPrice': '34,000',
      'percent': 9,
      'salePrice': '27,200',
      'point': '2,930',
      'imgPath': 'assets/images/shop/shopping-list-4.png',
      'detailPath': 'assets/images/shop/shopping_detail_4.jpg'
    },
    {
      'title': '아비브 어성초 카밍 토너 스킨부스터 더블 기획',
      'originalPrice': '39,000',
      'percent': 11,
      'salePrice': '27,300',
      'point': '2,800',
      'imgPath': 'assets/images/shop/shopping-list-1.png',
      'detailPath': 'assets/images/shop/shopping_detail_1.png'
    },
    {
      'title': '바이오힐보 프로바이오덤 리페어 스킨&에멀전 2종세트',
      'originalPrice': '54,000',
      'percent': 21,
      'salePrice': '30,240',
      'point': '5,760',
      'imgPath': 'assets/images/shop/shopping-list-2.png',
      'detailPath': 'assets/images/shop/shopping_detail_2.jpg'
    },
    {
      'title': '넘버즈인 3번 결광가득 에센스 토너 200ml',
      'originalPrice': '22,000',
      'percent': 7,
      'salePrice': '13,800',
      'point': '1,740',
      'imgPath': 'assets/images/shop/shopping-list-3.png',
      'detailPath': 'assets/images/shop/shopping_detail_3.jpg'
    },
    {
      'title': '에스트라 테라크네365 하이드레이션 토너 대용량 기획 320ml',
      'originalPrice': '34,000',
      'percent': 9,
      'salePrice': '27,200',
      'point': '2,930',
      'imgPath': 'assets/images/shop/shopping-list-4.png',
      'detailPath': 'assets/images/shop/shopping_detail_4.jpg'
    },
  ];
}
