import 'package:auto_size_text/auto_size_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:plinic2/constants.dart';
import 'package:plinic2/src/component/custom_appbar.dart';
import 'package:plinic2/src/pages/ble_connect/components/video_player.dart';
import 'package:plinic2/src/pages/my/setting/company/company.dart';
import 'package:plinic2/src/pages/my/setting/open_license/open_license.dart';
import 'package:plinic2/src/pages/my/setting/personal/personal.dart';
import 'package:plinic2/src/pages/my/setting/terms_conditions/terms_conditions.dart';
import 'package:plinic2/src/pages/unregister/unregister.dart';

class SettingPage extends StatefulWidget {
  SettingPage({Key? key}) : super(key: key);

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  PackageInfo? _packageInfo;
  @override
  void initState() {
    // TODO: implement initState
    getPackageInfo().then((value) {
      setState(() {
        _packageInfo = value;
      });
    });
    super.initState();
  }

  Future<PackageInfo> getPackageInfo() async {
    return await PackageInfo.fromPlatform();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar('설정'),
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          SizedBox(height: 76),
          Image.asset('assets/images/icons/frame79.png', width: 79, height: 79),
          SizedBox(height: spacing_xl),
          Column(
            children: [
              AutoSizeText(
                _packageInfo!.version.toString(),
                style: TextStyle(
                  fontFamily: 'NotoSans',
                  color: black,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                ),
              ),
              SizedBox(height: spacing_xxs),
              AutoSizeText(
                '최신 버전 사용중',
                style: TextStyle(
                  fontFamily: 'NotoSans',
                  color: textfields,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                ),
              ),
              SizedBox(height: 20),
            ],
          ),

          // SettingList(
          //     title: '버전정보',
          //     subtitle: '1.1v',
          //     onClick: () {
          //       Get.to(() => VersionPage(), transition: Transition.native);
          //     }),
          // SettingList(
          //     title: 'FAQ',
          //     onClick: () {
          //       Get.to(() => FaqPage(), transition: Transition.native);
          //     }),
          SettingList(
              title: '오픈소스 라이선스',
              onClick: () {
                Get.to(() => OpenLicensePage(), transition: Transition.native);
              }),
          SettingList(
              title: '사업자 필수 정보',
              onClick: () {
                Get.to(() => CompanyPage(), transition: Transition.native);
              }),
          SettingList(
              title: '이용약관',
              onClick: () {
                Get.to(() => TermsConditionPage(),
                    transition: Transition.native);
              }),
          SettingList(
              title: '개인정보 취급방침',
              onClick: () {
                Get.to(() => PersonalPage(), transition: Transition.native);
              }),
          // SettingList(
          //     title: '마케팅 수신동의',
          //     onClick: () {
          //       Get.to(() => MarketingPage(), transition: Transition.native);
          //     }),
          SizedBox(height: 34),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
                child: ConstrainedBox(
                  constraints: BoxConstraints.tightForFinite(
                    // width: Get.mediaQuery.size.width * 0.5,
                    height: 45,
                  ),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      elevation: MaterialStateProperty.all(0.0),
                      backgroundColor: MaterialStateProperty.all(grey_2),
                      textStyle: MaterialStateProperty.all(TextStyle()),
                    ),
                    onPressed: () async {
                      await FirebaseAuth.instance.signOut().then(
                          (onvalue) async {
                        await Get.offAllNamed('/app');
                      }, onError: (e) {
                        throw e;
                      });
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            alignment: Alignment.centerLeft,
                            color: Colors.transparent,
                            // child: SizedBox(width: 20, child: SvgPicture.asset('assets/images/kakaosymbol.svg'))
                          ),
                        ),
                        // SizedBox(width: spacing_xs),
                        Expanded(
                          flex: 2,
                          child: Container(
                            width: 250,
                            color: Colors.transparent,
                            child: Text(
                              '로그아웃',
                              style: TextStyle(
                                fontFamily: 'NotoSansKR',
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            // width: 30,
                            color: Colors.transparent,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: spacing_s),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
                child: Row(
                  children: [
                    AutoSizeText(
                      '플리닉 서비스를 더이상 사용하지 않으시려면',
                      style: TextStyle(
                        fontFamily: 'NotoSans',
                        color: grey_1,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                    InkWell(
                      onTap: () async {
                        await Get.to(() => UnRegisterPage());
                      },
                      child: AutoSizeText(
                        ' 탈퇴하기>',
                        style: TextStyle(
                          fontFamily: 'NotoSans',
                          color: grey_1,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class SettingList extends StatelessWidget {
  final String? title;
  final Function()? onClick;
  final String? subtitle;
  SettingList({Key? key, required this.title, this.subtitle, this.onClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: ListTile(
        title: Row(
          children: [
            AutoSizeText(
              title!,
              style: TextStyle(
                fontFamily: 'NotoSansKR',
                color: black,
                fontSize: 14,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
              ),
            ),
            SizedBox(width: spacing_xxs),
            if (subtitle != null)
              AutoSizeText(
                subtitle!,
                style: TextStyle(
                  fontFamily: 'NotoSansKR',
                  color: Colors.red,
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                ),
              )
          ],
        ),
        trailing: Icon(Icons.arrow_forward_ios, size: 15),
        onTap: onClick,
        // shape: Border(bottom: BorderSide(color: grey_3)),
      ),
    );
  }
}
