import 'dart:convert';
import 'dart:developer';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:getwork/app/modules/my_dash/model/my_dash_model.dart';
import 'package:http/http.dart' as http;

class MyDashAPI {
  Future<MyDashModel?> getContracts() async {
    final storage = FlutterSecureStorage();
    final token = await storage.read(key: 'token');
    final userId = await storage.read(key: 'userId');
    final url = Uri.parse('http://10.0.2.2:3001/api/employee/profile/$userId');
    var headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };

    try {
      http.Response response = await http.get(
        url,
        headers: headers,
      );

      if (response.statusCode == 200) {
        return MyDashModel.fromJson(jsonDecode(response.body));
      } else {
        log(response.body);
        log(response.statusCode.toString());
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}
