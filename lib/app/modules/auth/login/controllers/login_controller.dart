import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:getwork/app/modules/auth/login/api/login_api.dart';
import 'package:getwork/app/modules/auth/login/model/login_model.dart';
import 'package:getwork/app/modules/auth/forgot_password/views/forgot_password_view.dart';
import 'package:getwork/app/modules/auth/sign_up/views/sign_up_view.dart';
import 'package:getwork/app/utils/colors.dart';


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
    if(emailController.text.isEmpty){
       Get.showSnackbar(
          const GetSnackBar(
            message: "Enter your email", 
            backgroundColor: errorColor,
            duration: Duration(seconds: 3),
            snackStyle: SnackStyle.FLOATING,
          ),
        );
    }else{
       LoginAPI().patchData(emailController.text);
   
    }
   
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
