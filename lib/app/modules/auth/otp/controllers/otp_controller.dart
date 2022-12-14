import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:getwork/app/common/widgets/custom_snackbar.dart';
import 'package:getwork/app/modules/auth/login/controllers/login_controller.dart';
import 'package:getwork/app/modules/auth/otp/api/otp_api.dart';
import 'package:getwork/app/modules/auth/otp/model/otp_model.dart';
import 'package:getwork/app/modules/auth/sign_up/controllers/sign_up_controller.dart';

class OtpController extends GetxController {
  final TextEditingController otpTextController = TextEditingController();

  SignUpController signUpController = Get.find<SignUpController>();
  final loginController = Get.put(LoginController());

  void verifyOtp() {
    if (otpTextController.text.isEmpty) {

      CustomSnackBar.showErrorSnackBar(
        message: 'Please enter otp',
      );
    } else {
      verification();
    }
  }

  String? tokenId;

  void verification() async {
    OTPModel? response = await OtpAPI().postData(
      signUpController.id,
      otpTextController.text,
    );
    if (response != null) {
      tokenId = response.token;
    }
    tokenSaving();
  }

  Future<void> tokenSaving() async {
    final storage = FlutterSecureStorage();
    await storage.write(key: 'token', value: tokenId);
    loginController.setIsLoggedIn(true);
  }
}
