import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plinic2/constants.dart';

class PlinicDialogTwoButton extends StatelessWidget {
  final String title, content, button1Text, button2Text;
  final Function()? button1Click;
  final Function()? button2Click;

  const PlinicDialogTwoButton({
    Key? key,
    required this.title,
    required this.content,
    required this.button1Text,
    required this.button2Text,
    this.button1Click,
    this.button2Click,
  }) : super(key: key);

  Widget showDialogTwoButton(BuildContext context, String title, String content,
      String button1Text, String button2Text) {
    return AlertDialog(
      backgroundColor: Colors.white,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(title,
              style: const TextStyle(
                fontFamily: 'NotoSans',
                color: Color(0xff000000),
                fontSize: 20,
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.normal,
              ),
              textAlign: TextAlign.center),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                content,
                style: TextStyle(
                  fontFamily: 'NotoSans',
                  color: grey_1,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                ),
                textAlign: TextAlign.center,
              )
            ],
          ),
          SizedBox(height: 20),
          Center(
            child: ConstrainedBox(
              constraints: BoxConstraints.tightFor(
                  width: Get.mediaQuery.size.width, height: 42),
              child: ElevatedButton(
                style: ButtonStyle(
                  elevation: MaterialStateProperty.all(0.0),
                  backgroundColor: MaterialStateProperty.all(primaryColor),
                ),
                onPressed: button1Click,
                child: Text(button1Text,
                    style: TextStyle(
                      fontFamily: 'NotoSansKR',
                      color: Color(0xffffffff),
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal,
                    )),
              ),
            ),
          ),
          SizedBox(height: 10),
          Center(
            child: ConstrainedBox(
              constraints: BoxConstraints.tightFor(
                  width: Get.mediaQuery.size.width, height: 42),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Color(0x42566789)),
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                child: ElevatedButton(
                  style: ButtonStyle(
                    elevation: MaterialStateProperty.all(0.0),
                    backgroundColor: MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) {
                      if (states.contains(MaterialState.pressed)) {
                        return Colors.grey.shade200;
                      }
                      return Colors.white;
                    }),
                  ),
                  onPressed: button2Click,
                  child: Text(
                    button2Text,
                    style: TextStyle(
                      fontFamily: 'NotoSansKR',
                      color: Color(0x80151920),
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: showDialogTwoButton(
            context, title, content, button1Text, button2Text));
  }
}
