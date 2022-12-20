import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwork/app/common/widgets/common_widgets.dart';
import 'package:getwork/app/common/widgets/custom_button.dart';
import 'package:getwork/app/common/widgets/text_field_widget.dart';
import 'package:getwork/app/utils/colors.dart';

import '../controllers/otp_controller.dart';

class OtpView extends GetView<OtpController> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final otpController = Get.put(OtpController());
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          color: whiteColor,
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Verify Email',
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
                    hintText: 'Enter OTP',
                    controller: otpController.otpTextController,
                    validationMessage: 'This field is empty',
                  ),
                  SizedBox(
                    width: size.width * 0.9,
                    child: CustomButton(
                      text: 'Verify',
                      onPressed: otpController.verifyOtp,
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
      ),
    );
  }
}
