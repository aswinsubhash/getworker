import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:getwork/app/modules/auth/otp/api/otp_api.dart';
import 'package:getwork/app/modules/auth/otp/model/otp_model.dart';
import 'package:getwork/app/modules/auth/sign_up/controllers/sign_up_controller.dart';
import 'package:getwork/app/utils/colors.dart';

class OtpController extends GetxController {
  final TextEditingController otpTextController = TextEditingController();

  SignUpController signUpController = Get.find<SignUpController>();

  void verifyOtp() {
    if (otpTextController.text.isEmpty) {
      Get.showSnackbar(
        GetSnackBar(
          message: "Please enter otp",
          backgroundColor: errorColor,
          duration: const Duration(seconds: 3),
          snackStyle: SnackStyle.FLOATING,
        ),
      );
    } else {
      verification();
    }
  }

  void verification() async {
    OTPModel? response = await OtpAPI().postData(
      signUpController.id,
      otpTextController.text,
    );
  }
  
}
