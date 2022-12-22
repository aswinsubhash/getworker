import 'dart:convert';
import 'dart:developer';
import 'package:getwork/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:getwork/app/modules/dashboard/views/dashboard_view.dart';
import 'package:getwork/app/utils/colors.dart';
import 'package:http/http.dart' as http;
import 'package:getwork/app/modules/auth/otp/model/otp_model.dart';
import 'package:get/get.dart';

class OtpAPI {
  final url = Uri.parse('http://10.0.2.2:3001/api/verify-email');
  var hearders = {'Content-Type': 'application/json'};

  Future<OTPModel?> postData(String? userId, String otp) async {
    Map<String, dynamic> requestBody = {
      "userId": userId,
      "otp": otp,
      "userType": "employee"
    };

    try {
      http.Response response = await http.post(url,
          headers: hearders, body: jsonEncode(requestBody));
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        log('sign up sucess');
        log(response.body);

        OTPModel otpModel = OTPModel.fromJson(json);
        Get.lazyPut<DashboardController>(() => DashboardController());
        Get.offAll(() => DashboardView());

        Get.snackbar(
          'Welcome to GETWORKER',
          otpModel.name!,
          backgroundColor: greenColor,
          colorText: whiteColor,
        );

        return otpModel;
      } else if (response.statusCode == 500) {
        Get.showSnackbar(
          const GetSnackBar(
            message: "Invalid otp",
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
