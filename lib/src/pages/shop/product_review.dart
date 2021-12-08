import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:plinic2/constants.dart';
import 'package:plinic2/src/component/before_after_singo_dialog.dart';

class ProductReviewPage extends StatelessWidget {
  const ProductReviewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('상품리뷰',
            style: TextStyle(
              fontFamily: 'NotoSansKR',
              color: black,
              fontSize: 16,
              fontWeight: FontWeight.w700,
              fontStyle: FontStyle.normal,
            )),
        backgroundColor: white,
        elevation: 0.3,
        leading: IconButton(
          icon: Icon(LineIcons.arrowLeft, color: black),
          onPressed: () {
            Get.back();
          },
        ),
        actions: [
          IconButton(
            icon: Icon(LineIcons.bomb, color: black),
            onPressed: () async {
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
          )
        ],
      ),
      backgroundColor: white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: spacing_l),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
              child: Row(
                children: [
                  Image.asset(
                    'assets/images/care/ranking-1.png',
                    width: Get.mediaQuery.size.width * 0.101,
                    fit: BoxFit.fitWidth,
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
                  RatingBar(
                    initialRating: 5,
                    itemSize: 16,
                    minRating: 0,
                    maxRating: 5,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    ratingWidget: RatingWidget(
                      full: Icon(
                        Icons.star,
                        color: black,
                      ),
                      half: Icon(
                        Icons.star_half,
                        color: primaryColor,
                      ),
                      empty: Icon(
                        Icons.star_border,
                        color: primaryColor,
                      ),
                    ),
                    onRatingUpdate: (rating) {},
                  ),
                ],
              ),
            ),
            SizedBox(height: 21),
            Padding(
              padding: const EdgeInsets.only(left: spacing_xl),
              child: Row(
                children: [
                  Image.asset(
                    'assets/images/shop/review-writing-1.png',
                    width: Get.mediaQuery.size.width * 0.219,
                    fit: BoxFit.fitWidth,
                  ),
                  SizedBox(width: spacing_xxs),
                  Image.asset(
                    'assets/images/shop/review-writing-2.png',
                    width: Get.mediaQuery.size.width * 0.219,
                    fit: BoxFit.fitWidth,
                  ),
                  SizedBox(width: spacing_xxs),
                  Image.asset(
                    'assets/images/shop/review-writing-3.png',
                    width: Get.mediaQuery.size.width * 0.219,
                    fit: BoxFit.fitWidth,
                  ),
                  SizedBox(width: spacing_xxs),
                  Image.asset(
                    'assets/images/shop/review-writing-4.png',
                    width: Get.mediaQuery.size.width * 0.219,
                    fit: BoxFit.fitWidth,
                  ),
                  SizedBox(width: spacing_xxs),
                ],
              ),
            ),
            SizedBox(height: spacing_l),
            Container(
              padding: EdgeInsets.symmetric(horizontal: spacing_xl),
              child: Text(
                  '아비브 어성초 토너는 진짜 제가 너무너무 애정하는 제품입니다😍❣\n제가 원래도 아비브 제품을 엄청 애용하긴 하지만\n그 중에는 아비브 토너의 역할이 정말 컸어요!!\n지금 몇 번째 재구매인지 몰라요ㅋㅋㅋㅋ\n진짜 써보시면 다들 이 제품이 얼마나 좋은지 아실 거에요!!\n\n일단 제형은 그냥 물토너에요!!\n사진 보시면 아시겠지만 그냥 점성 아예 없이\n흐르는 제형입니다🙂\n\n그런데 진짜 촉촉함이 그냥 에센스 같아요👍\n\n그래서 저는 화장솜에 묻혀서 닦토로 사용하기 보다는\n손에 덜어서 흡토로 바로 사용합니다!!\n\n조금만 덜어도 얼굴 전체 흡토 가능하고 \n진짜 너무너무 촉촉해요!!\n\n토너만 발랐는데도 이렇게 촉촉해도 되나 싶어요!\n이렇게 촉촉한 물토너는 정말 처음 사용해봤어요!!\n\n또 어성초 성분이라서 진정효과도 정말 뛰어나서\n피부가 한창 예민해져 있을 때 사용하기 너무 좋아요👍\n\n\n',
                  style: TextStyle(
                    fontFamily: 'NotoSansKR',
                    color: black,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                  )),
            )
          ],
        ),
      ),
    );
  }
}
