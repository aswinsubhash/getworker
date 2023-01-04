import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:getwork/app/common/widgets/custom_snackbar.dart';
import 'package:getwork/app/modules/auth/forgot_password/views/forgot_password_view.dart';
import 'package:getwork/app/modules/auth/login/controllers/login_controller.dart';
import 'package:getwork/app/modules/auth/login/model/login_model.dart';
import 'package:getwork/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:getwork/app/modules/dashboard/views/dashboard_view.dart';
import 'package:http/http.dart' as http;

class LoginAPI {
  final loginController = Get.put(LoginController());
  // Login api call
  Future<LoginModel?> postData(String email, String password) async {
    // URL for the login endpoint
    final url = Uri.parse('http://10.0.2.2:3001/api/login');
    // Headers for the request
    var headers = {'Content-Type': 'application/json'};
    // Body for the request, containing the email and password
    Map<String, dynamic> requestBody = {
      "email": email,
      "password": password,
    };

    try {
      // Send POST request to the login endpoint

      loginController.showLoading();
      await Future.delayed(Duration(seconds: 2));
      http.Response response = await http.post(
        url,
        headers: headers,
        body: jsonEncode(requestBody),
      );
      loginController.hideLoading();
      // If the request was successful (status code 200)
      if (response.statusCode == 200) {
        // Create a LoginModel object from the JSON
        LoginModel loginModel = LoginModel.fromJson(jsonDecode(response.body));
        // Initialize the DashboardController
        Get.lazyPut<DashboardController>(() => DashboardController());
        // Navigate to the DashboardView
        Get.offAll(() => DashboardView());

        // Display a welcome snackbar

        CustomSnackBar.welcomeSnackBar(
          message: loginModel.name!,
        );

        return loginModel;
      }
      // If the email or password was incorrect (status code 404)
      else if (response.statusCode == 404) {
        // Display an error snackbar

        CustomSnackBar.showErrorSnackBar(
          message: 'Email or Password incorrect',
        );
      }
      // If the request returned any other status code
      else {
        // Log the status code and response body to the console
        log(response.statusCode.toString());
        log(response.body);
      }
    }
    // If there was an exception thrown while making the request
    catch (e) {
      // Log the exception message to the console
      log(e.toString());
    }
    return null;
  }

//forgot password api call
  Future patchData(String email) async {
    // Define the URL for the PATCH request
    final url = Uri.parse('http://10.0.2.2:3001/api/forgotPassword');

    // Define the headers for the request
    var headers = {'Content-Type': 'application/json'};

    // Create the request body as a map with an "email" field
    Map<String, dynamic> requestBody = {
      "email": email,
    };

    try {
      // Make the PATCH request

      loginController.showLoading();
      await Future.delayed(Duration(seconds: 2));
      http.Response response = await http.patch(
        url,
        headers: headers,
        body: jsonEncode(requestBody),
      );
      loginController.hideLoading();
      // Get the response body
      var valid = response.body;

      // Check if the response body is the string "Success"
      if (valid == '"Success"') {
        // Display a snackbar message indicating that an OTP has been sent to the provided email address
        // and navigate to a new screen

        CustomSnackBar.showSuccessSnackBar(
          message: 'Otp send to your email',
        );
        Get.to(() => ForgotPasswordView());
      } else {
        // If the response body is not "Success", display a snackbar message indicating that no such user was found

        CustomSnackBar.showErrorSnackBar(
          message: 'No such user found',
        );
      }
    } catch (e) {
      // If there is an error while making the HTTP request, log it
      log(e.toString());
    }
  }
}
