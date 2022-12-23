import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwork/app/modules/auth/forgot_password/api/forgot_password_api.dart';
import 'package:getwork/app/modules/auth/login/controllers/login_controller.dart';

class ForgotPasswordController extends GetxController {
  final TextEditingController otpController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
 final GlobalKey<FormState> formKeyForgot = GlobalKey<FormState>();
  final loginController = Get.put(LoginController());

  void forgotPassword() {
    if (formKeyForgot.currentState!.validate()) {
      ForgotPasswordAPI().patchData(
        otpController.text,
        newPasswordController.text,
        loginController.emailController.text,
      );
     
    
    }else{
      log('fill the field');
    }
  }
}
