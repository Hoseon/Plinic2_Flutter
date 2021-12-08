import 'package:flutter/material.dart';
import 'package:plinic2/src/component/custom_appbar.dart';

class MarketingPage extends StatelessWidget {
  const MarketingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar('마케팅수신동의'),
      backgroundColor: Colors.white,
      body: Center(
        child: Text('준비중'),
      ),
    );
  }
}