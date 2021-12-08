import 'package:flutter/material.dart';

class AppbarTitle extends StatelessWidget {
  final String title;
  const AppbarTitle({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontFamily: 'NotoSansKR',
        color: Color(0xff000000),
        fontSize: 16,
        fontWeight: FontWeight.w700,
        fontStyle: FontStyle.normal,
      ),
    );
  }
}
