import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:plinic2/constants.dart';
import 'package:plinic2/src/pages/challenge/before_after_create.dart';
import 'package:plinic2/src/pages/friends/invite_friend.dart';

class PointBaroPage extends StatelessWidget {
  const PointBaroPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 60),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
          child: Row(
            children: [
              Text('포인트 바로적립',
                  style: TextStyle(
                    fontFamily: 'NotoSansKR',
                    color: black,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal,
                  )),
            ],
          ),
        ),
        SizedBox(height: 26),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: spacing_xs),
          child: ListTile(
            onTap: () {
              Get.to(() => InviteFriend(), transition: Transition.native);
            },
            trailing: Icon(
              LineIcons.angleRight,
              color: grey_1,
              size: 24,
            ),
            title: Row(
              children: [
                Image.asset('assets/images/care/invite.png'),
                SizedBox(width: spacing_m),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('친구초대',
                        style: TextStyle(
                          fontFamily: 'NotoSansKR',
                          color: black,
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                        )),
                    SizedBox(height: spacing_xxs),
                    Text('Plinic에 친구를 초대하시면 \nⓒ 300을 적립해 드립니다.',
                        style: TextStyle(
                          fontFamily: 'NotoSansKR',
                          color: black,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                        ))
                  ],
                )
              ],
            ),
          ),
        ),
        SizedBox(height: spacing_xs),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
          child: Divider(),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: spacing_xs),
          child: ListTile(
            onTap: () {
              Get.to(() => BeforeAfterCreatePage(),
                  transition: Transition.native);
            },
            trailing: Icon(
              LineIcons.angleRight,
              color: grey_1,
              size: 24,
            ),
            title: Row(
              children: [
                Image.asset('assets/images/care/post.png'),
                SizedBox(width: spacing_m),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('게시물등록',
                        style: TextStyle(
                          fontFamily: 'NotoSansKR',
                          color: black,
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                        )),
                    SizedBox(height: spacing_xxs),
                    Text('Plinic에 친구를 초대하시면 \nⓒ 300을 적립해 드립니다.',
                        style: TextStyle(
                          fontFamily: 'NotoSansKR',
                          color: black,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                        ))
                  ],
                )
              ],
            ),
          ),
        ),
        SizedBox(height: spacing_xs),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
          child: Divider(),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: spacing_xs),
          child: ListTile(
            onTap: () {
              print('aa');
            },
            trailing: Icon(
              LineIcons.angleRight,
              color: grey_1,
              size: 24,
            ),
            title: Row(
              children: [
                Image.asset('assets/images/care/comment.png'),
                SizedBox(width: spacing_m),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('댓글등록',
                        style: TextStyle(
                          fontFamily: 'NotoSansKR',
                          color: black,
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                        )),
                    SizedBox(height: spacing_xxs),
                    Text('게시글에 댓글을 등록하시면\nⓒ 10을 적립해 드립니다.',
                        style: TextStyle(
                          fontFamily: 'NotoSansKR',
                          color: black,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                        ))
                  ],
                )
              ],
            ),
          ),
        ),
        SizedBox(height: spacing_xs),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
          child: Divider(),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: spacing_xs),
          child: ListTile(
            onTap: () {
              print('aa');
            },
            trailing: Icon(
              LineIcons.angleRight,
              color: grey_1,
              size: 24,
            ),
            title: Row(
              children: [
                Image.asset('assets/images/care/review.png'),
                SizedBox(width: spacing_m),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('상품리뷰',
                        style: TextStyle(
                          fontFamily: 'NotoSansKR',
                          color: black,
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                        )),
                    SizedBox(height: spacing_xxs),
                    Text('상품을 구매 후 리뷰를 등록하시면\nⓒ 500을 적립해 드립니다.',
                        style: TextStyle(
                          fontFamily: 'NotoSansKR',
                          color: black,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                        ))
                  ],
                )
              ],
            ),
          ),
        ),
        SizedBox(height: spacing_xs),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
          child: Divider(),
        ),
      ],
    );
  }
}
