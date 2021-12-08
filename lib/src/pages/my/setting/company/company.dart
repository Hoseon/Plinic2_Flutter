import 'package:flutter/material.dart';
import 'package:plinic2/constants.dart';
import 'package:plinic2/src/component/custom_appbar.dart';

class CompanyPage extends StatefulWidget {
  const CompanyPage({Key? key}) : super(key: key);

  @override
  State<CompanyPage> createState() => _CompanyPageState();
}

class _CompanyPageState extends State<CompanyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppbar('사업자 필수 정보'),
        backgroundColor: white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: spacing_s),
              Container(
                padding: EdgeInsets.symmetric(horizontal: spacing_xl),
                alignment: Alignment.centerLeft,
                child: Text('상호',
                    style: TextStyle(
                      fontFamily: 'NotoSansKR',
                      color: black,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal,
                    )),
              ),
              SizedBox(height: spacing_xxs),
              Container(
                padding: EdgeInsets.symmetric(horizontal: spacing_xl),
                alignment: Alignment.centerLeft,
                child: Text('(주) 지원파트너스',
                    style: TextStyle(
                      fontFamily: 'NotoSansKR',
                      color: black,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    )),
              ),
              SizedBox(height: spacing_s),
              Divider(),
              SizedBox(height: spacing_s),
              Container(
                padding: EdgeInsets.symmetric(horizontal: spacing_xl),
                alignment: Alignment.centerLeft,
                child: Text('신고현황',
                    style: TextStyle(
                      fontFamily: 'NotoSansKR',
                      color: black,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal,
                    )),
              ),
              SizedBox(height: spacing_xxs),
              Container(
                padding: EdgeInsets.symmetric(horizontal: spacing_xl),
                alignment: Alignment.centerLeft,
                child: Text('통신판매업 신고  [제2018-인천연수구-0900호]',
                    style: TextStyle(
                      fontFamily: 'NotoSansKR',
                      color: black,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    )),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: spacing_xl),
                alignment: Alignment.centerLeft,
                child: Text('화장품제조업',
                    style: TextStyle(
                      fontFamily: 'NotoSansKR',
                      color: black,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    )),
              ),
              SizedBox(height: spacing_s),
              Divider(),
              SizedBox(height: spacing_s),
              Container(
                padding: EdgeInsets.symmetric(horizontal: spacing_xl),
                alignment: Alignment.centerLeft,
                child: Text('사업자등록번호',
                    style: TextStyle(
                      fontFamily: 'NotoSansKR',
                      color: black,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal,
                    )),
              ),
              SizedBox(height: spacing_xxs),
              Container(
                padding: EdgeInsets.symmetric(horizontal: spacing_xl),
                alignment: Alignment.centerLeft,
                child: Text('389-87-00210',
                    style: TextStyle(
                      fontFamily: 'NotoSansKR',
                      color: black,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    )),
              ),
              SizedBox(height: spacing_s),
              Divider(),
              SizedBox(height: spacing_s),
              Container(
                padding: EdgeInsets.symmetric(horizontal: spacing_xl),
                alignment: Alignment.centerLeft,
                child: Text('대표자명',
                    style: TextStyle(
                      fontFamily: 'NotoSansKR',
                      color: black,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal,
                    )),
              ),
              SizedBox(height: spacing_xxs),
              Container(
                padding: EdgeInsets.symmetric(horizontal: spacing_xl),
                alignment: Alignment.centerLeft,
                child: Text('이성균',
                    style: TextStyle(
                      fontFamily: 'NotoSansKR',
                      color: black,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    )),
              ),
              SizedBox(height: spacing_s),
              Divider(),
              SizedBox(height: spacing_s),
              Container(
                padding: EdgeInsets.symmetric(horizontal: spacing_xl),
                alignment: Alignment.centerLeft,
                child: Text('주소',
                    style: TextStyle(
                      fontFamily: 'NotoSansKR',
                      color: black,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal,
                    )),
              ),
              SizedBox(height: spacing_xxs),
              Container(
                padding: EdgeInsets.symmetric(horizontal: spacing_xl),
                alignment: Alignment.centerLeft,
                child: Text(
                    '인천광역시 연수구 송도미래로 30 (송도동) 송도 BRC 스마트밸리 지식 사업센터 A동 707호',
                    style: TextStyle(
                      fontFamily: 'NotoSansKR',
                      color: black,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    )),
              ),
              SizedBox(height: spacing_s),
              Divider(),
              SizedBox(height: spacing_s),
              Container(
                padding: EdgeInsets.symmetric(horizontal: spacing_xl),
                alignment: Alignment.centerLeft,
                child: Text('대표 전화번호',
                    style: TextStyle(
                      fontFamily: 'NotoSansKR',
                      color: black,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal,
                    )),
              ),
              SizedBox(height: spacing_xxs),
              Container(
                padding: EdgeInsets.symmetric(horizontal: spacing_xl),
                alignment: Alignment.centerLeft,
                child: Text('02-2038-4876',
                    style: TextStyle(
                      fontFamily: 'NotoSansKR',
                      color: black,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    )),
              ),
              SizedBox(height: spacing_s),
              Divider(),
            ],
          ),
        ));
  }
}
