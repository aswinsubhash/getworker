import 'package:flutter/material.dart';

import 'package:get/get.dart';
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
        child: const Center(
          child: Text(
            'GETWORKER',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 35,
              color: greenColor,
              fontWeight: FontWeight.w600
            ),
          ),
        ),
      ),
    );
  }
}
