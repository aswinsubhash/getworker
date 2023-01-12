import 'dart:convert';
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:getwork/app/common/widgets/custom_bottom_sheet.dart';
import 'package:getwork/app/common/widgets/custom_snackbar.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:getwork/app/modules/profile/model/profile_model.dart';

class ProfileAPI {
  Future<ProfileModel?> getProfile() async {
    final storage = FlutterSecureStorage();
    final token = await storage.read(key: 'token');
    final userId = await storage.read(key: 'userId');
    final url = Uri.parse('http://10.0.2.2:3001/api/employee/profile/$userId');
    print(userId);
    print(token);
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
        return ProfileModel.fromJson(jsonDecode(response.body));
      } else {
        log(response.body);
        log(response.statusCode.toString());
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  Future<PatchMessage?> updateUserInfo(
      String infoTitle, String infoDescription) async {
    final storage = FlutterSecureStorage();
    final token = await storage.read(key: 'token');
    final userId = await storage.read(key: 'userId');
    final url = Uri.parse('http://10.0.2.2:3001/api/employee/editInfo/$userId');

    var headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };

    Map<String, dynamic> requestBody = {
      "title": infoTitle,
      "info": infoDescription
    };

    try {
      http.Response response = await http.patch(
        url,
        headers: headers,
        body: jsonEncode(requestBody),
      );
     // print(response.body);
      if(response.statusCode >= 200 && response.statusCode <= 299){
        return PatchMessage.fromJson(jsonDecode(response.body));
      }else{
        CustomSnackBar.showErrorSnackBar(message: 'Something went wrong');
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}
