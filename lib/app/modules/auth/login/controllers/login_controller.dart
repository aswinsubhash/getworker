import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:getwork/app/modules/auth/login/api/login_api.dart';
import 'package:getwork/app/modules/auth/reset_password/views/reset_password_view.dart';
import 'package:getwork/app/modules/auth/sign_up/views/sign_up_view.dart';

class LoginController extends GetxController {
  var isPasswordHidden = true.obs;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKeyLogin = GlobalKey<FormState>();
  LoginAPI api = LoginAPI();

  void onLoginClick() {
    if (formKeyLogin.currentState!.validate()) {
      api.postData(
        emailController.text,
        passwordController.text,
      );
    }
  }

  void forgotPasswordClick() {
    Get.to(() => ResetPasswordView());
  }

  void onSignUpClick() {
    Get.off(() => SignUpView());
  }
}
