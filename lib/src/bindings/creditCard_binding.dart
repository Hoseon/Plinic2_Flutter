import 'package:get/get.dart';
import 'package:plinic2/src/controller/credit_card_controller.dart';

class CreditCardBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<CreditCardController>(CreditCardController());
  }
}
