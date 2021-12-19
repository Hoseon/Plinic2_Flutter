import 'package:dio/dio.dart';
import 'package:get/get.dart';
// import 'package:http/http.dart' as http;

class BillRepository extends GetxService {
  Future<bool> billCreate(Map<String, dynamic> data) async {
    print(data);
    // print(data['cardNo'].toString());
    // print(data['cardPw'].toString());
    // print(data['expireYear'].toString());
    // print(data['expireMonth'].toString());
    // print(data['identifyNumber'].toString());
    // var formData = dio.FormData.fromMap({
    //   'cardNo': data['cardNo'].toString(),
    //   'cardPw': data['cardPw'].toString(),
    //   'expireYear': data['expireYear'].toString(),
    //   'expireMonth': data['expireMonth'].toString(),
    //   'identifyNumber': data['identifyNumber'].toString(),
    // });
    // var dio2 = dio.Dio();

    // try {
    //   var response = await dio2.get('http://www.google.com');
    //   print(response);
    // } catch (e) {
    //   print(e);
    // }
    // var response =
    //     await dio2.post('https://admin.g1p.xyz/api/createBill', data: formData);
    // print(response);

    var dio = Dio(BaseOptions(baseUrl: 'https://admin.g1p.xyz/api'));

    var response = await dio.post('/createBill', data: {
      'cardNo': data['cardNo'].toString(),
      'cardPw': data['cardPw'].toString(),
      'expireYear': data['expireYear'].toString(),
      'expireMonth': data['expireMonth'].toString(),
      'identifyNumber': data['identifyNumber'].toString(),
    });
    print(response.data);
    return true;
  }
}
