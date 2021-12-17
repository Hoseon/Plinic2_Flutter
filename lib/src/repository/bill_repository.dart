import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class billRepository extends GetxService {
  Future<bool> billCreate(Map<String, dynamic> data) async {
    var url = Uri.parse('https://example.com/whatsit/create');
    var response =
        await http.post(url, body: {'name': 'doodle', 'color': 'blue'});
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    return true;
  }
}
