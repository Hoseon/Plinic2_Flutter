import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plinic2/constants.dart';
import 'package:plinic2/src/model/sample_shop_best_data.dart';

class ShopTab3First extends StatelessWidget {
  const ShopTab3First({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: spacing_l),
        ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          itemCount: bestData.length,
          itemBuilder: (_, index) {
            return buildBestBody(
                bestData[index].imgPath!,
                bestData[index].name!,
                bestData[index].originalPrice!,
                bestData[index].salePrice!,
                bestData[index].point!,
                bestData[index].percent!,
                index);
          },
          shrinkWrap: true,
        ),
        // buildPadding(),
        SizedBox(height: spacing_l),
      ],
    );
  }

  Widget buildBestBody(String imgPath, String name, String originalPrice,
      String salePrice, String point, int percent, int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
      child: Column(
        children: [
          Row(
            children: [
              Stack(
                children: [
                  Image.asset(
                    imgPath,
                    width: Get.mediaQuery.size.width * 0.267,
                  ),
                  Positioned(
                    left: Get.mediaQuery.size.width * 0.015,
                    top: Get.mediaQuery.size.width * 0.015,
                    child: Container(
                      alignment: Alignment.center,
                      width: Get.mediaQuery.size.width * 0.064,
                      height: Get.mediaQuery.size.width * 0.064,
                      decoration: BoxDecoration(
                        color: primary,
                        borderRadius: BorderRadius.circular(2),
                      ),
                      child: Text((index + 1).toString(),
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            color: white,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                          )),
                    ),
                  )
                ],
              ),
              SizedBox(width: spacing_m),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: Get.mediaQuery.size.width * 0.560,
                    height: 40,
                    child: Text(
                      name,
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
                  ),
                  SizedBox(height: spacing_xxs),
                  Row(
                    children: [
                      Text('$percent%',
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            color: primary,
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            fontStyle: FontStyle.normal,
                          )),
                      SizedBox(width: spacing_xxs),
                      Text('$originalPrice원',
                          style: TextStyle(
                              fontFamily: 'NotoSansKR',
                              color: grey_2,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                              decoration: TextDecoration.lineThrough))
                    ],
                  ),
                  SizedBox(height: spacing_xxs),
                  Text('$salePrice원',
                      style: TextStyle(
                        fontFamily: 'NotoSansKR',
                        color: black,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.normal,
                      )),
                  SizedBox(height: spacing_xxs),
                  Text('ⓒ $point 사용가능 ',
                      style: TextStyle(
                        fontFamily: 'NotoSansKR',
                        color: Colors.red,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      ))
                ],
              )
            ],
          ),
          SizedBox(height: spacing_l),
        ],
      ),
    );
  }
}
