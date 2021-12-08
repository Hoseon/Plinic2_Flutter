import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:line_icons/line_icons.dart';
import 'package:plinic2/constants.dart';
import 'package:plinic2/src/component/custom_appbar.dart';
import 'package:plinic2/src/model/display/magazine_model.dart';
import 'package:shimmer/shimmer.dart';

class MagazineDetailPage extends StatelessWidget {
  const MagazineDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mode = Get.arguments['mode'];
    if (mode == 'main') {
      MagazineModel values = Get.arguments['values'];

      return mainScaffold(values, context);
    } else {
      var values = Get.arguments;
      var create_time = convertTimeStamp(values['create_time']);
      return detailScaffold(create_time, values, context);
    }
  }

  Widget mainScaffold(MagazineModel values, BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar('매거진 보기'),
      backgroundColor: Colors.white,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              buildBody(
                  values.docId.toString(),
                  values.sliver_image.toString(),
                  values.title.toString(),
                  values.sub_title.toString(),
                  values.content.toString(),
                  DateFormat('yyyy-MM-dd').format(values.create_time!)),
            ],
          ),
        ),
      ),
    );
  }

  Widget detailScaffold(String create_time, values, BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar('매거진 보기'),
      backgroundColor: Colors.white,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              buildBody(
                values['docId'].toString(),
                values['sliver_image'].toString(),
                values['title'].toString(),
                values['sub_title'].toString(),
                values['content'].toString(),
                create_time,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Column buildBody(heroTag, imgUrl, title, midtitle, content, create_time) {
    return Column(
      children: [
        Hero(
          tag: heroTag,
          child: Stack(
            alignment: Alignment.bottomLeft,
            children: [
              CachedNetworkImage(
                imageUrl: imgUrl,
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
        SizedBox(height: spacing_l),
        Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.symmetric(horizontal: spacing_xl),
          child: Text(
            title,
            style: TextStyle(
              fontFamily: 'NotoSansKR',
              color: black,
              fontSize: 20,
              fontWeight: FontWeight.w700,
              fontStyle: FontStyle.normal,
            ),
          ),
        ),
        SizedBox(height: spacing_s),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
          child: HtmlWidget(
            content,
            webView: true,
            textStyle: TextStyle(
                fontFamily: 'NotoSansKR',
                fontSize: 14,
                height: 1.64,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal),
          ),
        ),
        // Container(
        //   padding: EdgeInsets.symmetric(horizontal: spacing_xl),
        //   child: Text(
        //     '[진화하는 뷰티 테크] 오늘 피부가 저기압이군요. 촉촉·화사 파운데이션 만들어 드릴게요 \r\n \r\n글자크기���자크게글자작게|프린트\r\n3월부터 맞춤형 화장품 제도 시행… 조제관리사가 개인 피부에 맞춰 큐레이션\r\n\r\n▎피부 색을 측정해 개인 맞춤형 색을 추천해주는 컬러 팩토리 서비스. \n“요즘 컨디션이 안 좋으신가 봐요? 안색이 창백하고 기미도 부쩍 늘었네요. 피부도 건조하고 푸석푸석해졌어요.”\r\n\r\n화장품 매장 직원이 한 여성의 피부를 기기로 측정한 뒤 진단 결과를 들이밀었다. 여성은 고개를 끄덕였다. 매일 아침마다 푸석푸석한 얼굴 탓에 파운데이션도 뜨고 평소 바르던 립스틱도 컬러가 어울리는 것 같지 않아 허둥대던 자신의 모습이 떠올랐다. 직원은 진단 결과를 토대로 여성의 피부에 생기를 불어넣을 마스크팩과 기초 화장품을 만들어주고 립스틱도 골라줬다. 최근 스트레스에 많이 노출된 고객을 위한 맞춤형 화장품이다.\r',
        //     style: TextStyle(
        //       fontFamily: 'NotoSansKR',
        //       color: black,
        //       fontSize: 14,
        //       fontWeight: FontWeight.w400,
        //       fontStyle: FontStyle.normal,
        //     ),
        //   ),
        // ),
        SizedBox(height: spacing_l),
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
                  splashColor: primary_light,
                  onTap: () {
                    print('Heart');
                  },
                  child: Icon(LineIcons.comment)),
              SizedBox(width: spacing_xs),
              Expanded(
                child: Text(
                  '32',
                  style: TextStyle(
                    fontFamily: 'NotoSansKR',
                    color: black,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                  ),
                ),
              ),
              Text(
                create_time,
                style: TextStyle(
                  fontFamily: 'NotoSansKR',
                  color: grey_2,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                ),
              )
            ],
          ),
        ),
        SizedBox(height: spacing_m),
        Divider(thickness: 15),
        SizedBox(height: spacing_s),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
          child: Row(
            children: [
              Text('댓글',
                  style: TextStyle(
                    fontFamily: 'NotoSansKR',
                    color: Color(0xff000000),
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal,
                  )),
            ],
          ),
        ),
        SizedBox(height: spacing_s),
        Divider(),
        SizedBox(height: spacing_m),
        buildComment('', '피카츄라이츄', '플리닉이랑 기기랑 같이 사용하면 더 효과좋던데요?'),
        buildComment('', '깨끗한피부', '저는 벌써 다없어졌어요'),
        buildComment(
            '', '쑥대머리', '구독박스 처음에는 반신반의 했는데 저렴한 가격에 잘 이용하게 되는거 같아요! 추천추천 합니당'),
        buildComment('', '쑥대머리',
            '구독박스 처음에는 ��신반의 했는데 저렴한 가격에 잘 이용하게 되는거 같아요! 추천추천 합니당 구독박스 처음에는 반신반�� 했는데 저렴한 가격에 잘 이용하게 되는거 같아요! 추천추천 합니당 구독박스 처음에는 반신반의 했는데 저렴한 가격에 잘 이용하게 되는거 같아요! 추���추천 합니당 구독박스 처음에는 ���신반의 했는데 저렴한 가격에 잘 이용하게 되는거 같아요! 추천추천 합니당'),
        SizedBox(height: 47),
        buildInputComment(),
        SizedBox(height: 47),
      ],
    );
  }

  Widget buildComment(profileImgUrl, nickname, comment) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
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
                Container(
                  width: Get.mediaQuery.size.width * 0.68,
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
                InkWell(
                    borderRadius: BorderRadius.circular(30),
                    onTap: () {
                      print('a');
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

  static String convertTimeStamp(Timestamp timestamp) {
    assert(timestamp != null);
    String convertedDate;
    // DateFormat.yMMMEd()
    convertedDate = DateFormat('yyyy-MM-dd').format(timestamp.toDate());
    return convertedDate;
  }
}
