import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:getwork/app/modules/auth/login/model/login_model.dart';
import 'package:getwork/app/modules/auth/reset_password/views/reset_password_view.dart';
import 'package:getwork/app/modules/auth/sign_up/views/sign_up_view.dart';
import 'package:getwork/app/modules/dashboard/views/dashboard_view.dart';
import 'package:getwork/app/utils/colors.dart';
import 'package:http/http.dart' as http;

class LoginController extends GetxController {
  var isPasswordHidden = true.obs;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKeyLogin = GlobalKey<FormState>();

  void onLoginClick() {
    if (formKeyLogin.currentState!.validate()) {
      loginFunction(
        email: emailController.text,
        password: passwordController.text,
      );
      Get.off(() => DashboardView());
    }
  }

  void forgotPasswordClick() {
    Get.to(() => ResetPasswordView());
  }

  void onSignUpClick() {
    Get.off(() => SignUpView());
  }

  Future<LoginModel?> loginFunction({
    required String email,
    required String password,
  }) async {
    try {
      LoginModel loginModel = LoginModel(
        email: email,
        password: password,
      );
      final request = await http.post(
          Uri.parse(
            'http://10.0.2.2:3001/api/login',
          ),
          body: loginModel.toJson());
      if (request.statusCode == 200) {
        log(request.body.toString());

        Get.showSnackbar(
          GetSnackBar(
            message: "Login Successful",
            backgroundColor: greenColor,
            duration: const Duration(seconds: 3),
            snackStyle: SnackStyle.FLOATING,
          ),
        );
      }
      if (request.statusCode == 404) {
        Get.showSnackbar(
          GetSnackBar(
            message: "Username or password doesn't match",
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
