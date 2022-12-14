import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwork/app/common/widgets/common_widgets.dart';
import 'package:getwork/app/common/widgets/custom_button.dart';
import 'package:getwork/app/modules/login/views/widgets/googl_button.dart';
import 'package:getwork/app/modules/login/views/widgets/text_field_widget.dart';
import 'package:getwork/app/utils/colors.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final loginController = Get.put(LoginController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: whiteColor,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: blackColor,
            size: 16,
          ),
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: whiteColor,
        child: SingleChildScrollView(
          child: Column(
            children: [
              commonSizedBox(MediaQuery.of(context).size.height * 0.1),
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
                child: Column(
                  children: [
                    commonSizedBox(20),
                    TextFieldWidget(
                      height: 50,
                      width: 350,
                      hintText: 'Enter your email',
                      obscureCondition: false,
                    ),
                    commonSizedBox(20),
                    TextFieldWidget(
                      height: 50,
                      width: 350,
                      hintText: 'Enter your password',
                      obscureCondition: true,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'Forgot Password?',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: signUpColor,
                            ),
                          ),
                        ),
                        commonWidthBox(12)
                      ],
                    ),
                  ],
                ),
              ),
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
              commonSizedBox(20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  children: [
                    commonDivider(1),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        'or',
                        style: TextStyle(
                          color: textFieldColor,
                        ),
                      ),
                    ),
                    commonDivider(1),
                  ],
                ),
              ),
              commonSizedBox(20),
              SizedBox(
                width: size.width * 0.9,
                child: GoogleButtonWidget(
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
