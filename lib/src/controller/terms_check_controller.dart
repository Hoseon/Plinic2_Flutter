import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class TermsCheckController extends GetxController {
  static TermsCheckController get to => Get.find();
  RxBool allCheck = false.obs; //약관 모두 동의
  RxBool check1 = false.obs;
  RxBool check2 = false.obs;
  RxBool check3 = false.obs;
  RxBool check4 = false.obs;
  RxBool check5 = false.obs;
  RxBool isMan = false.obs; //여자로 초기값 설정

  var textController1 = TextEditingController().text.obs;
  var textController2 = TextEditingController().text.obs;

  Rx<TextEditingController> controller1 = TextEditingController().obs;
  Rx<TextEditingController> controller2 = TextEditingController().obs;

  void CheckAll(value) {
    //모두 동의 했을때 토글
    allCheck(!value);
    check1(!value);
    check2(!value);
    check3(!value);
    check4(!value);
    check5(!value);
  }

  void toggleCheck1(value) {
    check1(!value);
  }

  void toggleCheck2(value) {
    check2(!value);
  }

  void toggleCheck3(value) {
    check3(!value);
  }

  void toggleCheck4(value) {
    check4(!value);
  }

  void toggleCheck5(value) {
    check5(!value);
  }

  void toggleGender(value) {
    isMan(!value);
    print(isMan);
  }

  void setYear(value) {
    textController1(value);
    controller1.value.text = textController1.value;
  }

  void setMonth(value) {
    textController2(value);
    controller2.value.text = textController2.value;
  }
}
