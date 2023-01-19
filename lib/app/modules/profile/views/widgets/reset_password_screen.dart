import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwork/app/common/widgets/common_widgets.dart';
import 'package:getwork/app/common/widgets/custom_button.dart';
import 'package:getwork/app/modules/profile/controllers/profile_controller.dart';
import 'package:getwork/app/utils/app_string.dart';
import 'package:getwork/app/utils/app_styles.dart';
import 'package:getwork/app/utils/colors.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final profileController = Get.put(ProfileController());
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: AppStyle.backgroundImage,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  AppString.resetPasswordText,
                  style: AppStyle.resetAndOtpStyle,
                ),
                commonSizedBox(20),
                SizedBox(
                  height: 75,
                  width: size.width * 0.9,
                  child: TextField(
                    controller: profileController.oldPasswordController,
                    cursorColor: AppColor.greenColor,
                    style: TextStyle(
                      fontSize: 15,
                    ),
                    decoration: InputDecoration(
                      hintText: 'Old password',
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: AppColor.greenColor,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      contentPadding: EdgeInsets.all(8.0),
                    ),
                  ),
                ),
                SizedBox(
                  height: 75,
                  width: size.width * 0.9,
                  child: TextField(
                    controller: profileController.newPasswordController,
                    cursorColor: AppColor.greenColor,
                    style: TextStyle(
                      fontSize: 15,
                    ),
                    decoration: InputDecoration(
                      hintText: 'New password',
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: AppColor.greenColor,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      contentPadding: EdgeInsets.all(8.0),
                    ),
                  ),
                ),
                SizedBox(
                  height: 75,
                  width: size.width * 0.9,
                  child: TextField(
                    controller: profileController.confirmPasswordController,
                    cursorColor: AppColor.greenColor,
                    style: TextStyle(
                      fontSize: 15,
                    ),
                    decoration: InputDecoration(
                      hintText: 'Confirm password',
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: AppColor.greenColor,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      contentPadding: EdgeInsets.all(8.0),
                    ),
                  ),
                ),
                SizedBox(
                  width: size.width * 0.9,
                  child: CustomButton(
                    text: 'Update',
                    onPressed: profileController.resetPassword,
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
    );
  }
}
