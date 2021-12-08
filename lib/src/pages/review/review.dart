import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:plinic2/constants.dart';
import 'package:plinic2/src/component/custom_appbar.dart';
import 'package:plinic2/src/controller/person_controller.dart';
import 'package:plinic2/src/pages/review/review_detail.dart';
import 'package:shimmer/shimmer.dart';

class ReviewPage extends StatefulWidget {
  const ReviewPage({Key? key}) : super(key: key);

  @override
  _ReviewPageState createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
  ScrollController? scrollController;
  List contents = [for (int i = 0; i < 10; i++) i];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppbar('리뷰'),
        body: NotificationListener(
          onNotification: (Notification notification) {
            scrollController = PrimaryScrollController.of(context);
            if (scrollController!.offset == scrollController!.position.maxScrollExtent && notification is ScrollEndNotification) {
                Get.find<PersonController>().reload();
            }
            return false;
          },
          child: _loadReview(context)
        ));
  }

  Widget _loadReview(BuildContext context) {
    return GetX<PersonController>(
      init: Get.put<PersonController>(PersonController()),
      builder: (PersonController personController) {
        if (personController.person.isNotEmpty) {
            return ListView.builder(
              controller: PrimaryScrollController.of(context),
              itemCount: personController.person.length + 1,
              itemBuilder: (_, index) {
                if (index < personController.person.length) {
                  return InkWell(
                    splashColor: grey_2,
                    onTap: () {
                      print(personController.person[index].id.toString());
                      Get.to(
                          () => ReviewDetailPage(
                              id: personController.person[index].id.toString()),
                          transition: Transition.fadeIn);
                    },
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            // crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CachedNetworkImage(
                                imageUrl:
                                    personController.person[index].posterUrl,
                                placeholder: (_, url) => Shimmer.fromColors(
                                  direction: ShimmerDirection.ltr,
                                  period: Duration(seconds: 2),
                                  baseColor: grey_3,
                                  highlightColor: Colors.grey.shade300,
                                  child: Container(
                                    width: 100,
                                    height: 100,
                                    color: grey_2,
                                  ),
                                ),
                                errorWidget: (context, url, error) =>
                                    Icon(Icons.error),
                                width: 100,
                                height: 100,
                                fit: BoxFit.cover,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: spacing_m),
                                child: Container(
                                  // width: 300,
                                  height: 100,
                                  // color: Colors.grey,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        width: 200,
                                        child: Text(
                                          personController.person[index].title
                                              .toString(),
                                          style: TextStyle(
                                            fontFamily: 'NotoSansKR',
                                            color: Color(0xff000000),
                                            fontSize: 14,
                                            fontWeight: FontWeight.w700,
                                            fontStyle: FontStyle.normal,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      Container(
                                        width: Get.mediaQuery.size.width * 0.60,
                                        child: Text(
                                          personController
                                              .person[index].overview
                                              .toString(),
                                          style: TextStyle(
                                            fontFamily: 'NotoSansKR',
                                            color: Color(0xff000000),
                                            fontSize: 14,
                                            fontWeight: FontWeight.w700,
                                            fontStyle: FontStyle.normal,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      SizedBox(height: 20),
                                      Container(
                                        width: 220,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            RatingBar(
                                              initialRating: personController
                                                      .person[index]
                                                      .vote_average!
                                                      .toDouble() *
                                                  0.5,
                                              itemSize: 15,
                                              minRating: 0,
                                              maxRating: 5,
                                              direction: Axis.horizontal,
                                              allowHalfRating: true,
                                              itemCount: 5,
                                              ratingWidget: RatingWidget(
                                                full: Icon(
                                                  Icons.star,
                                                  color: primaryColor,
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
                                            // RatingBar.builder(

                                            //   itemSize: 15,
                                            //   initialRating: personController
                                            //           .person[index].vote_average!
                                            //           .toDouble() *
                                            //       0.5,
                                            //   minRating: 1,
                                            //   maxRating: 5,
                                            //   direction: Axis.horizontal,
                                            //   allowHalfRating: true,
                                            //   itemCount: 5,
                                            //   itemPadding: EdgeInsets.symmetric(
                                            //       horizontal: 0.2),
                                            //   itemBuilder: (context, _) => Icon(
                                            //     Icons.star,
                                            //     color: primaryColor,
                                            //   ),
                                            //   // unratedColor: primaryColor,
                                            //   // glowColor: primaryColor,
                                            //   // glow: true,
                                            //   onRatingUpdate: (rating) {
                                            //     print(rating);
                                            //   },
                                            // ),
                                            Text(personController
                                                .person[index].release_date
                                                .toString())
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }
                return Column(
                  children: [
                    SizedBox(height: 20),
                    Center(
                      child: CircularProgressIndicator(
                        color: primaryColor,
                      ),
                    ),
                  ],
                );
              },
            );
        }
        return shimmerLoading();
      },
    );
  }

  Widget shimmerLoading() {
    return Padding(
      padding: const EdgeInsets.only(left: spacing_xl),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: spacing_xl),
          Shimmer.fromColors(
              highlightColor: Colors.grey.shade300,
              baseColor: Colors.grey.shade100,
              child: Container(
                width: 82,
                height: 20,
                color: Colors.white,
              )),
          SizedBox(height: 40),
          Row(
            children: [
              Shimmer.fromColors(
                  highlightColor: Colors.grey.shade300,
                  baseColor: grey_3,
                  child: Container(
                    width: 82,
                    height: 82,
                    color: Colors.white,
                  )),
              SizedBox(width: spacing_m),
              Column(children: [
                Shimmer.fromColors(
                  highlightColor: Colors.grey.shade300,
                  baseColor: grey_3,
                  child: Container(
                    width: 229,
                    height: 20,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: spacing_xxs),
                Shimmer.fromColors(
                  highlightColor: Colors.grey.shade300,
                  baseColor: grey_3,
                  child: Container(
                    width: 229,
                    height: 20,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 20.0),
                Shimmer.fromColors(
                  highlightColor: Colors.grey.shade300,
                  baseColor: grey_3,
                  child: Container(
                    width: 229,
                    height: 20,
                    color: Colors.white,
                  ),
                ),
              ])
            ],
          ),
          SizedBox(height: spacing_l),
          Row(
            children: [
              Shimmer.fromColors(
                  highlightColor: Colors.grey.shade300,
                  baseColor: grey_3,
                  child: Container(
                    width: 82,
                    height: 82,
                    color: Colors.white,
                  )),
              SizedBox(width: spacing_m),
              Column(children: [
                Shimmer.fromColors(
                  highlightColor: Colors.grey.shade300,
                  baseColor: grey_3,
                  child: Container(
                    width: 229,
                    height: 20,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: spacing_xxs),
                Shimmer.fromColors(
                  highlightColor: Colors.grey.shade300,
                  baseColor: grey_3,
                  child: Container(
                    width: 229,
                    height: 20,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 20.0),
                Shimmer.fromColors(
                  highlightColor: Colors.grey.shade300,
                  baseColor: grey_3,
                  child: Container(
                    width: 229,
                    height: 20,
                    color: Colors.white,
                  ),
                ),
              ])
            ],
          ),
          SizedBox(height: spacing_l),
          Row(
            children: [
              Shimmer.fromColors(
                  highlightColor: Colors.grey.shade300,
                  baseColor: grey_3,
                  child: Container(
                    width: 82,
                    height: 82,
                    color: Colors.white,
                  )),
              SizedBox(width: spacing_m),
              Column(children: [
                Shimmer.fromColors(
                  highlightColor: Colors.grey.shade300,
                  baseColor: grey_3,
                  child: Container(
                    width: 229,
                    height: 20,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: spacing_xxs),
                Shimmer.fromColors(
                  highlightColor: Colors.grey.shade300,
                  baseColor: grey_3,
                  child: Container(
                    width: 229,
                    height: 20,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 20.0),
                Shimmer.fromColors(
                  highlightColor: Colors.grey.shade300,
                  baseColor: grey_3,
                  child: Container(
                    width: 229,
                    height: 20,
                    color: Colors.white,
                  ),
                ),
              ])
            ],
          ),
          SizedBox(height: spacing_l),
          Row(
            children: [
              Shimmer.fromColors(
                  highlightColor: Colors.grey.shade300,
                  baseColor: grey_3,
                  child: Container(
                    width: 82,
                    height: 82,
                    color: Colors.white,
                  )),
              SizedBox(width: spacing_m),
              Column(children: [
                Shimmer.fromColors(
                  highlightColor: Colors.grey.shade300,
                  baseColor: grey_3,
                  child: Container(
                    width: 229,
                    height: 20,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: spacing_xxs),
                Shimmer.fromColors(
                  highlightColor: Colors.grey.shade300,
                  baseColor: grey_3,
                  child: Container(
                    width: 229,
                    height: 20,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 20.0),
                Shimmer.fromColors(
                  highlightColor: Colors.grey.shade300,
                  baseColor: grey_3,
                  child: Container(
                    width: 229,
                    height: 20,
                    color: Colors.white,
                  ),
                ),
              ])
            ],
          ),
        ],
      ),
    );
  }
}
