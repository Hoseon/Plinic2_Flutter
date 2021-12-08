import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:plinic2/constants.dart';
import 'package:plinic2/src/component/custom_appbar.dart';
import 'package:plinic2/src/component/plinic_dialog_two_button.dart';
import 'package:plinic2/src/pages/challenge/before_after_create.dart';
import 'package:plinic2/src/pages/challenge/before_after_detail.dart';
import 'package:readmore/readmore.dart';

class BeforeAfterPage extends StatelessWidget {
  const BeforeAfterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 10, right: 5, bottom: 50),
        child: FloatingActionButton(
          onPressed: () {
            Get.to(BeforeAfterCreatePage(), transition: Transition.native);
          },
          backgroundColor: primary,
          child: SvgPicture.asset('assets/images/floating-create.svg',
              width: 60, height: 60),
          // backgroundColor: ,
        ),
      ),
      appBar: CustomAppbar('비포 & 에프터'),
      backgroundColor: white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: spacing_xl),
            Padding(
              padding:
                  const EdgeInsets.only(left: spacing_xl, right: spacing_xs),
              child: Container(
                color: Colors.transparent,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      '게시물',
                      style: TextStyle(
                        fontFamily: 'NotoSansKR',
                        color: Color(0xff000000),
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                    SizedBox(width: spacing_xxs),
                    Expanded(
                      child: Text('122',
                          style: TextStyle(
                            fontFamily: 'NotoSansKR',
                            color: black,
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            fontStyle: FontStyle.normal,
                          )),
                    ),
                    InkWell(
                      splashColor: grey_2,
                      onTap: () {
                        showActionSheet_Filter(context);
                      },
                      child: Row(
                        children: [
                          Text('필터',
                              style: TextStyle(
                                fontFamily: 'NotoSansKR',
                                color: black,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                              )),
                          SizedBox(width: 7.1),
                          Icon(LineIcons.filter),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: spacing_l),
            Divider(),
            SizedBox(height: 36),
            bodyImage(context),
            bodyOnlyText(context),
            bodyImage(context),
            // Stack(
            //   fit: StackFit.loose,
            //   clipBehavior: Clip.none,
            //   alignment: Alignment.center,
            //   children: [
            //     bodyOnlyText(),
            //     GestureDetector(
            //       onTap: () {
            //         // Get.to(() => MyPostDetailBlindPage());
            //       },
            //       child: Container(
            //         color: Colors.black.withOpacity(0.8),
            //         width: Get.mediaQuery.size.width,
            //         height: Get.mediaQuery.size.height * 0.35,
            //         child: Column(
            //           mainAxisAlignment: MainAxisAlignment.center,
            //           children: [
            //             Text(
            //               '관리자에 의하여 블라인드 처리 되었습니다.\n사유를 확인하시려면 눌러주세요.',
            //               style: TextStyle(
            //                 fontFamily: 'NotoSansKR',
            //                 color: Colors.white,
            //                 fontSize: 14,
            //                 fontWeight: FontWeight.w700,
            //                 fontStyle: FontStyle.normal,
            //               ),
            //               textAlign: TextAlign.center,
            //             ),
            //           ],
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }

  Widget bodyImage(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: spacing_xl, right: spacing_xs),
          child: Container(
            color: Colors.transparent,
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 38,
                  height: 38,
                  child: CircleAvatar(
                      radius: 50,
                      backgroundImage:
                          AssetImage('assets/images/profile-big.png')),
                ),
                SizedBox(width: spacing_xs),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('이미나',
                          style: TextStyle(
                            fontFamily: 'NotoSansKR',
                            color: black,
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            fontStyle: FontStyle.normal,
                          )),
                      Text('2021.07.21',
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
                InkWell(
                  splashColor: grey_2,
                  radius: 50,
                  borderRadius: BorderRadius.circular(50),
                  onTap: () {
                    showActionSheet(context);
                  },
                  child: Icon(LineIcons.verticalEllipsis),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: spacing_m),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: InkWell(
            splashColor: grey_2,
            onTap: () {
              Get.to(() => BeforeAfterDetailPage(),
                  transition: Transition.native);
            },
            child: Container(
              color: Colors.transparent,
              child: Row(
                children: [
                  Text(
                    '피부가 정말 좋아졌어요 ㅋㅋ',
                    style: TextStyle(
                      fontFamily: 'NotoSansKR',
                      color: Color(0xff000000),
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(height: spacing_xs),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
          child: InkWell(
            splashColor: grey_2,
            onTap: () {
              Get.to(() => BeforeAfterDetailPage(),
                  transition: Transition.native);
            },
            child: Container(
              color: Colors.transparent,
              child: ReadMoreText(
                '플리닉에서 받은 구독박스로 피부 관리 하고 있는데 정말피부가 좋아졌어요 ㅋㅋㅋㅋ\n피부가 좋아 지니까 자신감이 올라가서 빨리 마플리닉에서 받은 구독박스로 피부 관리 하고 있는데 정말피부가 좋아졌어요 ㅋㅋㅋㅋ 피부가 좋아 지니까 자신감이 올라가서 빨리 마플리닉에서 받은 구독박스로 피부 관리 하고 있는데 정말피부가 좋아졌어요 ㅋㅋㅋㅋ 피부가 좋아 지니까 자신감이 올라가서 빨리 마플리닉에서 받은 구독박스로 피부 관리 하고 있는데 정말피부�� 좋아졌어요 ㅋㅋㅋㅋ 피부가 좋아 지니까 자신감이 올라가서 빨리 마 플리닉에서플리닉에서플리닉에서플리닉에서',
                trimLines: 3,
                colorClickableText: grey_1,
                trimMode: TrimMode.Line,
                trimCollapsedText: '더보기',
                trimExpandedText: '접기',
                delimiter: '... ',
                textAlign: TextAlign.start,
                locale: Locale.fromSubtags(languageCode: 'kr'),
                style: TextStyle(
                  fontFamily: 'NotoSansKR',
                  color: grey_1,
                  fontSize: 14,
                  height: 1.64,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                ),
                moreStyle: TextStyle(
                  fontFamily: 'NotoSansKR',
                  color: grey_1,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: spacing_m),
        imageSlideshow(),
        SizedBox(height: spacing_m),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(LineIcons.heart),
              SizedBox(width: spacing_xxs),
              Text(
                '152명이 했어요',
                style: TextStyle(
                  fontFamily: 'NotoSansKR',
                  color: black,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                ),
              )
            ],
          ),
        ),
        SizedBox(height: spacing_xl),
        Divider(
          color: grey_3,
          thickness: 8,
        ),
        SizedBox(height: spacing_xl),

        // SizedBox(height: 26),
      ],
    );
  }

  ImageSlideshow imageSlideshow() {
    return ImageSlideshow(
      indicatorColor: Color(0xff9a5cf4),
      indicatorBackgroundColor: grey_3,
      width: Get.mediaQuery.size.width,
      height: Get.mediaQuery.size.height * 0.4,
      children: [
        Image.asset(
          'assets/images/image-post.png',
          fit: BoxFit.cover,
        ),
        Image.asset(
          'assets/images/image-post.png',
          fit: BoxFit.cover,
        ),
        Image.asset(
          'assets/images/image-post.png',
          fit: BoxFit.cover,
        ),
      ],
    );
  }

  Widget bodyOnlyText(BuildContext context) {
    return Column(
      children: [
        // SizedBox(height: spacing_xl),
        Padding(
          padding: const EdgeInsets.only(left: spacing_xl, right: spacing_xs),
          child: Container(
            color: Colors.transparent,
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 38,
                  height: 38,
                  child: CircleAvatar(
                      radius: 50,
                      backgroundImage:
                          AssetImage('assets/images/profile-big.png')),
                ),
                SizedBox(width: spacing_xs),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('이미나',
                          style: TextStyle(
                            fontFamily: 'NotoSansKR',
                            color: black,
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            fontStyle: FontStyle.normal,
                          )),
                      Text('2021.07.21',
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
                InkWell(
                  splashColor: grey_2,
                  radius: 50,
                  borderRadius: BorderRadius.circular(50),
                  onTap: () {
                    showActionSheet(context);
                  },
                  child: Icon(LineIcons.verticalEllipsis),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: spacing_m),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: InkWell(
            splashColor: grey_2,
            onTap: () {
              // Get.to(() => MyPostDetailPage());
            },
            child: Container(
              color: Colors.transparent,
              child: Row(
                children: [
                  Text(
                    '피부가 정말 좋아졌어요 ㅋㅋ',
                    style: TextStyle(
                      fontFamily: 'NotoSansKR',
                      color: Color(0xff000000),
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(height: spacing_xs),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
          child: InkWell(
            splashColor: grey_2,
            onTap: () {
              // Get.to(() => MyPostDetailPage());
            },
            child: Container(
              color: Colors.transparent,
              child: ReadMoreText(
                '플리닉에서 받은 구독박스로 피부 관리 하고 있는데 정말피부가 좋아졌어요 ㅋㅋㅋㅋ\n피부가 좋아 지니까 자신감이 올라가서 빨리 마플리닉에서 받은 구독박스로 피부 관리 하고 있는데 정말피부가 좋아졌어요 ㅋㅋㅋㅋ 피부가 좋아 지니까 자신감이 올라가서 빨리 마플리닉에서 받은 구독박스로 피부 관리 하고 있는데 정말피부가 좋아졌어요 ㅋㅋㅋㅋ 피부가 좋아 지니까 자신감이 올라가서 빨리 마플리닉에서 받은 구독박스로 피부 관리 하��� 있는데 정말피부�� 좋아졌어요 ㅋㅋㅋㅋ 피부가 좋아 지니까 자신감이 올라가서 빨리 마 플리닉에서플리닉에서플리닉에서플리닉에서',
                trimLines: 3,
                colorClickableText: grey_1,
                trimMode: TrimMode.Line,
                trimCollapsedText: '더보기',
                trimExpandedText: '접기',
                delimiter: '... ',
                textAlign: TextAlign.start,
                locale: Locale.fromSubtags(languageCode: 'kr'),
                style: TextStyle(
                  fontFamily: 'NotoSansKR',
                  color: grey_1,
                  fontSize: 14,
                  height: 1.64,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                ),
                moreStyle: TextStyle(
                  fontFamily: 'NotoSansKR',
                  color: grey_1,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: spacing_m),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(LineIcons.heart),
              SizedBox(width: spacing_xxs),
              Text(
                '98명이 했어요',
                style: TextStyle(
                  fontFamily: 'NotoSansKR',
                  color: black,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                ),
              )
            ],
          ),
        ),
        SizedBox(height: spacing_xl),
        Divider(
          color: grey_3,
          thickness: 8,
        ),
        SizedBox(height: spacing_xl),
      ],
    );
  }

  void showActionSheet(BuildContext context) {
    Get.bottomSheet(
      Container(
          height: 180,
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: spacing_xxs),
            child: Column(
              children: [
                // ListTile(
                //   title: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       Text(
                //         '카테고리 선택',
                //         style: TextStyle(
                //           fontFamily: 'NotoSansKR',
                //           color: Color(0xff000000),
                //           fontSize: 14,
                //           fontWeight: FontWeight.w700,
                //           fontStyle: FontStyle.normal,
                //         ),
                //       ),
                //       InkWell(
                //           onTap: () {
                //             Get.back();
                //           },
                //           child: Icon(LineIcons.times))
                //     ],
                //   ),
                // ),
                // Divider(),
                ListTile(
                  onTap: () {
                    Get.back();
                    Get.to(BeforeAfterDetailPage(),
                        transition: Transition.native);
                  },
                  title: Row(
                    children: [
                      Icon(LineIcons.eraser, size: 24),
                      SizedBox(width: spacing_xl),
                      Text('수정',
                          style: TextStyle(
                            fontFamily: 'NotoSansKR',
                            color: Color(0xff000000),
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                          )),
                    ],
                  ),
                ),
                ListTile(
                  onTap: () async {
                    Get.back();
                    await showAnimatedDialog(
                      animationType: DialogTransitionType.none,
                      context: context,
                      barrierDismissible: true,
                      builder: (BuildContext context) {
                        return PlinicDialogTwoButton(
                          button1Text: '아니요',
                          button2Text: '삭제하기',
                          title: '알림',
                          content: '등록하신 게시물을\n삭제 하시겠습니까?',
                          button1Click: () {
                            Get.back();
                          },
                          button2Click: () {
                            Get.back();
                          },
                        );
                      },
                    );
                  },
                  title: Row(
                    children: [
                      Icon(LineIcons.cut, size: 24),
                      SizedBox(width: spacing_xl),
                      Text('삭제',
                          style: TextStyle(
                            fontFamily: 'NotoSansKR',
                            color: Color(0xff000000),
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                          )),
                    ],
                  ),
                ),
                ListTile(
                  onTap: () {
                    Get.back();
                  },
                  title: Row(
                    children: [
                      Icon(LineIcons.undo, size: 24),
                      SizedBox(width: spacing_xl),
                      Text('취소',
                          style: TextStyle(
                            fontFamily: 'NotoSansKR',
                            color: Color(0xff000000),
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                          )),
                    ],
                  ),
                ),
              ],
            ),
          )),
      isDismissible: true,
    );
  }

  void showActionSheet_Filter(BuildContext context) {
    Get.bottomSheet(
      Container(
          height: 253,
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: spacing_xxs),
            child: Column(
              children: [
                // ListTile(
                //   title: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       Text(
                //         '카테고리 선택',
                //         style: TextStyle(
                //           fontFamily: 'NotoSansKR',
                //           color: Color(0xff000000),
                //           fontSize: 14,
                //           fontWeight: FontWeight.w700,
                //           fontStyle: FontStyle.normal,
                //         ),
                //       ),
                //       InkWell(
                //           onTap: () {
                //             Get.back();
                //           },
                //           child: Icon(LineIcons.times))
                //     ],
                //   ),
                // ),
                // Divider(),
                ListTile(
                  onTap: () {
                    Get.back();
                    Get.to(BeforeAfterDetailPage(),
                        transition: Transition.native);
                  },
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('필터설정',
                          style: TextStyle(
                            fontFamily: 'NotoSansKR',
                            color: black,
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            fontStyle: FontStyle.normal,
                          )),
                      InkWell(
                          onTap: () {
                            Get.back();
                          },
                          child: Icon(LineIcons.times))
                    ],
                  ),
                ),
                Divider(),
                ListTile(
                  onTap: () {
                    Get.back();
                    Get.to(BeforeAfterDetailPage(),
                        transition: Transition.native);
                  },
                  title: Row(
                    children: [
                      Text('기준',
                          style: TextStyle(
                            fontFamily: 'NotoSansKR',
                            color: grey_1,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                          ))
                    ],
                  ),
                  subtitle: Column(
                    children: [
                      SizedBox(height: spacing_xxs),
                      Row(
                        children: [
                          ElevatedButton(
                            style: ButtonStyle(
                                elevation: MaterialStateProperty.all(0.0),
                                backgroundColor:
                                    MaterialStateProperty.all(primary)),
                            onPressed: () {},
                            child: Text(
                              '전체 게시물',
                              style: TextStyle(
                                fontFamily: 'NotoSansKR',
                                color: white,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                              ),
                            ),
                          ),
                          SizedBox(width: spacing_xs),
                          ElevatedButton(
                            style: ButtonStyle(
                              elevation: MaterialStateProperty.all(0.0),
                              backgroundColor:
                                  MaterialStateProperty.resolveWith<Color>(
                                      (Set<MaterialState> states) {
                                if (states.contains(MaterialState.pressed)) {
                                  return Colors.grey.shade200;
                                }
                                return Colors.white;
                              }),
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    side: BorderSide(color: grey_2),
                                    borderRadius: BorderRadius.circular(4)),
                              ),
                            ),
                            onPressed: () {},
                            child: Text(
                              '같은 피부타입',
                              style: TextStyle(
                                fontFamily: 'NotoSansKR',
                                color: grey_2,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                              ),
                            ),
                          ),
                          SizedBox(width: spacing_xs),
                          ElevatedButton(
                            style: ButtonStyle(
                              elevation: MaterialStateProperty.all(0.0),
                              backgroundColor:
                                  MaterialStateProperty.resolveWith<Color>(
                                      (Set<MaterialState> states) {
                                if (states.contains(MaterialState.pressed)) {
                                  return Colors.grey.shade200;
                                }
                                return Colors.white;
                              }),
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      side: BorderSide(color: grey_2),
                                      borderRadius: BorderRadius.circular(4))),
                            ),
                            onPressed: () {},
                            child: Text(
                              '다른 피부타입',
                              style: TextStyle(
                                fontFamily: 'NotoSansKR',
                                color: grey_2,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                ListTile(
                  onTap: () {
                    Get.back();
                    Get.to(BeforeAfterDetailPage(),
                        transition: Transition.native);
                  },
                  subtitle: Column(
                    children: [
                      SizedBox(height: spacing_m),
                      Row(
                        children: [
                          ElevatedButton(
                            style: ButtonStyle(
                                elevation: MaterialStateProperty.all(0.0),
                                backgroundColor:
                                    MaterialStateProperty.all(primary)),
                            onPressed: () {},
                            child: Text(
                              '최신순',
                              style: TextStyle(
                                fontFamily: 'NotoSansKR',
                                color: white,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                              ),
                            ),
                          ),
                          SizedBox(width: spacing_xs),
                          ElevatedButton(
                            style: ButtonStyle(
                              elevation: MaterialStateProperty.all(0.0),
                              backgroundColor:
                                  MaterialStateProperty.resolveWith<Color>(
                                      (Set<MaterialState> states) {
                                if (states.contains(MaterialState.pressed)) {
                                  return Colors.grey.shade200;
                                }
                                return Colors.white;
                              }),
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    side: BorderSide(color: grey_2),
                                    borderRadius: BorderRadius.circular(4)),
                              ),
                            ),
                            onPressed: () {},
                            child: Text(
                              '인기순',
                              style: TextStyle(
                                fontFamily: 'NotoSansKR',
                                color: grey_2,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                              ),
                            ),
                          ),
                          SizedBox(width: spacing_xs),
                          ElevatedButton(
                            style: ButtonStyle(
                              elevation: MaterialStateProperty.all(0.0),
                              backgroundColor:
                                  MaterialStateProperty.resolveWith<Color>(
                                      (Set<MaterialState> states) {
                                if (states.contains(MaterialState.pressed)) {
                                  return Colors.grey.shade200;
                                }
                                return Colors.white;
                              }),
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      side: BorderSide(color: grey_2),
                                      borderRadius: BorderRadius.circular(4))),
                            ),
                            onPressed: () {},
                            child: Text(
                              '과거순',
                              style: TextStyle(
                                fontFamily: 'NotoSansKR',
                                color: grey_2,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )),
      isDismissible: true,
    );
  }
}
