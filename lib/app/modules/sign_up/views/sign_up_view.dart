import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwork/app/common/widgets/common_widgets.dart';
import 'package:getwork/app/common/widgets/custom_button.dart';
import 'package:getwork/app/common/widgets/text_field_widget.dart';
import 'package:getwork/app/modules/sign_up/views/widget/password_textfield_signup.dart';
import 'package:getwork/app/utils/colors.dart';
import '../controllers/sign_up_controller.dart';

class SignUpView extends GetView<SignUpController> {
  @override
  Widget build(BuildContext context) {
    final signUpController = Get.put(SignUpController());
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: whiteColor,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                commonSizedBox(size.height * 0.1),
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
                  'Sign up to find work you love',
                  style: TextStyle(
                    fontSize: 18.5,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Poppins',
                  ),
                ),
                Form(
                  child: Column(
                    children: [
                      commonSizedBox(20),
                      TextFieldWidget(
                        height: 50,
                        width: size.width * 0.9,
                        hintText: 'Username',
                      ),
                      commonSizedBox(20),
                      TextFieldWidget(
                        height: 50,
                        width: size.width * 0.9,
                        hintText: 'Email',
                      ),
                      commonSizedBox(20),
                      PasswordTextField(
                        hintText: 'Password',
                      ),
                      commonSizedBox(20),
                      PasswordTextField(hintText: 'Confirm Password'),
                      commonSizedBox(20),
                      SizedBox(
                        width: size.width * 0.9,
                        child: CustomButton(
                          text: 'Sign Up',
                          onPressed: () {},
                          textColor: whiteColor,
                          buttonColor: greenColor,
                          radius: 30,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Already have an account?'),
                          TextButton(
                            onPressed: signUpController.loginClick,
                            child: Text(
                              'Login',
                              style: TextStyle(color: signUpColor),
                            ),
                            style: TextButton.styleFrom(
                              minimumSize: Size.zero,
                              padding: EdgeInsets.zero,
                            ),
                          )
                        ],
                      )
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
