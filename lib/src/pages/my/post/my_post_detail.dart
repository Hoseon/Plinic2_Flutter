import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:get/get.dart';
import 'package:plinic2/constants.dart';
import 'package:plinic2/src/component/appbar_title.dart';
import 'package:readmore/readmore.dart';

class MyPostDetailPage extends StatelessWidget {
  final bool isBlind = false;
  const MyPostDetailPage({Key? key, isBlind}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: AppbarTitle(title: '게시물상세'),
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
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
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
            bodyImage(),
            // bodyOnlyText(),
          ],
        )),
      ),
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
                Expanded(
                  child: Text(
                    '2021.07.21',
                    style: TextStyle(
                      fontFamily: 'NotoSansKR',
                      color: grey_1,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  splashColor: grey_1,
                  child: Text(
                    '비포 & 애프터',
                    style: TextStyle(
                      fontFamily: 'NotoSansKR',
                      color: primary,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
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
        imageSlideshow(),
        SizedBox(height: spacing_xl),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: InkWell(
            splashColor: grey_2,
            onTap: () {},
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
            onTap: () {},
            child: Container(
              color: Colors.transparent,
              child: ReadMoreText(
                '플리닉에서 받은 구독박스로 피부 관리 하고 있는데 정말피부가 좋아졌어요 ㅋㅋㅋㅋ\n피부가 좋아 지니까 자신감이 올라가서 빨리 마플리닉에서 받은 구독박스로 피부 관리 하고 있는데 정말피부가 좋아졌어요 ㅋㅋㅋㅋ 피부가 좋아 지니까 자신감이 올라가서 빨리 마플리닉에서 받은 구독박스로 피부 관리 하고 있는데 정말피부가 좋아졌어요 ㅋㅋㅋㅋ 피부가 좋아 지니까 자신감이 올라가서 빨리 마플리닉에서 받은 구독박스로 피부 관리 하고 있는데 정말피부가 좋아졌어요 ㅋㅋㅋㅋ 피부가 좋아 지니까 자신감이 올라가서 빨리 마 플리닉에서플리닉에서플리닉에서플리닉에서',
                trimLines: 3,
                colorClickableText: primary_light,
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
                  color: primary_light,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22),
          child: InkWell(
            splashColor: grey_2,
            onTap: () {},
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
        SizedBox(height: spacing_xl),
        comment_row('이미나', '정말 안좋은 피부인것 같아요 ㅋㅋ'),
        SizedBox(height: spacing_m),
        comment_row('오나리', '피부 정말 더러워요~~'),
        SizedBox(height: 19),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
          child: Row(
            children: [
              inputComment(),
              Expanded(child: SizedBox(width: 26)),
              Text(
                '등록',
                style: TextStyle(
                  fontFamily: 'NotoSansKR',
                  color: primary,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                ),
              )
            ],
          ),
        ),
        SizedBox(height: spacing_xxl2)
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
                Expanded(
                  child: Text(
                    '2021.07.21',
                    style: TextStyle(
                      fontFamily: 'NotoSansKR',
                      color: grey_1,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  splashColor: grey_1,
                  child: Text(
                    '일상',
                    style: TextStyle(
                      fontFamily: 'NotoSansKR',
                      color: primary,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
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
        // imageSlideshow(),
        SizedBox(height: spacing_xl),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: InkWell(
            splashColor: grey_2,
            onTap: () {},
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
            onTap: () {},
            child: Container(
              color: Colors.transparent,
              child: ReadMoreText(
                '오늘 월급들어오자마자 필요했던 화장품 다 결제했어욯ㅎ\n플리닉에서도 몇개 구매하고 다른 곳에서도 구매하고\n한순간에 텅장됐어요~~ ㅎㅎ 힘든 피부관리란\n오늘 월급들어오자마자 필요했던 화장품 다 결제했어욯ㅎ\n플리닉에서도 몇개 구매하고 다른 곳에서도 구매하고\n한순간에 텅장됐어요~~ ㅎㅎ 힘든 피부관리란\n오늘 월급들어오자마자 필요했던 화장품 다 결제했어욯ㅎ\n플리닉에서도 몇개 구매하고 다른 곳에서도 구매하고\n한순간에 텅장됐어요~~ ㅎㅎ 힘든 피부관리란\n오늘 월급들어오자마자 필요했던 화장품 다 결제했어욯ㅎ\n플리닉에서도 몇개 구매하고 다른 곳에서도 구매하고\n한순간에 텅장됐어요~~ ㅎㅎ 힘든 피부관리란',
                trimLines: 3,
                colorClickableText: primary_light,
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
                  color: primary_light,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
          child: InkWell(
            splashColor: grey_2,
            onTap: () {},
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

  Widget comment_row(name, comment) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 23),
          child: Container(
            color: Colors.transparent,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 24,
                  height: 24,
                  decoration:
                      BoxDecoration(color: Colors.grey, shape: BoxShape.circle),
                ),
                SizedBox(width: spacing_xxs),
                Text(
                  name,
                  style: TextStyle(
                    fontFamily: 'NotoSansKR',
                    color: Color(0xff000000),
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal,
                  ),
                )
              ],
            ),
          ),
        ),
        SizedBox(height: spacing_xxs),
        Padding(
          padding: const EdgeInsets.only(left: 52, right: spacing_xl),
          child: Container(
            color: Colors.transparent,
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    comment,
                    style: TextStyle(
                      fontFamily: 'NotoSansKR',
                      color: Color(0xff000000),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                ),
                SizedBox(width: 23),
                Text(
                  '5분전',
                  style: TextStyle(
                    fontFamily: 'NotoSansKR',
                    color: Color(0xff000000),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget inputComment() {
    return Container(
      width: Get.mediaQuery.size.width * 0.7,
      color: Colors.transparent,
      child: TextField(
        style: TextStyle(
          fontFamily: 'NotoSansKR',
          color: Colors.black,
          fontSize: 14,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
        ),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: grey_1, width: 1),
          ),
          hintText: '댓글을 입력해주세요',
          hintStyle: TextStyle(
            fontFamily: 'NotoSansKR',
            color: black,
            fontSize: 14,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
          counterStyle: TextStyle(color: grey_1),
          border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black, width: 1)),
          focusColor: Colors.red,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 2),
          ),
        ),
      ),
    );
  }
}
