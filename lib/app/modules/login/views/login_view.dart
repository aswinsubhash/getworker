import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwork/app/common/widgets/common_widgets.dart';
import 'package:getwork/app/common/widgets/custom_button.dart';
import 'package:getwork/app/common/widgets/text_field_widget.dart';
import 'package:getwork/app/modules/login/views/widgets/password_textfield.dart';
import 'package:getwork/app/modules/sign_up/model/signup_model.dart';
import 'package:getwork/app/utils/colors.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final loginController = Get.put(LoginController());
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: whiteColor,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  'GETWORKER',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 30,
                    color: Color.fromRGBO(60, 207, 78, 1.0),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                commonSizedBox(10),
                Text(
                  'Log In to Getworker',
                  style: TextStyle(
                      fontSize: 18.5,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Poppins'),
                ),
                Form(
                  key: loginController.formKey,
                  child: Column(
                    children: [
                      commonSizedBox(20),
                      TextFieldWidget(
                        height: 75,
                        width: size.width * 0.9,
                        hintText: 'Enter your email',
                        controller: loginController.emailController,
                        validationMessage: 'Please enter email',
                      ),
                      PasswordLoginTextField(
                        hintText: 'Enter your password',
                        validationMessage: 'Please enter password',
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 17),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            InkWell(
                              onTap: () {},
                              child: Text(
                                'Forgot Password?',
                                style: TextStyle(color: signUpColor),
                              ),
                            )
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
                    text: 'Log In',
                    onPressed: loginController.onLoginClick,
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
