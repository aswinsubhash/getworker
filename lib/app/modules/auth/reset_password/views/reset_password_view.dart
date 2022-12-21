import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getwork/app/common/widgets/common_widgets.dart';
import 'package:getwork/app/common/widgets/custom_button.dart';
import 'package:getwork/app/common/widgets/text_field_widget.dart';
import 'package:getwork/app/utils/colors.dart';

import '../controllers/reset_password_controller.dart';

class ResetPasswordView extends GetView {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final resetPasswordController = Get.put(ResetPasswordController());
    return Scaffold(
      backgroundColor: whiteColor,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/login.png"),
            opacity: 0.1,
            fit: BoxFit.contain,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  'Reset Password',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Poppins',
                  ),
                ),
                commonSizedBox(20),
                TextFieldWidget(
                  height: 75,
                  width: size.width * 0.9,
                  hintText: 'Enter old password',
                  controller: resetPasswordController.oldPasswordController,
                ),
                TextFieldWidget(
                  height: 75,
                  width: size.width * 0.9,
                  hintText: 'Enter new password',
                  controller: resetPasswordController.oldPasswordController,
                ),
                SizedBox(
                  width: size.width * 0.9,
                  child: CustomButton(
                    text: 'Verify',
                    onPressed: () {},
                    textColor: whiteColor,
                    buttonColor: greenColor,
                    radius: 30,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
