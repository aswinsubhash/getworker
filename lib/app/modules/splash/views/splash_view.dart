import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getwork/app/utils/app_string.dart';
import 'package:getwork/app/utils/colors.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView {
  @override
  Widget build(BuildContext context) {
    final splashController = Get.put(SplashController());
    splashController.onInit();
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
        child: Center(

          child: SizedBox(
  width: 300.0,
  child: TextLiquidFill(
    loadDuration: const Duration(seconds: 3),
    text: AppString.appName,
    waveColor: AppColor.greenColor,
  boxBackgroundColor: AppColor.whiteColor,
    textStyle: TextStyle(
      fontSize: 50,
      fontWeight: FontWeight.bold,
      fontFamily: 'Poppins'
    ),
    boxHeight: 300.0,
  ),
)
//           // child: Text(
            //   AppString.appName,
            //   style: TextStyle(
            //     fontFamily: 'Poppins',
            //     fontSize: 35,
            //     color: AppColor.greenColor,
            //     fontWeight: FontWeight.w600
            //   ),
            // ),
            ),
      ),
    );
  }
}
