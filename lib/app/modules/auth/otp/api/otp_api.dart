import 'dart:convert';
import 'dart:developer';
import 'package:getwork/app/common/widgets/custom_snackbar.dart';
import 'package:getwork/app/modules/auth/login/controllers/login_controller.dart';
import 'package:getwork/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:getwork/app/modules/dashboard/views/dashboard_view.dart';
import 'package:http/http.dart' as http;
import 'package:getwork/app/modules/auth/otp/model/otp_model.dart';
import 'package:get/get.dart';

class OtpAPI {
  final loginController = Get.put(LoginController());
  Future<OTPModel?> postData(String? userId, String otp) async {
    // Define the URL for the POST request
    final url = Uri.parse('http://10.0.2.2:3001/api/verify-email');

    // Define the headers for the request
    var headers = {'Content-Type': 'application/json'};

    // Create the request body as a map with "userId", "otp", and "userType" fields
    Map<String, dynamic> requestBody = {
      "userId": userId,
      "otp": otp,
      "userType": "employee"
    };

    try {
      // Make the POST request
      loginController.showLoading();
      http.Response response = await http.post(
        url,
        headers: headers,
        body: jsonEncode(requestBody),
      );
      loginController.hideLoading();

      // Check the response status code
      if (response.statusCode == 200) {
        // If the status code is 200, decode the response body as a JSON object
        final json = jsonDecode(response.body);

        // Use the JSON object to create an instance of OTPModel
        OTPModel otpModel = OTPModel.fromJson(json);

        // Display a snackbar message with a welcome message and the user's name
        // Navigate to a new screen
        Get.lazyPut<DashboardController>(() => DashboardController());
        Get.offAll(() => DashboardView());

        CustomSnackBar.welcomeSnackBar(
          message: otpModel.name!,
        );

        // Return the OTPModel instance
        return otpModel;
      } else if (response.statusCode == 500) {
        // If the status code is 500, display a snackbar message indicating that the OTP is invalid
        print(response.statusCode);
        CustomSnackBar.showErrorSnackBar(
          message: 'Invalid otp',
        );
      } else {
        // If the status code is anything else, log the status code and the response body
        log(response.statusCode.toString());
        log(response.body);
      }
    } catch (e) {
      // If there is an error while making the HTTP request, log it
      log(e.toString());
    }

    // If the function reaches this point, return null
    return null;
  }
}
