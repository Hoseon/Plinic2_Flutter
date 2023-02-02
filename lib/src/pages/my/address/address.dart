import 'dart:convert';

import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:get/get.dart';
import 'package:plinic2/constants.dart';
import 'package:plinic2/src/component/appbar_title.dart';
import 'package:plinic2/src/component/plinic_dialog_two_button.dart';
import 'package:plinic2/src/controller/my/MyAlarmController.dart';
import 'package:plinic2/src/controller/my/myAddress_controller.dart';
import 'package:plinic2/src/pages/my/address/address_search.dart';

class AddressPage extends StatefulWidget {
  AddressPage({Key? key}) : super(key: key);

  @override
  _AddressPageState createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  final TextEditingController _controller1 = TextEditingController();

  final TextEditingController _controller2 = TextEditingController();

  final TextEditingController _controller3 = TextEditingController();

  final MaskedTextController _maskedTextController =
      MaskedTextController(mask: '000-0000-0000');

  bool isCheck = false;
  bool isBtnCheck = false;

  String postNumber = '00000';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppbarTitle(title: '배송지등록'),
        centerTitle: true,
        elevation: 0.3,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            isSavePost(context);
            // Get.back();
          },
          color: Colors.black,
        ),
      ),
      backgroundColor: Colors.white,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                SizedBox(height: spacing_m),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
                  child: Row(
                    children: [
                      buildText('받는사람'),
                    ],
                  ),
                ),
                SizedBox(height: spacing_s),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
                  child: Container(
                    // height: 48,
                    child: TextField(
                      controller: _controller1,
                      onChanged: (value) {
                        checkForm();
                        // _controller1.text = value;
                      },
                      // textAlignVertical: TextAlignVertical.center,
                      // keyboardType: TextInputType.text,
                      style: TextStyle(
                        fontFamily: 'NotoSans',
                        color: black,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      ),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(8),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: grey_2, width: 0.5),
                        ),
                        border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.red, width: 1)),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: grey_1, width: 0.5),
                        ),
                        hintText: '이름을 입력해주세요',
                        hintStyle: TextStyle(
                          fontFamily: 'NotoSans',
                          color: textfields,
                          fontSize: 12,
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
                      buildText('주소'),
                    ],
                  ),
                ),
                SizedBox(height: spacing_xs),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
                  child: Row(
                    children: [
                      Flexible(
                        flex: 2,
                        child: Container(
                          child: TextField(
                            controller: _controller2,
                            onChanged: (value) {
                              checkForm();
                            },
                            keyboardType: TextInputType.text,
                            style: TextStyle(
                              fontFamily: 'NotoSans',
                              color: black,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                            ),
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(8),
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: grey_2, width: 0.5),
                                ),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.red, width: 1)),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: grey_1, width: 0.5),
                                ),
                                hintText: '주소찾기를 눌러주세요',
                                hintStyle: TextStyle(
                                    color: textfields,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'NotoSans',
                                    fontStyle: FontStyle.normal,
                                    fontSize: 12.0),
                                filled: true,
                                fillColor: white,
                                enabled: false),
                          ),
                        ),
                      ),
                      SizedBox(width: spacing_xs),
                      Flexible(
                          flex: 1,
                          child: Container(
                            child: findPostButton(),
                          ))
                    ],
                  ),
                ),
                SizedBox(height: spacing_xs),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
                  child: Row(
                    children: [
                      Flexible(
                        flex: 2,
                        child: Container(
                          child: TextField(
                            controller: _controller3,
                            onChanged: (value) {
                              checkForm();
                            },
                            // readOnly: true,
                            keyboardType: TextInputType.text,
                            style: TextStyle(
                              fontFamily: 'NotoSans',
                              color: black,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                            ),
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(8),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: grey_2, width: 1),
                              ),
                              border: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: grey_1, width: 1)),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: grey_1, width: 1),
                              ),
                              hintText: '상세정보를 입력해주세요',
                              hintStyle: TextStyle(
                                fontFamily: 'NotoSans',
                                color: textfields,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                              ),
                              filled: true,
                              fillColor: grey_3,
                              enabled: true,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: spacing_xl),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
                  child: Row(
                    children: [
                      buildText('휴대폰'),
                    ],
                  ),
                ),
                SizedBox(height: spacing_s),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
                  child: TextField(
                    controller: _maskedTextController,
                    textAlignVertical: TextAlignVertical.center,
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      checkForm();
                    },
                    style: TextStyle(
                      fontFamily: 'NotoSans',
                      color: black,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    ),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(8),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: grey_2, width: 0.5),
                      ),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red, width: 1)),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: grey_1, width: 0.5),
                      ),
                      hintText: '휴대폰번호를 입력해주세요',
                      hintStyle: TextStyle(
                        fontFamily: 'NotoSans',
                        color: textfields,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 38),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
                  child: Row(
                    children: [
                      isCheck ? checkbox() : uncheckbox(),
                      SizedBox(width: 6),
                      buildText('기본배송지로 설정')
                    ],
                  ),
                ),
                SizedBox(height: 36),
                isBtnCheck == true ? registButton() : unregistButton()
              ],
            ),
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

  Padding registButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
      child: Container(
        width: Get.mediaQuery.size.width,
        height: 50,
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(primaryColor),
            elevation: MaterialStateProperty.all<double>(0.0),
          ),
          onPressed: () async {
            print(_controller1.text);
            print(_controller2.text);
            print(_controller3.text);
            print(_maskedTextController.text);
            await MyAddressController.to.creatUserAddress(
                _controller1.text,
                _controller2.text,
                _controller3.text,
                _maskedTextController.text,
                postNumber,
                isCheck);
            Get.back();
          },
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

  Container checkbox() {
    return Container(
      color: Colors.transparent,
      child: IconButton(
        padding: EdgeInsets.all(0),
        constraints: BoxConstraints(),
        icon: Icon(
          Icons.check_circle,
        ),
        onPressed: () {
          setState(() {
            isCheck = false;
          });
        },
        color: primaryColor,
      ),
    );
  }

  Widget uncheckbox() {
    return Container(
      color: Colors.transparent,
      child: IconButton(
        padding: EdgeInsets.all(0),
        constraints: BoxConstraints(),
        icon: Icon(
          Icons.check_circle_outline,
          color: grey_2,
        ),
        onPressed: () {
          setState(() {
            isCheck = true;
          });
        },
        color: Colors.black,
      ),
    );
  }

  Text buildText(String title) {
    return Text(
      title,
      style: TextStyle(
        fontFamily: 'NotoSansKR',
        color: black,
        fontSize: 14,
        fontWeight: FontWeight.w700,
        fontStyle: FontStyle.normal,
      ),
    );
  }

  Widget findPostButton() {
    return Container(
      height: 48,
      width: 200,
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(primaryColor)),
        onPressed: () async {
          var value = await Get.to(() => AddressSearchPage());
          if (value != null) {
            Map<String, dynamic> value2 = json.decode(value);
            if (value2['zonecode'] != null && value2['zonecode'] != '') {
              postNumber = value2['zonecode'].toString();
            }
            setState(() {
              _controller2.text = value2['address'];
              _controller3.text =
                  value2['buildingName'] != '' ? value2['buildingName'] : '';
              // _controller1.text = value.bname.toString();
              // _controller1.text = value.bname.toString();
            });
          }
        },
        child: Text(
          '주소찾기',
          style: TextStyle(
            fontFamily: 'NotoSansKR',
            color: white,
            fontSize: 13,
            fontWeight: FontWeight.w700,
            fontStyle: FontStyle.normal,
          ),
        ),
      ),
    );
  }

  void isSavePost(context) async {
    await showAnimatedDialog(
      context: context,
      barrierDismissible: true,
      animationType: DialogTransitionType.fade,
      curve: Curves.fastOutSlowIn,
      // duration: Duration(seconds: 1),
      builder: (BuildContext context) {
        return PlinicDialogTwoButton(
          button1Text: '아니요',
          button2Text: '취소할께요',
          title: '알림',
          content: '이전화면으로 이동시\n입력내용이 저장되지 않습니다.\n배송지 등록을 취소하시겠습니까?',
          button1Click: () {
            // Get.back();
            Get.back();
          },
          button2Click: () {
            Get.back();
            Get.back();
          },
        );
      },
    );
  }

  void checkForm() {
    if (_controller1.text != '' &&
        _controller2.text != '' &&
        _controller3.text != '' &&
        _maskedTextController.text != '') {
      setState(() {
        isBtnCheck = true;
      });
    }
  }
}
