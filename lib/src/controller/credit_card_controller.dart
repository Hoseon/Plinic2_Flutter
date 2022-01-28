import 'package:get/get.dart';
import 'package:plinic2/src/repository/bill_repository.dart';

class CreditCardController extends GetxController {
  final BillRepository _billRepository = BillRepository();

  RxString cardNumber = ''.obs;
  RxString expireDate = ''.obs;
  RxString expireYear = ''.obs;
  RxString expireMonth = ''.obs;
  RxString identifyNumber = ''.obs;
  RxString pwFront = ''.obs;
  RxString itemName = ''.obs;

  void updateCardNumber(value) {
    print(value.toString().replaceAll(' ', ''));
    cardNumber(value.toString().replaceAll(' ', ''));
  }

  void updateExpireDate(value) {
    expireDate(value);
    print(expireDate);
    if (expireDate.value.length == 5) {
      var month = expireDate.value.substring(0, 2);
      if (month.length == 2) {
        expireMonth(month);
      }
      var year = expireDate.value.substring(3, 5);
      if (year.length == 2) {
        expireYear(year);
      }
    }
  }

  void updateIdentifyNumber(String value) {
    if (value.length == 6) {
      identifyNumber(value);
      // print(identifyNumber.value);
    }
  }

  void updatePwFrton(String value) {
    if (value.length == 2) {
      pwFront(value);
    } else {
      pwFront('');
    }
  }

  Future<bool> createBill(data) async {
    var result = await _billRepository.billCreate(data);
    return result;
  }
}
