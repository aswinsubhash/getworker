import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

import 'package:getwork/app/common/widgets/common_widgets.dart';
import 'package:getwork/app/common/widgets/custom_button.dart';
import 'package:getwork/app/modules/profile/controllers/profile_controller.dart';
import 'package:getwork/app/modules/profile/views/profile_image_view_widget.dart';
import 'package:getwork/app/modules/profile/views/reset_password_screen.dart';
import 'package:getwork/app/utils/colors.dart';

class UserInfoWidget extends StatelessWidget {
  final VoidCallback onPressed;
  const UserInfoWidget({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final profileController = Get.put(ProfileController());
    return Obx(() => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Row(
            children: [
              Stack(
                children: [
                  InkWell(
                    onTap: () => Get.to(
                      () => ShowProfilePicScreen(),
                      transition: Transition.cupertino,
                    ),
                    child: CircleAvatar(
                      backgroundColor: AppColor.dimBlack,
                      radius: 34,
                      backgroundImage: NetworkImage(
                        profileController.profilePic.value,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 42,
                    child: CircleAvatar(
                      backgroundColor: AppColor.greenColor,
                      radius: 12,
                      child: InkWell(
                        onTap: onPressed,
                        child: CircleAvatar(
                          radius: 11,
                          backgroundColor: AppColor.whiteColor,
                          child: Icon(
                            Icons.add_a_photo_outlined,
                            size: 11,
                            color: AppColor.blackColor,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              commonWidthBox(20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    profileController.profileName.value,
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    profileController.emailId.value,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                    ),
                  ),
                  commonSizedBox(5),
                  RichText(
                    text: TextSpan(
                      text: 'Change Password ?',
                      style: TextStyle(
                        color: AppColor.greenColor,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          print('sdfsdfsedfsdf');
                         Get.to(()=> ResetPasswordScreen());

                          // profileController.resetPassword();
                        },
                    ),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
