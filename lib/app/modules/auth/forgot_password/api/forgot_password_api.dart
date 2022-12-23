import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:getwork/app/modules/auth/login/views/login_view.dart';
import 'package:getwork/app/utils/colors.dart';
import 'package:http/http.dart' as http;

class ForgotPasswordAPI {
  Future patchData(String otp, String newPassword, String email) async {
    final url = Uri.parse('http://10.0.2.2:3001/api/forgotPasswordVerify');
    var hearders = {'Content-Type': 'application/json'};
    Map<String, dynamic> requestBody = {
      "email": email,
      "otp": otp,
      "password": newPassword
    };

    try {
      http.Response response = await http.patch(
        url,
        headers: hearders,
        body: jsonEncode(requestBody),
      );
      var valid = response.body;
      log(valid);
      
      if (valid == '"success"') {
        Get.showSnackbar(
          const GetSnackBar(
            message: "Password changed successfully",
            backgroundColor: greenColor,
            duration: Duration(seconds: 3),
            snackStyle: SnackStyle.FLOATING,
          ),
        );
        Get.offAll(() => LoginView());
      } else {
        log(valid);
        Get.showSnackbar(
          const GetSnackBar(
            message: "Invalid otp",
            backgroundColor: errorColor,
            duration: Duration(seconds: 3),
            snackStyle: SnackStyle.FLOATING,
          ),
        );
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
