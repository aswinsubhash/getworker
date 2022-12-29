import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:getwork/app/common/widgets/custom_snackbar.dart';
import 'package:getwork/app/modules/auth/login/controllers/login_controller.dart';
import 'package:getwork/app/modules/auth/login/views/login_view.dart';
import 'package:http/http.dart' as http;

class ForgotPasswordAPI {
  final loginController = Get.put(LoginController());
  Future patchData(String otp, String newPassword, String email) async {
    final url = Uri.parse('http://10.0.2.2:3001/api/forgotPasswordVerify');
    var hearders = {'Content-Type': 'application/json'};
    Map<String, dynamic> requestBody = {
      "email": email,
      "otp": otp,
      "password": newPassword
    };

    try {
      loginController.showLoading();
      await Future.delayed(Duration(seconds: 2));
      http.Response response = await http.patch(
        url,
        headers: hearders,
        body: jsonEncode(requestBody),
      );
      loginController.hideLoading();
      var valid = response.body;
      log(valid);

      if (valid == '"success"') {
        CustomSnackBar.showSuccessSnackBar(
          message: 'Password changed successfully',
        );
        Get.offAll(() => LoginView());
      } else {
        log(valid);

        CustomSnackBar.showErrorSnackBar(
          message: 'Invalid otp',
        );
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
