import 'package:flutter/material.dart';
import 'package:plinic2/constants.dart';
import 'package:plinic2/src/component/custom_appbar.dart';

class OpenLicensePage extends StatelessWidget {
  const OpenLicensePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar('오픈소스라이선스'),
      body: Column(
        children: [
          SizedBox(height: spacing_xl),
          buildLicense(),
          SizedBox(height: spacing_xl),
          buildLicense(),
          SizedBox(height: spacing_xl),
          buildLicense(),
        ],
      ),
    );
  }

  Widget buildLicense() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
          child: Row(
            children: [
              Text(
                '1Password App Extension',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: spacing_m),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: spacing_xxl2),
          child: Row(
            children: [
              Text(
                'https://github.com/Aglitij/onePassword-app-extension',
                style: TextStyle(
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                    fontSize: 11,
                    color: Colors.blue),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: spacing_xxl2),
          child: Row(
            children: [
              Text(
                'Copyright 2014 AgilieBits Inc.',
                style: TextStyle(
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                    fontSize: 11,
                    color: grey_1),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: spacing_xxl2),
          child: Row(
            children: [
              Text(
                'MIT License',
                style: TextStyle(
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                    fontSize: 11,
                    color: grey_1),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
