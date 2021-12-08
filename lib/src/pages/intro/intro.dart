import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:plinic2/constants.dart';
import 'package:plinic2/src/pages/check_login.dart';

class OnBoardingPage extends StatefulWidget {
  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final introKey = GlobalKey<IntroductionScreenState>();

  late DateTime currentBackPressTime;

  void _onIntroEnd(context) {
    _gotoLogin();
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 19.0);

    const pageDecoration = PageDecoration(
        titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
        bodyTextStyle: bodyStyle,
        descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
        pageColor: Colors.white,
        imagePadding: EdgeInsets.zero,
        bodyAlignment: Alignment.topCenter);

    return Scaffold(
      body: DoubleBackToCloseApp(
        snackBar: SnackBar(
          content: Text('앱을 종료 하시겠습니까?'),
        ),
        child: IntroductionScreen(
          // key: introKey,
          globalBackgroundColor: Colors.white,
          globalHeader: Align(
            alignment: Alignment.topRight,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(top: 16, right: 16),
                // child: _buildImage('flutter.png', 100),
              ),
            ),
          ),
          globalFooter: Container(
            width: Get.mediaQuery.size.width,
            height: 60,
            decoration: BoxDecoration(borderRadius: BorderRadius.zero),
            child: ElevatedButton(
              style: ButtonStyle(
                elevation: MaterialStateProperty.all(0.0),
                shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(borderRadius: BorderRadius.zero)),
                backgroundColor: MaterialStateProperty.all(primaryColor),
              ),
              onPressed: () {
                _gotoLogin();
              },
              child: Text('건너뛰기',
                  style: TextStyle(
                    fontFamily: 'NotoSansKR',
                    color: Color(0xffffffff),
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal,
                  )),
            ),
          ),
          pages: [
            PageViewModel(
              title: '',
              bodyWidget: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 50),
                  Text('새로워진 플리닉 2.0',
                      style: TextStyle(
                          fontFamily: 'NotoSansKR',
                          fontSize: 24.0,
                          fontWeight: FontWeight.w700)),
                  SizedBox(height: 15),
                  Text(
                    '기존 플리닉과는 다른 서비스를 이용해보세요.',
                    style: TextStyle(fontFamily: 'NotoSansKR', fontSize: 16.0),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 60),
                  Image.asset('assets/images/intro/intro-image-1.png'),
                  // SvgPicture.asset('assets/images/intro/intro-image-1.svg')
                ],
              ),
              // body: '기존 플리닉과는 다른 서비스를 이용해보세요.',
              // image: FlutterLogo(size: 100.0),
              decoration: pageDecoration,
            ),
            PageViewModel(
              title: '',
              bodyWidget: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 50),
                  Text('피부 케어 다이어리',
                      style: TextStyle(
                          fontFamily: 'NotoSansKR',
                          fontSize: 24.0,
                          fontWeight: FontWeight.w700)),
                  SizedBox(height: 15),
                  Text(
                    '바쁜 일상 속 꾸준한 플리닉 사용 힘드셨죠?\n이젠 언제 어디서나 다이어리를 통해\n피부 케어를 습관화 해보세요.',
                    style: TextStyle(fontFamily: 'NotoSansKR', fontSize: 16.0),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 79),
                  Image.asset('assets/images/intro/intro-image-2.png'),
                  // SvgPicture.asset('assets/images/intro/intro-image-2.svg')
                ],
              ),
              // body: '기존 플리닉과는 다른 서비스를 이용해보세요.',
              // image: FlutterLogo(size: 100.0),
              decoration: pageDecoration,
            ),
            PageViewModel(
              title: '',
              bodyWidget: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 50),
                  Text('다른 사용자들과 소통',
                      style: TextStyle(
                          fontFamily: 'NotoSansKR',
                          fontSize: 24.0,
                          fontWeight: FontWeight.w700)),
                  SizedBox(height: 15),
                  Text(
                    'SNS처럼 다양한 정보를 커뮤니티 안에서\n공유해보세요. 피부가 변화된 인증샷을 남기면\n혜택이 팡팡!',
                    style: TextStyle(fontFamily: 'NotoSansKR', fontSize: 16.0),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 36),
                  Image.asset('assets/images/intro/intro-image-3.png'),
                  // SvgPicture.asset('assets/images/intro/intro-image-3.svg')
                ],
              ),
              // body: '기존 플리닉과는 다른 서비스를 이용해보세요.',
              // image: FlutterLogo(size: 100.0),
              decoration: pageDecoration,
            ),
            PageViewModel(
              title: '',
              bodyWidget: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 50),
                  Text('다양한 상품 구매',
                      style: TextStyle(
                          fontFamily: 'NotoSansKR',
                          fontSize: 24.0,
                          fontWeight: FontWeight.w700)),
                  SizedBox(height: 15),
                  Text(
                    '플리닉을 이용 하면서 획득한 포인트로\n구매해보세요.',
                    style: TextStyle(fontFamily: 'NotoSansKR', fontSize: 16.0),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 71),
                  Image.asset('assets/images/intro/intro-image-4.png')
                  // SvgPicture.asset('assets/images/intro/intro-image-4.svg')
                ],
              ),
              // body: '기존 플리닉과는 다른 서비스를 이용해보세요.',
              // image: FlutterLogo(size: 100.0),
              decoration: pageDecoration,
            ),
          ],
          onDone: () => _onIntroEnd(context),
          //onSkip: () => _onIntroEnd(context), // You can override onSkip callback
          showSkipButton: false,
          skipFlex: 0,
          nextFlex: 0,
          //rtl: true, // Display as right-to-left
          skip: const Text(
            'Skip',
            style: TextStyle(color: primaryColor),
          ),
          next: const Icon(
            Icons.arrow_forward,
            color: primaryColor,
          ),
          done: const Text('Done',
              style:
                  TextStyle(fontWeight: FontWeight.w600, color: primaryColor)),
          curve: Curves.fastLinearToSlowEaseIn,
          controlsMargin:
              EdgeInsets.only(bottom: Get.mediaQuery.size.height * 0.75),
          // controlsPadding: kIsWeb
          //     ? const EdgeInsets.all(12.0)
          //     : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
          dotsDecorator: const DotsDecorator(
            size: Size(10.0, 10.0),
            color: Color(0xFFBDBDBD),
            activeSize: Size(22.0, 10.0),
            activeColor: primary_dark,
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(25.0)),
            ),
          ),
          dotsContainerDecorator: const ShapeDecoration(
            color: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
            ),
          ),
        ),
      ),
    );
  }

  void _gotoLogin() {
    Get.offAll(() => CheckLogin(), transition: Transition.fadeIn);
  }

  // Future<bool> onWillPop() {
  //   var now = DateTime.now();
  //   if (currentBackPressTime == null ||
  //       now.difference(currentBackPressTime) > Duration(seconds: 2)) {
  //     currentBackPressTime = now;
  //     print('OnWillPop - Exit');
  //     return Future.value(false);
  //   }
  //   return Future.value(true);
  // }
}
