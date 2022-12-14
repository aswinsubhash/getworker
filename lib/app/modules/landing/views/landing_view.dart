import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getwork/app/common/widgets/common_widgets.dart';
import 'package:getwork/app/common/widgets/custom_button.dart';
import 'package:getwork/app/utils/colors.dart';

import '../controllers/landing_controller.dart';

class LandingView extends GetView<LandingController> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final landingController = Get.put(LandingController());
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          color: whiteColor,
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
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 40),
                child: Image(
                  width: MediaQuery.of(context).size.width * 0.9,
                  image: const AssetImage('assets/images/landing_image.png'),
                ),
              ),
              Text(
                'Never miss an opportunity',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 23,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 16,
                ),
                child: Text(
                  'Easily find work,chat and \n collaborate on the go.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    wordSpacing: 2,
                  ),
                ),
              ),
              SizedBox(
                width: size.width * 0.85,
                child: CustomButton(
                  text: 'Log In',
                  onPressed: landingController.onLoginClick,
                  textColor: Colors.white,
                  buttonColor: blackColor,
                  radius: 35,
                ),
              ),
              commonSizedBox(5),
              TextButton(
                onPressed: landingController.onSignUpClick,
                child: Text(
                  'New to Getworker? Sign Up',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: signUpColor),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
