import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:plinic2/constants.dart';
import 'package:plinic2/src/pages/shop/skin_lotion.dart';

class ShopFive extends StatelessWidget {
  ShopFive({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: spacing_xl),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('헤어케어',
                  style: TextStyle(
                    fontFamily: 'NotoSansKR',
                    color: black,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal,
                  )),
              InkWell(
                onTap: () {
                  print('헤어케어/// 더보기 클릭됨');
                  Get.to(() => SkinLotionPage(), transition: Transition.native);
                },
                child: Row(
                  children: [
                    Text('더보기',
                        style: TextStyle(
                          fontFamily: 'NotoSansKR',
                          color: grey_2,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                        )),
                    Icon(LineIcons.angleRight, color: grey_2, size: 15)
                  ],
                ),
              )
            ],
          ),
        ),
        SizedBox(height: spacing_l),
        Padding(
          padding: const EdgeInsets.only(left: spacing_xl),
          child: Container(
            width: Get.mediaQuery.size.width,
            height: Get.mediaQuery.size.width * 0.62,
            child: ListView.builder(
              itemCount: data.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index) {
                return InkWell(
                  onTap: () {
                    Get.to(() => SkinLotionPage(),
                        transition: Transition.native);
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: spacing_s),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          data[index]['imgPath'],
                          width: Get.mediaQuery.size.width * 0.32,
                          fit: BoxFit.fitWidth,
                        ),
                        SizedBox(height: spacing_xxs),
                        Container(
                          width: Get.mediaQuery.size.width * 0.32,
                          child: Text(
                            data[index]['title'],
                            style: TextStyle(
                              fontFamily: 'NotoSansKR',
                              color: black,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        SizedBox(height: spacing_xxs),
                        Text('${data[index]['originalPrice']}원',
                            style: TextStyle(
                              fontFamily: 'NotoSansKR',
                              color: grey_2,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                            )),
                        SizedBox(height: spacing_xxs),
                        Row(
                          children: [
                            Text('${data[index]['percent'].toString()}%',
                                style: TextStyle(
                                  fontFamily: 'NotoSansKR',
                                  color: primary,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  fontStyle: FontStyle.normal,
                                )),
                            SizedBox(width: 2),
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
                        Text('ⓒ ${data[index]['point']} 사용가능 ',
                            style: TextStyle(
                              fontFamily: 'NotoSansKR',
                              color: Colors.red,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                            ))
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        )
      ],
    );
  }

  final List<Map<String, dynamic>> data = [
    {
      'title': '힐링버드 울트라 프로틴 노워시 앰플트리트먼...',
      'originalPrice': '24,000',
      'percent': 3,
      'salePrice': '16,800',
      'point': '1,170',
      'imgPath': 'assets/images/shop/shopping-hair-1.png'
    },
    {
      'title': '아로마티카 로즈마리 스칼프 스케일링 샴푸 10...',
      'originalPrice': '42,800',
      'percent': 3,
      'salePrice': '29,400',
      'point': '2,670',
      'imgPath': 'assets/images/shop/shopping-hair-2.png'
    },
    {
      'title': '[NEW컬러추가] [염색] 블랙핑크 x 미쟝센 ...',
      'originalPrice': '16,000',
      'percent': 3,
      'salePrice': '6,900',
      'point': '480',
      'imgPath': 'assets/images/shop/shopping-hair-3.png'
    },
    {
      'title': '라보에이치 탈모증상완화 샴푸 333ml+125ml 기획 [두피강화/두피쿨링]',
      'originalPrice': '16,800',
      'percent': 3,
      'salePrice': '16,800',
      'point': '1,170',
      'imgPath': 'assets/images/shop/shopping-hair-4.png'
    },
    {
      'title': '다슈 데일리 울트라 홀딩 스칼프 스프레이 200ml (탈모증상완화 도움 기능성 헤어스프레이)',
      'originalPrice': '16,800',
      'percent': 3,
      'salePrice': '16,800',
      'point': '1,170',
      'imgPath': 'assets/images/shop/shopping-hair-5.png'
    },
  ];
}
