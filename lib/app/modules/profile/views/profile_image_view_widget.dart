import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:getwork/app/modules/profile/controllers/profile_controller.dart';
import 'package:getwork/app/utils/app_styles.dart';
import 'package:getwork/app/utils/colors.dart';
import 'package:getwork/app/utils/common_app_function.dart';

class ShowProfilePicScreen extends StatelessWidget {
  const ShowProfilePicScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final profileController = Get.put(ProfileController());
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Profile Picture',
          style: TextStyle(
            fontFamily: 'Poppins'
          ),
          ),
          backgroundColor: AppColor.blackColor,
          elevation: 0,
            leading: IconButton(
          onPressed: AppFuctions.onBackButton,
          icon: Icon(
            CupertinoIcons.back,
            color: AppColor.whiteColor,
          ),
        ),
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColor.blackColor,
            image: DecorationImage(
              fit: BoxFit.contain,
              image: NetworkImage(
                profileController.profilePic.value,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
