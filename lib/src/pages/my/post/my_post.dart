import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:get/get.dart';
import 'package:plinic2/constants.dart';
import 'package:plinic2/src/component/appbar_title.dart';
import 'package:plinic2/src/pages/my/post/my_post_detail.dart';
import 'package:plinic2/src/pages/my/post/my_post_detail_blind.dart';
import 'package:readmore/readmore.dart';

class MyPostPage extends StatelessWidget {
  const MyPostPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: AppbarTitle(title: '게시물관리'),
          backgroundColor: Colors.white,
          elevation: 0.3,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Get.back();
            },
            color: Colors.black,
          )),
      backgroundColor: bgColor,
      body: SingleChildScrollView(
          child: Column(
        children: [
          SizedBox(height: spacing_xl),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
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
                  Text(
                    '122',
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
          SizedBox(height: 36),
          bodyImage(),
          bodyOnlyText(),
          Stack(
            fit: StackFit.loose,
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              bodyOnlyText(),
              GestureDetector(
                onTap: () {
                  Get.to(() => MyPostDetailBlindPage());
                },
                child: Container(
                  color: Colors.black.withOpacity(0.8),
                  width: Get.mediaQuery.size.width,
                  height: Get.mediaQuery.size.height * 0.35,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '관리자에 의하여 블라인드 처리 되었습니다.\n사유를 확인하시려면 눌러주세요.',
                        style: TextStyle(
                          fontFamily: 'NotoSansKR',
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      )),
    );
  }

  Widget bodyImage() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: spacing_xl, right: spacing_xs),
          child: Container(
            color: Colors.transparent,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {},
                  splashColor: grey_1,
                  child: Text(
                    '비포 & 애프터',
                    style: TextStyle(
                      fontFamily: 'NotoSansKR',
                      color: primary,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                ),
                InkWell(
                  splashColor: grey_2,
                  onTap: () {
                    print('클릭');
                  },
                  child: Icon(Icons.more_vert),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: spacing_xs),
        imageSlideshow(),
        SizedBox(height: spacing_xl),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: InkWell(
            splashColor: grey_2,
            onTap: () {
              Get.to(() => MyPostDetailPage());
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
        SizedBox(height: spacing_xxs),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
          child: InkWell(
            splashColor: grey_2,
            onTap: () {
              Get.to(() => MyPostDetailPage());
            },
            child: Container(
              color: Colors.transparent,
              child: ReadMoreText(
                '플리닉에서 받은 구독박스로 피부 관리 하고 있는데 정말피부가 좋아졌어요 ㅋㅋㅋㅋ\n피부가 좋아 지니까 자신감이 올라가서 빨리 마플리닉에서 받은 구독박스로 피부 관리 하고 있는데 정말피부가 좋아졌어요 ㅋㅋㅋㅋ 피부가 좋아 지니까 자신감이 올라가서 빨리 마플리닉에서 받은 구독박스로 피부 관리 하고 있는데 정말피부가 좋아졌어요 ㅋㅋㅋㅋ 피부가 좋아 지니까 자신감이 올라가서 빨리 마플리닉에서 받은 구독박스로 피부 관리 하고 있는데 정말피부가 좋아졌어요 ㅋㅋㅋㅋ 피부가 좋아 지니까 자신감이 올라가서 빨리 마 플리닉에서플리닉에서플리닉에서플리닉에서',
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
                  color: Color(0xff000000),
                  fontSize: 14,
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
        SizedBox(height: spacing_xxs),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
          child: Row(
            children: [
              Text(
                '2021.07.21',
                style: TextStyle(
                  fontFamily: 'NotoSansKR',
                  color: grey_2,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: spacing_m),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22),
          child: InkWell(
            splashColor: grey_2,
            onTap: () {
              Get.to(() => MyPostDetailPage());
            },
            child: Container(
              color: Colors.transparent,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.mood, size: 24),
                  Text(
                    '1,521',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      color: black,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                  SizedBox(width: spacing_m),
                  Icon(Icons.chat_bubble_outline, size: 20),
                  Text(
                    '3,274',
                    style: TextStyle(
                      fontFamily: 'Roboto',
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
        ),
        SizedBox(height: 18),
        Divider(color: grey_3),
        // SizedBox(height: 26),
      ],
    );
  }

  Widget bodyOnlyText() {
    return Column(
      children: [
        SizedBox(height: spacing_xl),
        Padding(
          padding: const EdgeInsets.only(left: spacing_xl, right: spacing_xs),
          child: Container(
            color: Colors.transparent,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Expanded(
                //   child: Text(
                //     '2021.07.21',
                //     style: TextStyle(
                //       fontFamily: 'NotoSansKR',
                //       color: grey_1,
                //       fontSize: 14,
                //       fontWeight: FontWeight.w400,
                //       fontStyle: FontStyle.normal,
                //     ),
                //   ),
                // ),
                InkWell(
                  onTap: () {},
                  splashColor: grey_1,
                  child: Text(
                    '일상',
                    style: TextStyle(
                      fontFamily: 'NotoSansKR',
                      color: primary,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                ),
                InkWell(
                  splashColor: grey_2,
                  onTap: () {},
                  child: Icon(Icons.more_vert),
                ),
              ],
            ),
          ),
        ),
        // imageSlideshow(),
        SizedBox(height: spacing_xs),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: InkWell(
            splashColor: grey_2,
            onTap: () {
              Get.to(() => MyPostDetailPage());
            },
            child: Container(
              color: Colors.transparent,
              child: Row(
                children: [
                  Text(
                    '오늘 화장품으로 월급탕진...!',
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
        SizedBox(height: spacing_xxs),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
          child: InkWell(
            splashColor: grey_2,
            onTap: () {
              Get.to(() => MyPostDetailPage());
            },
            child: Container(
              color: Colors.transparent,
              child: ReadMoreText(
                '오늘 월급들어오자마자 필요했던 화장품 다 결제했어욯ㅎ\n플리닉에서도 몇개 구매하고 다른 곳에서도 구매하고\n한순간에 텅장됐어요~~ ㅎㅎ 힘든 피부관리란\n오늘 월급들어오자마자 필요했던 화장품 다 결제했어욯ㅎ\n플리닉에서도 몇개 구매하고 다른 곳에서도 구매하고\n한순간에 텅장됐어요~~ ㅎㅎ 힘든 피부관리란\n오늘 월급들어오자마자 필요했던 화장품 다 결제했어욯ㅎ\n플리닉에서도 몇개 구매하고 다른 곳에서도 구매하고\n한순간에 텅장됐어요~~ ㅎㅎ 힘든 피부관리란\n오늘 월급들어오자마자 필요했던 화장품 다 결제했어욯ㅎ\n플리닉에서도 몇개 구매하고 다른 곳에서도 구매하고\n한순간에 텅장됐어요~~ ㅎㅎ 힘든 피부관리란',
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
                  color: Color(0xff000000),
                  fontSize: 14,
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
        SizedBox(height: spacing_xxs,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
          child: Row(
            children: [
              Text(
                '2021.07.21',
                style: TextStyle(
                  fontFamily: 'NotoSansKR',
                  color: grey_2,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
          child: InkWell(
            splashColor: grey_2,
            onTap: () {
              Get.to(() => MyPostDetailPage());
            },
            child: Container(
              color: Colors.transparent,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.mood, size: 24),
                  Text(
                    '1,521',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      color: black,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                  SizedBox(width: spacing_m),
                  Icon(Icons.chat_bubble_outline, size: 20),
                  Text(
                    '3,274',
                    style: TextStyle(
                      fontFamily: 'Roboto',
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
        ),
        SizedBox(height: 18),
        Divider(color: grey_3),
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
}
