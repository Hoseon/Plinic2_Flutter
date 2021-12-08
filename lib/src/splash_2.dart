import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Splash2Page extends StatefulWidget {
  const Splash2Page({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<Splash2Page> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 1), () {
      Get.offAllNamed('/app');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // const SizedBox(width: 20.0, height: 100.0),
            // const Text(
            //   'Be',
            //   style: TextStyle(fontSize: 43.0),
            // ),
            // const SizedBox(width: 20.0, height: 100.0),
            DefaultTextStyle(
              style: GoogleFonts.lato(
                  textStyle: TextStyle(
                      color: Color(0xff6200EE),
                      fontSize: 50.0,
                      fontWeight: FontWeight.w500)),
              // const TextStyle(
              //   fontSize: 40.0,
              //   fontFamily: 'Horizon',
              //   color: Colors.black
              // ),
              child: AnimatedTextKit(
                animatedTexts: [
                  RotateAnimatedText(
                    'Plinic',
                    duration: Duration(seconds: 2),
                    rotateOut: false
                  ),
                  // RotateAnimatedText('OPTIMISTIC'),
                  // RotateAnimatedText('DIFFERENT'),
                ],
                onTap: () {
                  print('Tap Event');
                },
              ),
            ),
            // AnimatedContainer(
            //   duration: Duration(seconds: 2),
            //   curve: Curves.bounceIn,
            //   child: Image.asset(
            //   'assets/images/splash/PLINIC.png',
            //   width: Get.mediaQuery.size.width * 0.5,
            //   ),
            // )
            
          ],
        ),
      ),
    );
  }
}
