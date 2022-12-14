import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwork/app/common/widgets/common_widgets.dart';
import 'package:getwork/app/common/widgets/custom_button.dart';
import 'package:getwork/app/common/widgets/text_field_widget.dart';
import 'package:getwork/app/utils/colors.dart';
import 'package:getwork/app/utils/app_styles.dart';

import '../controllers/otp_controller.dart';

class OtpView extends GetView {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final otpController = Get.put(OtpController());
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: AppStyle.backgroundImage,
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                    'Verify Email',
                    style: AppStyle.resetAndOtpStyle
                  ),
                  commonSizedBox(20),
                  TextFieldWidget(
                    height: 75,
                    width: size.width * 0.9,
                    hintText: 'Enter OTP',
                    controller: otpController.otpTextController,
                  ),
                  SizedBox(
                    width: size.width * 0.9,
                    child: CustomButton(
                      text: 'Verify',
                      onPressed: otpController.verifyOtp,
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
