import 'dart:developer';
import 'package:getwork/app/modules/auth/login/views/login_view.dart';
import 'package:getwork/app/modules/auth/otp/views/otp_view.dart';
import 'package:getwork/app/utils/colors.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:getwork/app/modules/auth/sign_up/model/signup_model.dart';

class SignUpController extends GetxController {
  var isPasswordHidden = true.obs;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  dynamic statusCode;

  void createAccountClick() {
    if (formKey.currentState!.validate()) {
      if (passwordController.text != confirmPasswordController.text) {
        Get.showSnackbar(
          GetSnackBar(
            message: "Password do not match",
            backgroundColor: errorColor,
            duration: const Duration(seconds: 3),
            snackStyle: SnackStyle.FLOATING,
          ),
        );
      } else {
        postData(
          name: nameController.text,
          email: emailController.text,
          password: passwordController.text,
          userType: 'employee',
        );
      }
    }
  }

  void loginClick() {
    Get.off(() => LoginView());
  }


  Future<SignupModel?> postData({
    required String name,
    required String email,
    required String password,
    required String userType,
  }) async {
    try {
      final SignupModel signupModel = SignupModel(
        name: name,
        email: email,
        password: password,
        userType: userType,
      );
      final request = await http.post(
          Uri.parse(
            'http://10.0.2.2:3001/api/register',
          ),
          body: signupModel.toJson());
      statusCode = request.statusCode;
      if (request.statusCode == 200) {
        log(request.body.toString());
        Get.showSnackbar(
          GetSnackBar(
            message: "Otp send successfully",
            backgroundColor: greenColor,
            duration: const Duration(seconds: 3),
            snackStyle: SnackStyle.FLOATING,
          ),
        );
        Get.to(() => OtpView());
      }
      if (request.statusCode == 404) {
        // Get.snackbar(
        //   'Alert',
        //   'Email already in use !',
        // );
        Get.showSnackbar(
          GetSnackBar(
            message: "Email already in use",
            backgroundColor: errorColor,
            duration: const Duration(seconds: 3),
            snackStyle: SnackStyle.FLOATING,
          ),
        );
      }
      log(request.statusCode.toString());
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}
