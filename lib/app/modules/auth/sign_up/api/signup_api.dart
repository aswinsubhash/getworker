import 'dart:convert';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:getwork/app/modules/auth/otp/views/otp_view.dart';
import 'package:getwork/app/utils/colors.dart';
import 'package:http/http.dart' as http;
import 'package:getwork/app/modules/auth/sign_up/model/signup_model.dart';

//String? id;
class SignupAPI {

  
  final url = Uri.parse('http://10.0.2.2:3001/api/register');
  var hearders = {'Content-Type': 'application/json'};

  Future<SignupModel?> postData(
      String name, String email, String password) async {
    Map<String, dynamic> requestBody = {
      "name": name,
      "email": email,
      "password": password,
      "userType": "employee"
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

        SignupModel signupResponseModel =
            SignupModel.fromJson(json);

            Get.to(()=>OtpView());

        Get.showSnackbar(
          GetSnackBar(
            message: "Otp send successfully",
            backgroundColor: greenColor,
            duration: const Duration(seconds: 3),
            snackStyle: SnackStyle.FLOATING,
          ),
        );
        log(signupResponseModel.email!);
        //storing id to a variable
        // id = signupResponseModel.id;
        // log(id!);
        return signupResponseModel;
      } else if (response.statusCode == 404) {
        Get.showSnackbar(
          GetSnackBar(
            message: "Email already in use",
            backgroundColor: errorColor,
            duration: const Duration(seconds: 3),
            snackStyle: SnackStyle.FLOATING,
          ),
        );
      }else{
        log(response.statusCode.toString());
        log(response.body);
      }
    } catch (e) {
      log(e.toString());
    }

    return null;
  }
}
