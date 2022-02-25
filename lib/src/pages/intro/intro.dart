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
          // globalFooter: Container(
          //   width: Get.mediaQuery.size.width,
          //   height: 60,
          //   decoration: BoxDecoration(borderRadius: BorderRadius.zero),
          //   child: ElevatedButton(
          //     style: ButtonStyle(
          //       elevation: MaterialStateProperty.all(0.0),
          //       shape: MaterialStateProperty.all(
          //           RoundedRectangleBorder(borderRadius: BorderRadius.zero)),
          //       backgroundColor: MaterialStateProperty.all(Colors.transparent),
          //     ),
          //     onPressed: () {
          //       // _gotoLogin();
          //     },
          //     child: Text('',
          //         style: TextStyle(
          //           fontFamily: 'NotoSansKR',
          //           color: Color(0xffffffff),
          //           fontSize: 14,
          //           fontWeight: FontWeight.w700,
          //           fontStyle: FontStyle.normal,
          //         )),
          //   ),
          // ),
          pages: [
            PageViewModel(
              title: '',
              bodyWidget: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/intro/Onboarding_1.png',
                    width: Get.mediaQuery.size.width,
                    fit: BoxFit.fitWidth,
                  )
                ],
              ),
              decoration: pageDecoration,
            ),
            PageViewModel(
              title: '',
              bodyWidget: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/intro/Onboarding_2.png',
                    width: Get.mediaQuery.size.width,
                    fit: BoxFit.fitWidth,
                  )
                ],
              ),
              decoration: pageDecoration,
            ),
            PageViewModel(
              title: '',
              bodyWidget: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/intro/Onboarding_3.png',
                    width: Get.mediaQuery.size.width,
                    fit: BoxFit.fitWidth,
                  )
                ],
              ),
              decoration: pageDecoration,
            ),
          ],
          onDone: () => _onIntroEnd(context),
          onSkip: () => _gotoLogin(),
          showSkipButton: true,
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
              EdgeInsets.only(bottom: Get.mediaQuery.size.height * 0.85),
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
