import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwork/app/common/widgets/common_rich_text.dart';
import 'package:getwork/app/common/widgets/common_widgets.dart';
import 'package:getwork/app/common/widgets/custom_button.dart';
import 'package:getwork/app/common/widgets/text_field_widget.dart';
import 'package:getwork/app/modules/auth/login/controllers/login_controller.dart';
import 'package:getwork/app/modules/auth/login/views/widgets/password_textfield.dart';
import 'package:getwork/app/utils/app_string.dart';
import 'package:getwork/app/utils/colors.dart';
import 'package:getwork/app/utils/app_styles.dart';

class LoginView extends GetView {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final loginController = Get.put(LoginController());
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
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
                  AppString.loginSubtitle,
                  style: AppStyle.subTextStyle,
                ),
                Form(
                  key: loginController.formKeyLogin,
                  child: Column(
                    children: [
                      commonSizedBox(20),
                      TextFieldWidget(
                        height: 75,
                        width: size.width * 0.9,
                        hintText: 'Enter your email',
                        controller: loginController.emailController,
                        validationMessage: 'Please enter email',
                        checkValidationMessage: 'Please enter a valid email',
                      ),
                      PasswordLoginTextField(
                        hintText: 'Enter your password',
                        validationMessage: 'Please enter password',
                        controller: loginController.passwordController,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 19),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            RichText(
                              text: TextSpan(
                                  text: 'Forgot Password?',
                                  style: TextStyle(
                                    color: AppColor.signUpColor,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap =
                                        loginController.forgotPasswordClick),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                commonSizedBox(15),
                SizedBox(
                  width: size.width * 0.9,
                  child: CustomButton(
                    text: AppString.loginButtonText,
                    onPressed: loginController.onLoginClick,
                    textColor: AppColor.whiteColor,
                    buttonColor: AppColor.greenColor,
                    radius: 30,
                  ),
                ),
                commonSizedBox(20),
                RichTextWidget(
                  text: 'New to Getworker?',
                  clickText: ' Sign Up',
                  onPressed: loginController.onSignUpClick,
                  clickTextColor: AppColor.signUpColor,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
