import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwork/app/common/widgets/common_rich_text.dart';
import 'package:getwork/app/common/widgets/common_widgets.dart';
import 'package:getwork/app/common/widgets/custom_button.dart';
import 'package:getwork/app/common/widgets/text_field_widget.dart';
import 'package:getwork/app/modules/auth/sign_up/views/widget/password_textfield_signup.dart';
import 'package:getwork/app/utils/app_string.dart';
import 'package:getwork/app/utils/colors.dart';
import 'package:getwork/app/utils/app_styles.dart';
import '../controllers/sign_up_controller.dart';

class SignUpView extends GetView {
  @override
  Widget build(BuildContext context) {
    final signUpController = Get.put(SignUpController());

    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: whiteColor,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: AppStyle.backgroundImage,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  AppString.appName,
                  style: AppStyle.logoNameStyle,
                ),
                commonSizedBox(10),
                Text(
                  AppString.signUpSubtitle,
                  style: AppStyle.subTextStyle,
                ),
                Form(
                  key: signUpController.formKey,
                  child: Column(
                    children: [
                      commonSizedBox(20),
                      TextFieldWidget(
                        height: 75,
                        width: size.width * 0.9,
                        hintText: 'Username',
                        controller: signUpController.nameController,
                        validationMessage: 'Please enter username',
                      ),
                      TextFieldWidget(
                        height: 75,
                        width: size.width * 0.9,
                        hintText: 'Email',
                        controller: signUpController.emailController,
                        validationMessage: 'Please enter email',
                        checkValidationMessage: 'Please enter a valid email',
                      ),
                      PasswordTextField(
                        hintText: 'Password',
                        controller: signUpController.passwordController,
                        validationMessage: 'This field is required',
                        minPassText: 'Password must be atleast 6 characters',
                      ),
                      PasswordTextField(
                        hintText: 'Confirm Password',
                        controller: signUpController.confirmPasswordController,
                        validationMessage: 'Please Re-Enter Password',
                      ),
                      commonSizedBox(5),
                      SizedBox(
                        width: size.width * 0.9,
                        child: CustomButton(
                          text: AppString.signupButtonText,
                          onPressed: signUpController.createAccountClick,
                          textColor: whiteColor,
                          buttonColor: greenColor,
                          radius: 30,
                        ),
                      ),
                      commonSizedBox(20),
                      RichTextWidget(
                        text: 'Already have an account?',
                        clickText: ' Login',
                        onPressed: signUpController.loginClick,
                        clickTextColor: signUpColor,
                      ),
                    ],
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
