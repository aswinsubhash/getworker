import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:getwork/app/modules/auth/otp/model/otp_model.dart';
import 'package:getwork/app/utils/colors.dart';
import 'package:http/http.dart' as http;

class OtpController extends GetxController {
  final TextEditingController otpTextController = TextEditingController();
  dynamic statusCode;

  void verifyOtp() {
    postData(
      userId: "639c35223b858bfaf3400ec6",
      otp: otpTextController.text,
      userType: 'employee',
    );
  }

  Future<OtpModel?> postData({
    required String userId,
    required String otp,
    required String userType,
  }) async {
    try {
      final OtpModel otpModel = OtpModel(
        userId: userId,
        otp: otp,
        userType: userType,
      );

      final request = await http.post(
          Uri.parse(
            'http://10.0.2.2:3001/api/verify-email',
          ),
          body: otpModel.toJson());
      statusCode = request.statusCode;
      if (request.statusCode == 200) {
        log(request.body.toString());
        Get.showSnackbar(
          GetSnackBar(
            message: "Otp verified",
            backgroundColor: greenColor,
            duration: const Duration(seconds: 3),
            snackStyle: SnackStyle.FLOATING,
          ),
        );
      }
       if (request.statusCode == 404) {
          log('otp is wrong');
        }
      log(request.statusCode.toString());
      log(request.body.toString());
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}
