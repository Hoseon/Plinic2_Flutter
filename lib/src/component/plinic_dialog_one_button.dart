import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plinic2/constants.dart';

class PlinicDialogOneButton extends StatelessWidget {
  final String title, content, buttonText;
  final Function()? buttonClick;

  const PlinicDialogOneButton({
    Key? key,
    required this.title,
    required this.content,
    required this.buttonText,
    this.buttonClick,
  }) : super(key: key);

  Widget showDialogOneButton(
      BuildContext context, String title, String content, String buttonText) {
    return AlertDialog(
      backgroundColor: Colors.white,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(title,
              style: const TextStyle(
                  color: Color(0xff000000),
                  fontWeight: FontWeight.w700,
                  fontFamily: 'NotoSansKR',
                  fontStyle: FontStyle.normal,
                  fontSize: 20.0),
              textAlign: TextAlign.center),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                content,
                style: TextStyle(
                  fontFamily: 'NotoSansKR',
                  color: Colors.grey,
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
              // ConstrainedBox(
              //     constraints: BoxConstraints.tightFor(
              //         width: MediaQuery.of(context).size.width * 0.9,
              //         height: 44),
              child: ElevatedButton(
                style: ButtonStyle(
                  elevation: MaterialStateProperty.all(0.0),
                  backgroundColor: MaterialStateProperty.all(primaryColor),
                ),
                onPressed: buttonClick,
                child: Text(buttonText,
                    style: TextStyle(
                      fontFamily: 'NotoSansKR',
                      color: Color(0xffffffff),
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal,
                    )),
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: showDialogOneButton(context, title, content, buttonText));
  }
}
