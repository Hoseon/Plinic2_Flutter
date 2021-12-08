import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plinic2/constants.dart';
import 'package:plinic2/src/component/custom_appbar.dart';

class RegisterQnaPage extends StatelessWidget {
  const RegisterQnaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar('문의하기'),
      backgroundColor: Colors.white,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: spacing_xl),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
                child: Row(
                  children: [
                    Text('궁금하신 사항을 문의해주시면 플리닉 운영팀에서 확인\n후 신속하게 답변드리도록 하겠습니다.',
                        style: TextStyle(
                          fontFamily: 'NotoSansKR',
                          color: Color(0xff000000),
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                        )),
                  ],
                ),
              ),
              SizedBox(height: spacing_xl),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
                child: Row(
                  children: [
                    Text(
                      '문의제목',
                      style: TextStyle(
                        fontFamily: 'NotoSansKR',
                        color: black,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: spacing_s),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
                child: Container(
                  // height: 48,
                  child: TextField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(8),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: grey_2, width: 0.5),
                      ),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red, width: 0.5)),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: grey_1, width: 0.5),
                      ),
                      hintText: '문의제목을 입력해주세요.',
                      hintStyle: TextStyle(
                        fontFamily: 'NotoSansKR',
                        color: primary,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: spacing_xl),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
                child: Row(
                  children: [
                    Text(
                      '문의내용',
                      style: TextStyle(
                        fontFamily: 'NotoSansKR',
                        color: black,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: spacing_s),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
                child: TextField(
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(8),
                      hintText: '문의내용을 입력해주세요.',
                      hintStyle: TextStyle(
                        fontFamily: 'NotoSansKR',
                        color: black,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: grey_2, width: 0.5)
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: grey_1, width: 0.5)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(4))),
                      focusColor: Colors.black,
                      hoverColor: primaryColor,
                      fillColor: primaryColor),
                  // controller: _controller,
                  maxLines: 10,
                  keyboardType: TextInputType.multiline,
                ),
              ),
              SizedBox(height: spacing_xl),
              unregistButton()
            ],
          ),
        ),
      ),
    );
  }

  Padding unregistButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
      child: Container(
        width: Get.mediaQuery.size.width,
        height: 50,
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(grey_2),
            elevation: MaterialStateProperty.all<double>(0.0),
          ),
          onPressed: () {},
          child: Text(
            '등록하기',
            style: TextStyle(
              fontFamily: 'NotoSansKR',
              color: grey_3,
              fontSize: 14,
              fontWeight: FontWeight.w700,
              fontStyle: FontStyle.normal,
            ),
          ),
        ),
      ),
    );
  }
}
