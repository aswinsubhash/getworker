import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:getwork/app/modules/auth/login/model/login_model.dart';
import 'package:getwork/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:getwork/app/modules/dashboard/views/dashboard_view.dart';
import 'package:getwork/app/utils/colors.dart';
import 'package:http/http.dart' as http;

class LoginAPI {
  final url = Uri.parse('http://10.0.2.2:3001/api/login');
  var hearders = {'Content-Type': 'application/json'};

  Future<LoginModel?> postData(String email, String password) async {
    Map<String, dynamic> requestBody = {
      "email": email,
      "password": password,
    };

    try {
      http.Response response = await http.post(
        url,
        headers: hearders,
        body: jsonEncode(requestBody),
      );
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        log(response.body);

        LoginModel loginModel = LoginModel.fromJson(json);
        Get.lazyPut<DashboardController>(() => DashboardController());
        Get.offAll(() => DashboardView());

        Get.snackbar(
          'Welcome to GETWORKER',
          loginModel.name!,
          backgroundColor: greenColor,
          colorText: whiteColor,
        );
        log(loginModel.token!);
        return loginModel;
      } else if (response.statusCode == 404) {
        Get.showSnackbar(
          const GetSnackBar(
            message: "Email or Password incorrect",
            backgroundColor: errorColor,
            duration: Duration(seconds: 3),
            snackStyle: SnackStyle.FLOATING,
          ),
        );
      } else {
        log(response.statusCode.toString());
        log(response.body);
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}
