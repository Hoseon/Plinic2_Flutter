import 'package:flutter/material.dart';
import 'package:plinic2/src/component/custom_appbar.dart';

class PersonalPage extends StatelessWidget {
  const PersonalPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar('개인정보 취급방침'),
      backgroundColor: Colors.white,
      body: Center(
        child: Text('준비중'),
      )
    );
  }
}