import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getwork/app/common/widgets/common_widgets.dart';
import 'package:getwork/app/common/widgets/custom_button.dart';
import 'package:getwork/app/common/widgets/text_field_widget.dart';
import 'package:getwork/app/utils/app_string.dart';
import 'package:getwork/app/utils/colors.dart';
import 'package:getwork/app/utils/app_styles.dart';

import '../controllers/forgot_password_controller.dart';

class ForgotPasswordView extends GetView {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final forgotPasswordController = Get.put(ForgotPasswordController());
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: AppStyle.backgroundImage, 
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: forgotPasswordController.formKeyForgot,
              child: Column(
                children: [
                  Text(
                    AppString.resetPasswordText,
                    style: AppStyle.resetAndOtpStyle,
                  ),
                  commonSizedBox(20),
                  TextFieldWidget(
                    height: 75,
                    width: size.width * 0.9,
                    hintText: 'Enter otp code',
                    controller: forgotPasswordController.otpController,
                    validationMessage: 'Please enter the otp',
                  ),
                  TextFieldWidget(
                    height: 75,
                    width: size.width * 0.9,
                    hintText: 'Enter new password',
                    controller: forgotPasswordController.newPasswordController,
                    validationMessage: 'Please enter your newpassword',
                  ),
                  SizedBox(
                    width: size.width * 0.9,
                    child: CustomButton(
                      text: 'Verify',
                      onPressed: forgotPasswordController.forgotPassword,
                      textColor: AppColor.whiteColor,
                      buttonColor: AppColor.greenColor,
                      radius: 30,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
