import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plinic2/constants.dart';
import 'package:plinic2/src/component/custom_appbar.dart';
import 'package:plinic2/src/model/sample_shop_order_list_data.dart';
import 'package:plinic2/src/pages/shop/shop_order_detail.dart';

class ShopOrderList extends StatelessWidget {
  const ShopOrderList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppbar('주문내역'),
        backgroundColor: white,
        body: ListView.builder(
          itemCount: orderListData.length,
          itemBuilder: (_, index) {
            return Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: spacing_xl),
                  alignment: Alignment.center,
                  width: Get.mediaQuery.size.width,
                  height: 48,
                  color: grey_3,
                  child: Row(
                    children: [
                      Text('주문일',
                          style: TextStyle(
                            fontFamily: 'NotoSansKR',
                            color: grey_1,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                          )),
                      SizedBox(width: spacing_s),
                      Expanded(
                        child: Text(orderListData[index].payDate.toString(),
                            style: TextStyle(
                              fontFamily: 'NotoSansKR',
                              color: black,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                            )),
                      ),
                      InkWell(
                        onTap: () {
                          Get.to(
                              () => ShopOrderDetailPage(
                                    orderListData: orderListData[index],
                                  ),
                              transition: Transition.native);
                        },
                        child: Text('상세보기',
                            style: TextStyle(
                                fontFamily: 'NotoSansKR',
                                color: grey_1,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                                decoration: TextDecoration.underline)),
                      )
                    ],
                  ),
                ),
                SizedBox(height: spacing_m),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
                  child: Row(
                    children: [
                      Image.asset(
                        orderListData[index].imgPath.toString(),
                        width: Get.mediaQuery.size.width * 0.192,
                        fit: BoxFit.fitWidth,
                      ),
                      SizedBox(width: spacing_m),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: Get.mediaQuery.size.width * 0.630,
                            height: 40,
                            child: Text(
                              orderListData[index].name.toString(),
                              style: TextStyle(
                                fontFamily: 'NotoSansKR',
                                color: black,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          SizedBox(height: spacing_xs),
                          Row(
                            children: [
                              RichText(
                                  text: TextSpan(children: [
                                TextSpan(
                                    text: '${orderListData[index].percent}개 (',
                                    style: TextStyle(
                                      fontFamily: 'NotoSansKR',
                                      color: grey_1,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      fontStyle: FontStyle.normal,
                                    )),
                                TextSpan(
                                    text: orderListData[index].salePrice,
                                    style: TextStyle(
                                      fontFamily: 'NotoSansKR',
                                      color: black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                      fontStyle: FontStyle.normal,
                                    )),
                                TextSpan(
                                    text: '원)',
                                    style: TextStyle(
                                      fontFamily: 'NotoSansKR',
                                      color: grey_1,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      fontStyle: FontStyle.normal,
                                    )),
                              ]))
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(height: spacing_xxl2),
              ],
            );
          },
        ));
  }
}
