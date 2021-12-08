import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plinic2/constants.dart';
import 'package:plinic2/src/pages/shop/product_detail2.dart';

class RecommendProduct extends StatelessWidget {
  RecommendProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: spacing_xl),
        Container(
          padding: EdgeInsets.symmetric(horizontal: spacing_xl),
          alignment: Alignment.centerLeft,
          child: Text('함께 하면 좋은 상품이예요',
              style: TextStyle(
                fontFamily: 'NotoSansKR',
                color: black,
                fontSize: 16,
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.normal,
              )),
        ),
        SizedBox(height: spacing_m),
        Container(
          height: 150,
          padding: EdgeInsets.only(left: spacing_xl),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: data.length,
            itemBuilder: (_, index) {
              return InkWell(
                onTap: () {
                  // Get.to(() => ProductDetail2Page(),
                  //     arguments: data[index], transition: Transition.native);
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: spacing_m),
                  child: Column(
                    children: [
                      Image.asset(
                        data[index]['imgPath'],
                        width: Get.mediaQuery.size.width * 0.213,
                      ),
                      SizedBox(height: spacing_s),
                      Container(
                        width: Get.mediaQuery.size.width * 0.213,
                        child: Text(
                          data[index]['title'],
                          style: TextStyle(
                            fontFamily: 'NotoSansKR',
                            color: black,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          textAlign: TextAlign.center,
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        SizedBox(height: spacing_xxl2),
        SizedBox(height: spacing_xxl2),
      ],
    );
  }

  final List<Map<String, dynamic>> data = [
    {
      'title': '노니 클레이 마스크 100ml',
      'originalPrice': '39,000',
      'percent': 11,
      'salePrice': '27,300',
      'point': '2,800',
      'imgPath': 'assets/images/shop/shopping_detail_md_1.png',
      'productPath': 'assets/images/shop/shopping_md_product_1.jpg',
      'detailPath': 'assets/images/shop/shopping_md_detail_1.jpg'
    },
    {
      'title': '노니 앰플 미스트 50ml',
      'originalPrice': '54,000',
      'percent': 21,
      'salePrice': '30,240',
      'point': '5,760',
      'imgPath': 'assets/images/shop/shopping_detail_md_2.png',
      'productPath': 'assets/images/shop/shopping_md_product_2.jpg',
      'detailPath': 'assets/images/shop/shopping_md_detail_2.jpg'
    },
    {
      'title': '지우개 클렌징 패드 60매',
      'originalPrice': '22,000',
      'percent': 7,
      'salePrice': '13,800',
      'point': '1,740',
      'imgPath': 'assets/images/shop/shopping_detail_md_3.png',
      'productPath': 'assets/images/shop/shopping_md_product_3.jpg',
      'detailPath': 'assets/images/shop/shopping_md_detail_3.jpg'
    },
    {
      'title': '마일드젤 클렌저',
      'originalPrice': '34,000',
      'percent': 9,
      'salePrice': '27,200',
      'point': '2,930',
      'imgPath': 'assets/images/shop/shopping_detail_md_4.png',
      'productPath': 'assets/images/shop/shopping_md_product_4.jpg',
      'detailPath': 'assets/images/shop/shopping_md_detail_4.jpg'
    },
    {
      'title': '아비브 어성초 카밍 토너 스킨부스터 더블 기획',
      'originalPrice': '39,000',
      'percent': 11,
      'salePrice': '27,300',
      'point': '2,800',
      'imgPath': 'assets/images/shop/shopping_detail_md_5.png',
      'productPath': 'assets/images/shop/shopping_md_product_5.jpg',
      'detailPath': 'assets/images/shop/shopping_md_detail_5.jpg'
    },
    {
      'title': '바이오힐보 프로바이오덤 리페어 스킨&에멀전 2종세트',
      'originalPrice': '54,000',
      'percent': 21,
      'salePrice': '30,240',
      'point': '5,760',
      'imgPath': 'assets/images/shop/shopping_detail_md_6.png',
      'productPath': 'assets/images/shop/shopping_md_product_6.jpg',
      'detailPath': 'assets/images/shop/shopping_md_detail_6.jpg'
    },
    {
      'title': '넘버즈인 3번 결광가득 에센스 토너 200ml',
      'originalPrice': '22,000',
      'percent': 7,
      'salePrice': '13,800',
      'point': '1,740',
      'imgPath': 'assets/images/shop/shopping_detail_md_7.png',
      'productPath': 'assets/images/shop/shopping_md_product_7.jpg',
      'detailPath': 'assets/images/shop/shopping_md_detail_7.jpg'
    },
    {
      'title': '에스트라 테라크네365 하이드레이션 토너 대용량 기획 320ml',
      'originalPrice': '34,000',
      'percent': 9,
      'salePrice': '27,200',
      'point': '2,930',
      'imgPath': 'assets/images/shop/shopping_detail_md_8.png',
      'productPath': 'assets/images/shop/shopping_md_product_8.jpg',
      'detailPath': 'assets/images/shop/shopping_md_detail_8.jpg'
    },
  ];
}
