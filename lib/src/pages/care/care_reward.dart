import 'dart:convert';

import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:group_button/group_button.dart';
import 'package:line_icons/line_icons.dart';
import 'package:plinic2/constants.dart';
import 'package:plinic2/src/component/custom_appbar.dart';
import 'dart:ui' as ui;

import 'package:plinic2/src/pages/my/address/address_search.dart';

class CareRewardPage extends StatefulWidget {
  CareRewardPage({Key? key}) : super(key: key);

  @override
  State<CareRewardPage> createState() => _CareRewardPageState();
}

class _CareRewardPageState extends State<CareRewardPage> {
  ui.Image? image;
  bool isBtnCheck = false;
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  final TextEditingController _controller3 = TextEditingController();
  final TextEditingController _controller4 = TextEditingController();
  final MaskedTextController _maskedTextController =
      MaskedTextController(mask: '000-0000-0000');

  @override
  Widget build(BuildContext context) {
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

    Widget findPostButton() {
      return Container(
        height: 48,
        child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(primaryColor)),
          onPressed: () async {
            var value = await Get.to(() => AddressSearchPage());
            if (value != null) {
              Map<String, dynamic> value2 = json.decode(value);
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
            '??????????????????',
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

    return Scaffold(
      backgroundColor: white,
      appBar: CustomAppbar('?????? ????????????'),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: spacing_xl),
              Container(
                padding:
                    EdgeInsets.only(bottom: Get.mediaQuery.viewInsets.bottom),
                child: Column(
                  // controller: controller,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: spacing_xl),
                          child: Container(
                            width: Get.mediaQuery.size.width,
                            child: Text(
                              '???????????? ?????? ???????????? ????????? ?????? ?????? ???????????? ????????? ?????????.(???????????? ????????? ???????????? ?????? ???????????? ?????? ??????????????? ????????? ?????????.)',
                              style: TextStyle(
                                fontFamily: 'NotoSansKR',
                                color: grey_1,
                                fontSize: 12,
                                height: 1.63,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: spacing_xl),
                        Container(
                          width: Get.mediaQuery.size.width,
                          height: 48,
                          color: grey_3,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: spacing_xl),
                            child: Row(
                              children: [
                                Text('??????',
                                    style: TextStyle(
                                      fontFamily: 'NotoSansKR',
                                      color: Color(0xff000000),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                      fontStyle: FontStyle.normal,
                                    ))
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: spacing_l),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: spacing_xl),
                          child: Row(
                            children: [
                              Image.asset('assets/images/care/image-45.png'),
                              SizedBox(width: spacing_m),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('????????? ???????????? SET',
                                      style: TextStyle(
                                        fontFamily: 'NotoSansKR',
                                        color: Color(0xff000000),
                                        fontSize: 14,
                                        height: 1.64,
                                        fontWeight: FontWeight.w700,
                                        fontStyle: FontStyle.normal,
                                      )),
                                  SizedBox(height: spacing_xxs),
                                  Text('(???????????? 10??? ?????? ??????)',
                                      style: TextStyle(
                                        fontFamily: 'NotoSansKR',
                                        color: grey_1,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        fontStyle: FontStyle.normal,
                                      ))
                                ],
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: spacing_xxl2),
                        Container(
                          width: Get.mediaQuery.size.width,
                          height: 48,
                          color: grey_3,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: spacing_xl),
                            child: Row(
                              children: [
                                Text('???????????????',
                                    style: TextStyle(
                                      fontFamily: 'NotoSansKR',
                                      color: Color(0xff000000),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                      fontStyle: FontStyle.normal,
                                    ))
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: spacing_xxl2),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: spacing_xl),
                          child: Row(
                            children: [
                              GroupButton(
                                isRadio: true,
                                spacing: 10,
                                borderRadius: BorderRadius.circular(4),
                                selectedColor: primary,
                                selectedTextStyle: TextStyle(
                                  fontFamily: 'NotoSansKR',
                                  color: white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                ),
                                unselectedTextStyle: TextStyle(
                                  fontFamily: 'NotoSansKR',
                                  color: grey_1,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                ),
                                unselectedBorderColor: grey_3,
                                selectedShadow: [],
                                unselectedShadow: [],
                                onSelected: (index, isSelected) =>
                                    print('$index button is selected'),
                                buttons: [
                                  '???????????????',
                                  '?????????',
                                  '??????',
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: spacing_xxl2),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: spacing_xl),
                          alignment: Alignment.centerLeft,
                          child: Text('????????????',
                              style: TextStyle(
                                fontFamily: 'NotoSansKR',
                                color: black,
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                fontStyle: FontStyle.normal,
                              )),
                        ),
                        SizedBox(height: spacing_s),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: spacing_xl),
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
                                hintText: '????????????',
                                hintStyle: TextStyle(
                                  fontFamily: 'NotoSansKR',
                                  color: black,
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
                          padding: const EdgeInsets.symmetric(
                              horizontal: spacing_xl),
                          child: Row(
                            children: [
                              Text('??????',
                                  style: TextStyle(
                                    fontFamily: 'NotoSansKR',
                                    color: black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                    fontStyle: FontStyle.normal,
                                  ))
                            ],
                          ),
                        ),
                        SizedBox(height: spacing_xs),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: spacing_xl),
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
                                    decoration: InputDecoration(
                                        contentPadding: EdgeInsets.all(8),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: grey_2, width: 0.5),
                                        ),
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.red, width: 1)),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: grey_1, width: 0.5),
                                        ),
                                        hintText: '????????? ???????????????',
                                        hintStyle: TextStyle(
                                          fontFamily: 'NotoSansKR',
                                          color: grey_2,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          fontStyle: FontStyle.normal,
                                        ),
                                        filled: true,
                                        fillColor: grey_3,
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
                        SizedBox(height: spacing_xxs),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: spacing_xl),
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
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.all(8),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: grey_2, width: 0.5),
                                      ),
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.red, width: 1)),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: grey_1, width: 0.5),
                                      ),
                                      hintText: '??????????????? ???????????????',
                                      hintStyle: TextStyle(
                                        fontFamily: 'NotoSansKR',
                                        color: grey_2,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        fontStyle: FontStyle.normal,
                                      ),
                                      filled: true,
                                      fillColor: grey_3,
                                      // enabled: false,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: spacing_xl),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: spacing_xl),
                          child: Row(
                            children: [
                              Text('?????????',
                                  style: TextStyle(
                                    fontFamily: 'NotoSansKR',
                                    color: black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                    fontStyle: FontStyle.normal,
                                  ))
                            ],
                          ),
                        ),
                        SizedBox(height: spacing_s),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: spacing_xl),
                          child: TextField(
                            controller: _maskedTextController,
                            textAlignVertical: TextAlignVertical.center,
                            keyboardType: TextInputType.number,
                            onChanged: (value) {
                              checkForm();
                            },
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(8),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: grey_2, width: 0.5),
                              ),
                              border: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.red, width: 1)),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: grey_1, width: 0.5),
                              ),
                              hintText: '????????????',
                              hintStyle: TextStyle(
                                fontFamily: 'NotoSansKR',
                                color: black,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: spacing_xl),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: spacing_xl),
                          child: Row(
                            children: [
                              Text('???????????????',
                                  style: TextStyle(
                                    fontFamily: 'NotoSansKR',
                                    color: black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                    fontStyle: FontStyle.normal,
                                  ))
                            ],
                          ),
                        ),
                        SizedBox(height: spacing_s),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: spacing_xl),
                          child: TextField(
                            controller: _controller4,
                            textAlignVertical: TextAlignVertical.center,
                            // keyboardType: TextInputType.number,
                            onChanged: (value) {
                              checkForm();
                            },
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(8),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: grey_2, width: 0.5),
                              ),
                              border: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.red, width: 1)),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: grey_1, width: 0.5),
                              ),
                              hintText: '????????? ??????????????? ???????????????',
                              hintStyle: TextStyle(
                                fontFamily: 'NotoSansKR',
                                color: black,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: spacing_xl),
                        ConstrainedBox(
                          constraints: BoxConstraints.tightFor(
                              width: Get.mediaQuery.size.width, height: 59),
                          child: ElevatedButton(
                            style: ButtonStyle(
                              side: MaterialStateProperty.all(
                                  BorderSide(color: grey_2)),
                              // shape: MaterialStateProperty.all(
                              //     RoundedRectangleBorder(borderRadius: BorderRadius.zero)),
                              elevation: MaterialStateProperty.all(0.0),
                              backgroundColor:
                                  MaterialStateProperty.resolveWith<Color>(
                                      (Set<MaterialState> states) {
                                if (states.contains(MaterialState.pressed)) {
                                  return Colors.grey.shade200;
                                }
                                return primary;
                              }),
                            ),
                            onPressed: () {
                              Get.back();
                            },
                            child: Text('????????????',
                                style: TextStyle(
                                  fontFamily: 'NotoSansKR',
                                  fontSize: 16,
                                  color: white,
                                  fontWeight: FontWeight.w700,
                                  fontStyle: FontStyle.normal,
                                )),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
