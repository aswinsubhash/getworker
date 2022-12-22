import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:getwork/app/modules/auth/login/api/login_api.dart';
import 'package:getwork/app/modules/auth/login/model/login_model.dart';
import 'package:getwork/app/modules/auth/reset_password/views/reset_password_view.dart';
import 'package:getwork/app/modules/auth/sign_up/views/sign_up_view.dart';


class LoginController extends GetxController {
  var isPasswordHidden = true.obs;
  final isLoggedIn = false.obs;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKeyLogin = GlobalKey<FormState>();

  void onLoginClick() {
    if (formKeyLogin.currentState!.validate()) {
      login();
    }
  }

  String? tokenId;

  void login() async {
    LoginModel? response = await LoginAPI().postData(
      emailController.text,
      passwordController.text,
    );
    if (response != null) {
      tokenId = response.token;
    }

    tokenSaving();
    log(tokenId.toString());
  }

  void forgotPasswordClick() {
    Get.to(() => ResetPasswordView());
  }

  void onSignUpClick() {
    Get.off(() => SignUpView());
  }

  void setIsLoggedIn(bool value) {
    isLoggedIn.value = value;
  }

  Future<void> tokenSaving() async {
    final storage = FlutterSecureStorage();
    await storage.write(key: 'token', value: tokenId);
    setIsLoggedIn(true);
  }
}
