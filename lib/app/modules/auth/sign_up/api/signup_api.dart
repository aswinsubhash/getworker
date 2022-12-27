import 'dart:convert';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:getwork/app/common/widgets/custom_snackbar.dart';
import 'package:getwork/app/modules/auth/login/controllers/login_controller.dart';
import 'package:getwork/app/modules/auth/otp/views/otp_view.dart';
import 'package:http/http.dart' as http;
import 'package:getwork/app/modules/auth/sign_up/model/signup_model.dart';

class SignupAPI {
  final loginController = Get.put(LoginController());
  Future<SignupModel?> postData(
      String name, String email, String password) async {
    // Define the URL for the POST request
    final url = Uri.parse('http://10.0.2.2:3001/api/register');

    // Define the headers for the request
    var headers = {'Content-Type': 'application/json'};

    // Create the request body as a map with "name", "email", "password", and "userType" fields
    Map<String, dynamic> requestBody = {
      "name": name,
      "email": email,
      "password": password,
      "userType": "employee"
    };

    try {
      // Make the POST request
      loginController.showLoading();
      await Future.delayed(Duration(seconds: 2));
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

        // Use the JSON object to create an instance of SignupModel
        SignupModel signupResponseModel = SignupModel.fromJson(json);

        // Display a snackbar message indicating that an OTP has been sent successfully
        // Navigate to a new screen
        Get.to(() => OtpView());

        CustomSnackBar.showSuccessSnackBar(
          message: 'Otp send successfully',
        );

        // Return the SignupModel instance
        return signupResponseModel;
      } else if (response.statusCode == 404) {
        // If the status code is 404, display a snackbar message indicating that the provided email is already in use

        CustomSnackBar.showErrorSnackBar(
          message: 'Email already in use',
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
