import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:plinic2/constants.dart';
import 'package:plinic2/src/component/before_after_singo_dialog.dart';
import 'package:plinic2/src/component/custom_appbar.dart';
import 'package:plinic2/src/component/plinic_dialog_two_button.dart';
import 'package:plinic2/src/controller/person_detail_controller.dart';
import 'package:plinic2/src/pages/review/review_edit.dart';
import 'package:readmore/readmore.dart';

class BeforeAfterDetailPage extends StatelessWidget {
  const BeforeAfterDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar('비포&애프터'),
      bottomSheet: Padding(
        padding: const EdgeInsets.only(bottom: 48),
        child: buildInputComment(),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: spacing_xl),
              Padding(
                padding:
                    const EdgeInsets.only(left: spacing_xl, right: spacing_xs),
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
                    // Get.to(() => BeforeAfterDetailPage(),
                    //     transition: Transition.native);
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
                      '플리닉에서 받은 구독박스로 피부 관리 하고 있는데 정말피부가 좋아졌어요 ㅋㅋㅋㅋ 피부가 좋아 지니까 자신감이 올라가서 빨리 마구마구 사용해서 마스크 때문에 올라왔던 트러블들 다 없애고 싶네요! 고마워요 플리닉~~~',
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
                        color: black,
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
              SizedBox(height: spacing_s),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
                child: Row(
                  children: [
                    InkWell(
                        onTap: () {
                          print('heart');
                        },
                        child: Icon(LineIcons.heart)),
                    SizedBox(width: spacing_xxs),
                    Text(
                      '152',
                      style: TextStyle(
                        fontFamily: 'NotoSansKR',
                        color: black,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                    SizedBox(width: spacing_xl),
                    InkWell(
                        onTap: () {
                          print('comment');
                        },
                        child: Icon(LineIcons.comment)),
                    SizedBox(width: spacing_xxs),
                    Text(
                      '32',
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
              SizedBox(height: 22),
              Divider(
                thickness: 15,
                color: grey_3,
              ),
              SizedBox(height: spacing_s),
              Container(
                padding: EdgeInsets.symmetric(horizontal: spacing_xl),
                alignment: Alignment.centerLeft,
                child: Text('댓글',
                    style: TextStyle(
                      fontFamily: 'NotoSansKR',
                      color: Color(0xff000000),
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal,
                    )),
              ),
              Divider(color: grey_2),
              SizedBox(height: spacing_s),
              buildComment(
                  '', '피카츄라이츄', '플리닉이랑 기기랑 같이 사용하면 더 효과좋던���요?', context),
              buildComment('', '깨끗한피부', '저는 벌써 다없어졌어요', context),
              buildComment(
                  '',
                  '쑥대머리',
                  '구독박스 처음에는 반신반의 했는데 저렴한 가격에 잘 이용하게 되는거 같아요! 추천추천 합니당',
                  context),
              buildComment(
                  '',
                  '쑥대머리',
                  '구독박스 처음에는 반신반의 했는데 저렴한 가격에 잘 이용하게 되는거 같아요! 추천추천 합니당 구독박스 처음에는 반신반�� 했는데 저렴한 가격에 잘 이용하게 되는거 같아요! 추천추천 합니당 구독박스 처음에는 반신반의 했는데 저렴한 가격에 잘 이용하게 되는거 같아요! 추���추천 합니당 구독박스 처음에는 ���신반의 했는데 저렴한 가격에 잘 이용하게 되는거 같아요! 추천추천 합니당',
                  context),
              SizedBox(height: 47),
              // buildInputComment(),
              SizedBox(height: 60),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildComment(profileImgUrl, nickname, comment, context) {
    return Padding(
      padding: const EdgeInsets.only(left: spacing_xl, right: spacing_s),
      child: Column(
        children: [
          Container(
            width: Get.mediaQuery.size.width,
            // height: 65,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FlutterLogo(size: 38),
                SizedBox(width: spacing_s),
                Expanded(
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          overflow: TextOverflow.ellipsis,
                          maxLines: 10,
                          text: TextSpan(children: [
                            TextSpan(
                              text: nickname,
                              style: TextStyle(
                                fontFamily: 'NotoSansKR',
                                color: black,
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                fontStyle: FontStyle.normal,
                              ),
                            ),
                            TextSpan(
                              text: '   ',
                              style: TextStyle(
                                fontFamily: 'NotoSansKR',
                                color: black,
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                fontStyle: FontStyle.normal,
                              ),
                            ),
                            TextSpan(
                              text: comment,
                              style: TextStyle(
                                fontFamily: 'NotoSansKR',
                                color: black,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                              ),
                            ),
                          ]),
                        ),
                        Text(
                          '5분 전',
                          style: TextStyle(
                            fontFamily: 'NotoSansKR',
                            color: grey_1,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                    borderRadius: BorderRadius.circular(30),
                    onTap: () {
                      showActionSheet2(context);
                    },
                    child: Icon(LineIcons.verticalEllipsis, size: 20))
              ],
            ),
          ),
          SizedBox(height: 21),
        ],
      ),
    );
  }

  Widget buildInputComment() {
    return Container(
      height: 40,
      padding: EdgeInsets.symmetric(horizontal: spacing_xl),
      child: TextField(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(8),
          prefixIcon: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text('댓글쓰기',
                style: TextStyle(
                  fontFamily: 'NotoSansKR',
                  color: grey_1,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                )),
          ),
          suffixIcon: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              '등록',
              style: TextStyle(
                fontFamily: 'NotoSansKR',
                color: grey_2,
                fontSize: 12,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
              ),
            ),
          ),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: grey_1),
              borderRadius: BorderRadius.circular(20)),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: grey_2),
            borderRadius: BorderRadius.circular(20),
          ),
          // border: OutlineInputBorder(
          //     borderRadius: BorderRadius.circular(20),
          //     borderSide: BorderSide(color: grey_2))
        ),
      ),
    );
  }

  void showActionSheet(BuildContext context) {
    Get.put<PersonDetailController>(PersonDetailController());
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

  void showActionSheet2(BuildContext context) {
    Get.put<PersonDetailController>(PersonDetailController());
    Get.bottomSheet(
      Container(
          height: 120,
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: spacing_xxs),
            child: Column(
              children: [
                ListTile(
                  onTap: () async {
                    Get.back();
                    await showAnimatedDialog(
                      animationType: DialogTransitionType.none,
                      context: context,
                      barrierDismissible: true,
                      builder: (BuildContext context) {
                        return BeforeAfterSingoDialog(
                            // button1Text: '삭제하기',
                            // button2Text: '취소하기',
                            // title: '알림',
                            // content: '작성하신 상품리뷰를\n삭제하시겠습니까?',
                            // button1Click: () {
                            //   Get.back();
                            //   Get.back();
                            // },
                            // button2Click: () {
                            //   Get.back();
                            // },
                            );
                      },
                    );
                  },
                  title: Row(
                    children: [
                      Icon(LineIcons.commentSlash, size: 24),
                      SizedBox(width: spacing_xl),
                      Text('신고',
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
                    // print(Get.find<PersonDetailController>()
                    //     .personDetail['id']
                    //     .toString());
                    // Get.to(
                    //     () => ReviewEditPage(
                    //         id: Get.find<PersonDetailController>()
                    //             .personDetail['id']
                    //             .toString()),
                    //     transition: Transition.fadeIn);
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
                // ListTile(
                //   onTap: () async {
                //     Get.back();
                //     await showAnimatedDialog(
                //       animationType: DialogTransitionType.none,
                //       context: context,
                //       barrierDismissible: true,
                //       builder: (BuildContext context) {
                //         return PlinicDialogTwoButton(
                //           button1Text: '삭제하기',
                //           button2Text: '취소하기',
                //           title: '알림',
                //           content: '작성하신 상품리뷰를\n삭제하시겠습니까?',
                //           button1Click: () {
                //             Get.back();
                //             Get.back();
                //           },
                //           button2Click: () {
                //             Get.back();
                //           },
                //         );
                //       },
                //     );
                //   },
                //   title: Row(
                //     children: [
                //       Icon(LineIcons.undo, size: 24),
                //       SizedBox(width: spacing_xl),
                //       Text('취소',
                //           style: TextStyle(
                //             fontFamily: 'NotoSansKR',
                //             color: Color(0xff000000),
                //             fontSize: 14,
                //             fontWeight: FontWeight.w400,
                //             fontStyle: FontStyle.normal,
                //           )),
                //     ],
                //   ),
                // ),
                // ListTile(
                //   onTap: () {
                //     print('취소');
                //     Get.back();
                //   },
                //   title: Row(
                //     children: [
                //       Icon(LineIcons.archive, size: 24),
                //       SizedBox(width: spacing_xl),
                //       Text('기타',
                //           style: TextStyle(
                //             fontFamily: 'NotoSansKR',
                //             color: Color(0xff000000),
                //             fontSize: 14,
                //             fontWeight: FontWeight.w400,
                //             fontStyle: FontStyle.normal,
                //           )),
                //     ],
                //   ),
                // ),
              ],
            ),
          )),
      // barrierColor: Colors.red[50],
      isDismissible: true,
    );
  }
}
