import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:plinic2/constants.dart';

class ShopSearchPage extends StatelessWidget {
  const ShopSearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: white,
        elevation: 0.3,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(LineIcons.arrowLeft, color: black),
        ),
        title: TextField(
          decoration: InputDecoration(
            focusColor: grey_1,
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide.none,
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide.none,
            ),
            hintText: '어떤 상품을 찾으시나요?',
            hintStyle: TextStyle(
              fontFamily: 'NotoSansKR',
              color: textfields,
              fontSize: 16,
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.normal,
            ),
          ),
        ),
      ),
      body: GestureDetector(
        onTap: () {
          Get.focusScope!.unfocus();
        },
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: spacing_m),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('최근검색어',
                        style: TextStyle(
                          fontFamily: 'NotoSansKR',
                          color: black,
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                        )),
                    InkWell(
                      onTap: () {
                        print('검색어 전체삭제');
                      },
                      child: Text('검색어 전체삭제',
                          style: TextStyle(
                            fontFamily: 'NotoSansKR',
                            color: grey_1,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                          )),
                    ),
                  ],
                ),
              ),
              SizedBox(height: spacing_l),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: Get.mediaQuery.size.width * 0.42,
                      color: white,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('아이크림',
                                  style: TextStyle(
                                    fontFamily: 'NotoSansKR',
                                    color: black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    fontStyle: FontStyle.normal,
                                  )),
                              Icon(LineIcons.times, size: 20, color: grey_2)
                            ],
                          ),
                          SizedBox(height: spacing_xl),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('프라이머',
                                  style: TextStyle(
                                    fontFamily: 'NotoSansKR',
                                    color: black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    fontStyle: FontStyle.normal,
                                  )),
                              Icon(LineIcons.times, size: 20, color: grey_2)
                            ],
                          ),
                          SizedBox(height: spacing_xl),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('쿠션',
                                  style: TextStyle(
                                    fontFamily: 'NotoSansKR',
                                    color: black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    fontStyle: FontStyle.normal,
                                  )),
                              Icon(LineIcons.times, size: 20, color: grey_2)
                            ],
                          ),
                          SizedBox(height: spacing_xl),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('클렌징밤',
                                  style: TextStyle(
                                    fontFamily: 'NotoSansKR',
                                    color: black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    fontStyle: FontStyle.normal,
                                  )),
                              Icon(LineIcons.times, size: 20, color: grey_2)
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: Get.mediaQuery.size.width * 0.43,
                      // height: 100,
                      color: white,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('프라이머',
                                  style: TextStyle(
                                    fontFamily: 'NotoSansKR',
                                    color: black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    fontStyle: FontStyle.normal,
                                  )),
                              Icon(LineIcons.times, size: 20, color: grey_2)
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: spacing_l),
              Divider(color: grey_2),
              SizedBox(height: 48),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('인기검색어',
                        style: TextStyle(
                          fontFamily: 'NotoSansKR',
                          color: black,
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                        )),
                    Text('전일자 기준',
                        style: TextStyle(
                          fontFamily: 'NotoSansKR',
                          color: grey_1,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                        )),
                  ],
                ),
              ),
              SizedBox(height: spacing_l),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: spacing_xxl2),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text('1',
                            style: TextStyle(
                              fontFamily: 'NotoSansKR',
                              color: black,
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              fontStyle: FontStyle.normal,
                            )),
                        SizedBox(width: spacing_l),
                        Text('핸드크림',
                            style: TextStyle(
                              fontFamily: 'NotoSansKR',
                              color: black,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                            ))
                      ],
                    ),
                    SizedBox(height: spacing_m),
                    Row(
                      children: [
                        Text('2',
                            style: TextStyle(
                              fontFamily: 'NotoSansKR',
                              color: black,
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              fontStyle: FontStyle.normal,
                            )),
                        SizedBox(width: spacing_l),
                        Text('립밤',
                            style: TextStyle(
                              fontFamily: 'NotoSansKR',
                              color: black,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                            ))
                      ],
                    ),
                    SizedBox(height: spacing_m),
                    Row(
                      children: [
                        Text('3',
                            style: TextStyle(
                              fontFamily: 'NotoSansKR',
                              color: black,
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              fontStyle: FontStyle.normal,
                            )),
                        SizedBox(width: spacing_l),
                        Text('마스크팩',
                            style: TextStyle(
                              fontFamily: 'NotoSansKR',
                              color: black,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                            ))
                      ],
                    ),
                    SizedBox(height: spacing_m),
                    Row(
                      children: [
                        Text('4',
                            style: TextStyle(
                              fontFamily: 'NotoSansKR',
                              color: black,
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              fontStyle: FontStyle.normal,
                            )),
                        SizedBox(width: spacing_l),
                        Text('닥터지',
                            style: TextStyle(
                              fontFamily: 'NotoSansKR',
                              color: black,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                            ))
                      ],
                    ),
                    SizedBox(height: spacing_m),
                    Row(
                      children: [
                        Text('5',
                            style: TextStyle(
                              fontFamily: 'NotoSansKR',
                              color: black,
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              fontStyle: FontStyle.normal,
                            )),
                        SizedBox(width: spacing_l),
                        Text('샴푸',
                            style: TextStyle(
                              fontFamily: 'NotoSansKR',
                              color: black,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                            ))
                      ],
                    ),
                    SizedBox(height: spacing_m),
                    Row(
                      children: [
                        Text('6',
                            style: TextStyle(
                              fontFamily: 'NotoSansKR',
                              color: black,
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              fontStyle: FontStyle.normal,
                            )),
                        SizedBox(width: spacing_l),
                        Text('마스카라',
                            style: TextStyle(
                              fontFamily: 'NotoSansKR',
                              color: black,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                            ))
                      ],
                    ),
                    SizedBox(height: spacing_m),
                    Row(
                      children: [
                        Text('7',
                            style: TextStyle(
                              fontFamily: 'NotoSansKR',
                              color: black,
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              fontStyle: FontStyle.normal,
                            )),
                        SizedBox(width: spacing_l),
                        Text('파우더',
                            style: TextStyle(
                              fontFamily: 'NotoSansKR',
                              color: black,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                            ))
                      ],
                    ),
                    SizedBox(height: spacing_m),
                    Row(
                      children: [
                        Text('8',
                            style: TextStyle(
                              fontFamily: 'NotoSansKR',
                              color: black,
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              fontStyle: FontStyle.normal,
                            )),
                        SizedBox(width: spacing_l),
                        Text('플라즈마',
                            style: TextStyle(
                              fontFamily: 'NotoSansKR',
                              color: black,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                            ))
                      ],
                    ),
                    SizedBox(height: spacing_m),
                    Row(
                      children: [
                        Text('9',
                            style: TextStyle(
                              fontFamily: 'NotoSansKR',
                              color: black,
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              fontStyle: FontStyle.normal,
                            )),
                        SizedBox(width: spacing_l),
                        Text('인센스',
                            style: TextStyle(
                              fontFamily: 'NotoSansKR',
                              color: black,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                            ))
                      ],
                    ),
                    SizedBox(height: spacing_m),
                    Row(
                      children: [
                        Text('10',
                            style: TextStyle(
                              fontFamily: 'NotoSansKR',
                              color: black,
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              fontStyle: FontStyle.normal,
                            )),
                        SizedBox(width: spacing_l),
                        Text('치약',
                            style: TextStyle(
                              fontFamily: 'NotoSansKR',
                              color: black,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                            ))
                      ],
                    ),
                    SizedBox(height: spacing_xxl2),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
