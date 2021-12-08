import 'package:cached_network_image/cached_network_image.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';
import 'package:plinic2/constants.dart';
import 'package:plinic2/src/controller/display/community_main_controller.dart';
import 'package:plinic2/src/model/display/magazine_model.dart';
import 'package:plinic2/src/pages/alarm/alarm.dart';
import 'package:plinic2/src/pages/challenge/before_after.dart';
import 'package:plinic2/src/pages/challenge/before_after_create.dart';
import 'package:plinic2/src/pages/challenge/before_after_detail.dart';
import 'package:plinic2/src/pages/challenge/magazine_detail.dart';
import 'package:plinic2/src/pages/challenge/magazine_main.dart';
import 'package:plinic2/src/pages/my/my_test.dart';
import 'package:plinic2/src/pages/plinic_fab.dart';
import 'package:shimmer/shimmer.dart';

class CommunityPage extends StatelessWidget {
  const CommunityPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: SafeArea(
        top: false,
        child: GetX<CommunityMainController>(
          init: Get.put<CommunityMainController>(CommunityMainController()),
          builder: (CommunityMainController communityMainController) {
            if (communityMainController.mainMagazine.value.code != null) {
              // return mainLoading();
              return buildMainCommunity(
                  communityMainController.mainMagazine.value);
            }
            return mainLoading();
          },
        ),
      ),
      floatingActionButton: PlinicFaB(),
    );
  }

  Widget buildMainCommunity(MagazineModel values) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          backgroundColor: Colors.transparent,
          floating: false,
          elevation: 0.0,
          pinned: false,
          primary: true,
          expandedHeight: 470,
          flexibleSpace: FlexibleSpaceBar(
            background: GestureDetector(
              onTap: () {
                Get.to(MagazineDetailPage(),
                    arguments: {'values': values, 'mode': 'main'});
              },
              child: Hero(
                tag: '1',
                child: Stack(
                  fit: StackFit.expand,
                  alignment: Alignment.bottomLeft,
                  children: [
                    CachedNetworkImage(
                      imageUrl: values.sliver_image.toString(),
                      placeholder: (_, url) => Shimmer.fromColors(
                        direction: ShimmerDirection.ltr,
                        period: Duration(seconds: 2),
                        baseColor: grey_3,
                        highlightColor: Colors.grey.shade300,
                        child: Container(
                          width: Get.mediaQuery.size.width,
                          height: 520,
                          color: grey_2,
                        ),
                      ),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                      width: Get.mediaQuery.size.width,
                      // height: 82,
                      fit: BoxFit.fitWidth,
                    ),
                    Positioned(
                      left: spacing_l,
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(5),
                                topRight: Radius.circular(5))),
                        width: 112,
                        height: 28,
                        child: Text(
                          '플리닉 매거진',
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            color: white,
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          leadingWidth: 150,
          leading: TextButton(
            onPressed: () {},
            child: Text(
              '커뮤니티',
              style: TextStyle(
                fontFamily: 'NotoSansKR',
                color: black,
                fontSize: 20,
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.normal,
              ),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: spacing_m),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                      onTap: () {
                        Get.to(AlarmPage(), transition: Transition.native);
                      },
                      child: Icon(LineIcons.bell, size: 28, color: black)),
                  SizedBox(width: 16),
                  InkWell(
                    onTap: () {
                      Get.to(MyTestPage(), transition: Transition.native);
                    },
                    child:
                        Icon(LineIcons.userCircleAlt, size: 28, color: black),
                  ),
                ],
              ),
            )
          ],
        ),
        SliverList(
          delegate: SliverChildListDelegate([
            buildSliveList(values),
            buildBeforeAfter(),
            SizedBox(height: 40),
            Divider(color: grey_3, thickness: 8),
            buildBeautyDiary(),
            SizedBox(height: 40),
            Divider(color: grey_3, thickness: 8),
            buildDaily(),
            SizedBox(height: 47),
          ]),
        ),
      ],
    );
  }

  Widget buildSliveList(MagazineModel values) {
    return Column(
      children: [
        InkWell(
            splashColor: grey_1,
            onTap: () {
              Get.to(MagazineDetailPage(),
                  arguments: {'values': values, 'mode': 'main'});
            },
            child: buildContent(values)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                  splashColor: primary_light,
                  onTap: () {
                    print('Heart');
                  },
                  child: Icon(LineIcons.heart)),
              SizedBox(width: spacing_xs),
              Text('152명이 좋아했어요',
                  style: TextStyle(
                    fontFamily: 'NotoSansKR',
                    color: black,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                  ))
            ],
          ),
        ),
        // SizedBox(height: spacing_xxl),
        Divider(height: spacing_xxl2),
        InkWell(
          onTap: () {
            Get.to(MagazineMainPage());
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ExtendedImage.asset('assets/images/magazine-app-icons.png'),
                SizedBox(width: spacing_m),
                Expanded(
                  child: Text(
                    'M A G A Z I N E ',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      color: black,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                ),
                Text(
                  '+ 목록보기',
                  style: TextStyle(
                    fontFamily: 'NotoSansKR',
                    color: black,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                  ),
                ),
              ],
            ),
          ),
        ),
        Divider(height: spacing_xxl2),
      ],
    );
  }

  Widget buildContent(MagazineModel values) {
    return Column(
      children: [
        SizedBox(height: spacing_l),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
          child: Row(
            children: [
              Text(
                values.title.toString(),
                style: TextStyle(
                  fontFamily: 'NotoSansKR',
                  color: black,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.normal,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: spacing_s),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
          child: Text(
            values.sub_title.toString(),
            style: TextStyle(
              fontFamily: 'NotoSansKR',
              color: black,
              fontSize: 14,
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.normal,
            ),
          ),
        ),
        SizedBox(height: spacing_s),
      ],
    );
  }

  Widget buildBeforeAfter() {
    return Column(
      children: [
        SizedBox(height: 46),
        InkWell(
          onTap: () {
            Get.to(BeforeAfterPage(), transition: Transition.native);
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '비포&애프터',
                  style: TextStyle(
                    fontFamily: 'NotoSansKR',
                    color: black,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal,
                  ),
                ),
                Icon(
                  LineIcons.angleRight,
                  size: 20,
                )
              ],
            ),
          ),
        ),
        SizedBox(height: spacing_xl),
        buildInkBfAfBody('assets/images/feed-post-1.png', '피부가 정말 좋아졌어요',
            '플리닉에서 받은 구독박스로 피부 관리 하고 있는데 정말피부가 좋아졌어요 짱이예요!'),
        SizedBox(height: spacing_xl),
        buildInkBfAfBody('assets/images/feed-post-2.png', '피부가 정말 좋아졌어요',
            '플리닉에서 받은 구독박스로 피부 관리 하고 있는데 정말피부가 좋아졌어요 짱이예요!')
      ],
    );
  }

  Widget buildInkBfAfBody(imgUrl, title, content) {
    return InkWell(
      onTap: () {
        Get.to(BeforeAfterDetailPage(), transition: Transition.native);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
        child: Row(
          children: [
            ExtendedImage.asset(
              imgUrl,
              fit: BoxFit.fill,
              width: 100,
              height: 100,
            ),
            SizedBox(width: spacing_s),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontFamily: 'NotoSansKR',
                    color: black,
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal,
                  ),
                ),
                SizedBox(height: spacing_xxs),
                Container(
                  width: Get.mediaQuery.size.width * 0.55,
                  height: 48,
                  child: Text(
                    content,
                    style: TextStyle(
                      color: black,
                      fontFamily: 'NotoSansKR',
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    textAlign: TextAlign.left,
                  ),
                ),
                Container(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () {
                          print('heart');
                        },
                        child: Icon(
                          LineIcons.heart,
                          size: 17,
                          color: black,
                        ),
                      ),
                      SizedBox(width: spacing_xxs),
                      Text(
                        '98명이 좋아했어요',
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
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget buildBeautyDiary() {
    return Column(
      children: [
        SizedBox(height: 46),
        InkWell(
          onTap: () {
            print('aa');
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '뷰티다이어리',
                  style: TextStyle(
                    fontFamily: 'NotoSansKR',
                    color: black,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal,
                  ),
                ),
                Icon(
                  LineIcons.angleRight,
                  size: 20,
                )
              ],
            ),
          ),
        ),
        SizedBox(height: spacing_xl),
        buildInkbeautyDiaryBody('assets/images/feed-post-1.png', '피부가 정말 좋아졌어요',
            '플리닉에서 받은 구독박스로 피부 관리 하고 있는데 정말피부가 좋아졌어요 짱이예요!'),
        SizedBox(height: spacing_xl),
        buildInkbeautyDiaryBody('assets/images/feed-post-2.png', '피부가 정말 좋아졌어요',
            '플리닉에서 받은 구독박스로 피부 관리 하고 있는데 정말피부가 좋아졌어요 짱이예요!')
      ],
    );
  }

  Widget buildInkbeautyDiaryBody(imgUrl, title, content) {
    return InkWell(
      onTap: () {
        print('before&after');
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
        child: Row(
          children: [
            ExtendedImage.asset(
              imgUrl,
              fit: BoxFit.fill,
              width: 100,
              height: 100,
            ),
            SizedBox(width: spacing_s),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontFamily: 'NotoSansKR',
                    color: black,
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal,
                  ),
                ),
                SizedBox(height: spacing_xxs),
                Container(
                  width: Get.mediaQuery.size.width * 0.55,
                  height: 48,
                  child: Text(
                    content,
                    style: TextStyle(
                      color: black,
                      fontFamily: 'NotoSansKR',
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    textAlign: TextAlign.left,
                  ),
                ),
                Container(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () {
                          print('heart');
                        },
                        child: Icon(
                          LineIcons.heart,
                          size: 17,
                          color: black,
                        ),
                      ),
                      SizedBox(width: spacing_xxs),
                      Text(
                        '98명이 좋아했어요',
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
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget buildDaily() {
    return Column(
      children: [
        SizedBox(height: 46),
        InkWell(
          onTap: () {
            print('aa');
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '일상',
                  style: TextStyle(
                    fontFamily: 'NotoSansKR',
                    color: black,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal,
                  ),
                ),
                Icon(
                  LineIcons.angleRight,
                  size: 20,
                )
              ],
            ),
          ),
        ),
        SizedBox(height: 42),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
          child: Container(
            width: Get.mediaQuery.size.width,
            height: 164,
            decoration: BoxDecoration(color: grey_3),
            child: Column(
              children: [
                SizedBox(height: spacing_m),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Image.asset('assets/images/folder.png')]),
                SizedBox(height: spacing_s),
                Text('‘일상’ 게시판에 등록된 게시물이 없어요.\n지금 게시물을 등록해보세요!',
                    style: TextStyle(
                        fontFamily: 'NotoSansKR',
                        color: grey_1,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal),
                    textAlign: TextAlign.center),
                SizedBox(height: spacing_l),
                InkWell(
                  splashColor: primary_light,
                  onTap: () {
                    Get.to(BeforeAfterCreatePage(),
                        transition: Transition.native);
                  },
                  child: Text('게시글 등록하러 가기',
                      style: TextStyle(
                        fontFamily: 'NotoSansKR',
                        color: primary,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      )),
                )
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget mainLoading() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Shimmer.fromColors(
            direction: ShimmerDirection.ltr,
            period: Duration(seconds: 2),
            baseColor: grey_3,
            highlightColor: Colors.grey.shade300,
            child: Container(
              width: Get.mediaQuery.size.width,
              height: 520,
              color: grey_3,
            ),
          ),
          SizedBox(height: spacing_m),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
            child: Shimmer.fromColors(
              direction: ShimmerDirection.ltr,
              period: Duration(seconds: 2),
              baseColor: grey_3,
              highlightColor: Colors.grey.shade300,
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2), color: grey_3),
                    width: 160,
                    height: 32,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: spacing_xs),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
            child: Shimmer.fromColors(
              direction: ShimmerDirection.ltr,
              period: Duration(seconds: 2),
              baseColor: grey_3,
              highlightColor: Colors.grey.shade300,
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2), color: grey_3),
                    width: 260,
                    height: 32,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: spacing_s),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
            child: Shimmer.fromColors(
              direction: ShimmerDirection.ltr,
              period: Duration(seconds: 2),
              baseColor: grey_3,
              highlightColor: Colors.grey.shade300,
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2), color: grey_3),
                    width: 327,
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: spacing_xxs),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
            child: Shimmer.fromColors(
              direction: ShimmerDirection.ltr,
              period: Duration(seconds: 2),
              baseColor: grey_3,
              highlightColor: Colors.grey.shade300,
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2), color: grey_3),
                    width: 327,
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
            child: Shimmer.fromColors(
              direction: ShimmerDirection.ltr,
              period: Duration(seconds: 2),
              baseColor: grey_3,
              highlightColor: Colors.grey.shade300,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(LineIcons.heart, color: grey_3, size: 17.5),
                  SizedBox(width: 9.2),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2), color: grey_3),
                    width: 100,
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 30),
          Divider(
            color: grey_2,
          ),
          SizedBox(height: spacing_m),
          Shimmer.fromColors(
            direction: ShimmerDirection.ltr,
            period: Duration(seconds: 2),
            baseColor: grey_3,
            highlightColor: Colors.grey.shade300,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50), color: grey_3),
                    width: 44,
                    height: 44,
                  ),
                  SizedBox(width: spacing_m),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2), color: grey_3),
                    width: 158,
                    height: 20,
                  ),
                  Expanded(child: SizedBox()),
                  Text(
                    '+ 목록보기',
                    style: TextStyle(
                      fontFamily: 'NotoSansKR',
                      color: black,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: spacing_m),
          Divider(
            color: grey_2,
          ),
          SizedBox(height: 48),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
            child: Shimmer.fromColors(
              direction: ShimmerDirection.ltr,
              period: Duration(seconds: 2),
              baseColor: grey_3,
              highlightColor: Colors.grey.shade300,
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2), color: grey_3),
                    width: 92,
                    height: 20,
                  ),
                  Icon(LineIcons.angleRight)
                ],
              ),
            ),
          ),
          SizedBox(height: spacing_xl),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
            child: Shimmer.fromColors(
              direction: ShimmerDirection.ltr,
              period: Duration(seconds: 2),
              baseColor: grey_3,
              highlightColor: Colors.grey.shade300,
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2), color: grey_3),
                    width: 100,
                    height: 100,
                  ),
                  SizedBox(width: spacing_s),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2),
                            color: grey_3),
                        width: 164,
                        height: 20,
                      ),
                      SizedBox(height: spacing_xs),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2),
                            color: grey_3),
                        width: Get.mediaQuery.size.width * 0.587,
                        height: 44,
                      ),
                      SizedBox(height: spacing_xs),
                      Row(
                        children: [
                          Icon(LineIcons.heart),
                          SizedBox(width: spacing_xxs),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(2),
                                color: grey_3),
                            width: 114,
                            height: 20,
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: spacing_xl),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
            child: Shimmer.fromColors(
              direction: ShimmerDirection.ltr,
              period: Duration(seconds: 2),
              baseColor: grey_3,
              highlightColor: Colors.grey.shade300,
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2), color: grey_3),
                    width: 100,
                    height: 100,
                  ),
                  SizedBox(width: spacing_s),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2),
                            color: grey_3),
                        width: 164,
                        height: 20,
                      ),
                      SizedBox(height: spacing_xs),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2),
                            color: grey_3),
                        width: Get.mediaQuery.size.width * 0.587,
                        height: 44,
                      ),
                      SizedBox(height: spacing_xs),
                      Row(
                        children: [
                          Icon(LineIcons.heart),
                          SizedBox(width: spacing_xxs),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(2),
                                color: grey_3),
                            width: 114,
                            height: 20,
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: 44),
          Divider(color: grey_3, thickness: 15),
          SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
            child: Shimmer.fromColors(
              direction: ShimmerDirection.ltr,
              period: Duration(seconds: 2),
              baseColor: grey_3,
              highlightColor: Colors.grey.shade300,
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2), color: grey_3),
                    width: 92,
                    height: 20,
                  ),
                  Icon(LineIcons.angleRight)
                ],
              ),
            ),
          ),
          SizedBox(height: spacing_xl),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
            child: Shimmer.fromColors(
              direction: ShimmerDirection.ltr,
              period: Duration(seconds: 2),
              baseColor: grey_3,
              highlightColor: Colors.grey.shade300,
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2), color: grey_3),
                    width: 100,
                    height: 100,
                  ),
                  SizedBox(width: spacing_s),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2),
                            color: grey_3),
                        width: 164,
                        height: 20,
                      ),
                      SizedBox(height: spacing_xs),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2),
                            color: grey_3),
                        width: Get.mediaQuery.size.width * 0.587,
                        height: 44,
                      ),
                      SizedBox(height: spacing_xs),
                      Row(
                        children: [
                          Icon(LineIcons.heart),
                          SizedBox(width: spacing_xxs),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(2),
                                color: grey_3),
                            width: 114,
                            height: 20,
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: spacing_xl),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
            child: Shimmer.fromColors(
              direction: ShimmerDirection.ltr,
              period: Duration(seconds: 2),
              baseColor: grey_3,
              highlightColor: Colors.grey.shade300,
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2), color: grey_3),
                    width: 100,
                    height: 100,
                  ),
                  SizedBox(width: spacing_s),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2),
                            color: grey_3),
                        width: 164,
                        height: 20,
                      ),
                      SizedBox(height: spacing_xs),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2),
                            color: grey_3),
                        width: Get.mediaQuery.size.width * 0.587,
                        height: 44,
                      ),
                      SizedBox(height: spacing_xs),
                      Row(
                        children: [
                          Icon(LineIcons.heart),
                          SizedBox(width: spacing_xxs),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(2),
                                color: grey_3),
                            width: 114,
                            height: 20,
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: 44),
          Divider(color: grey_3, thickness: 15),
          SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
            child: Shimmer.fromColors(
              direction: ShimmerDirection.ltr,
              period: Duration(seconds: 2),
              baseColor: grey_3,
              highlightColor: Colors.grey.shade300,
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2), color: grey_3),
                    width: 36,
                    height: 20,
                  ),
                  Icon(LineIcons.angleRight)
                ],
              ),
            ),
          ),
          SizedBox(height: 42),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Shimmer.fromColors(
                  direction: ShimmerDirection.ltr,
                  period: Duration(seconds: 2),
                  baseColor: grey_3,
                  highlightColor: Colors.grey.shade300,
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2), color: grey_3),
                    width: Get.mediaQuery.size.width,
                    height: 164,
                  ),
                ),
                Column(
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(color: grey_3),
                    ),
                    SizedBox(height: spacing_s),
                    Container(
                      height: 20,
                      width: 200,
                      decoration: BoxDecoration(color: grey_3),
                    ),
                    SizedBox(height: spacing_xxs),
                    Container(
                      height: 20,
                      width: 140,
                      decoration: BoxDecoration(color: grey_3),
                    ),
                    SizedBox(height: 9),
                    Container(
                      alignment: Alignment.center,
                      height: 36,
                      width: 137,
                      decoration: BoxDecoration(color: grey_2),
                      child: Text(
                        '게시글 등록 하러 가기',
                        style: TextStyle(
                          fontFamily: 'NotoSansKR',
                          color: white,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
