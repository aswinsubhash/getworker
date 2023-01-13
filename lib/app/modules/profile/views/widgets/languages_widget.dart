import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwork/app/common/widgets/common_widgets.dart';
import 'package:getwork/app/modules/profile/controllers/profile_controller.dart';
import 'package:getwork/app/modules/profile/model/profile_model.dart';
import 'package:getwork/app/utils/colors.dart';

class LanguagesWidget extends StatelessWidget {
 
  final VoidCallback onPressed;

  const LanguagesWidget({
    Key? key,
   
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final profileController = Get.put(ProfileController());
    return Obx(
      () => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            commonSizedBox(5),
            Row(
              children: [
                Text(
                  'Languages',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                commonWidthBox(10),
                CircleAvatar(
                  radius: 15,
                  backgroundColor: AppColor.greenColor,
                  child: InkWell(
                    onTap: onPressed,
                    child: CircleAvatar(
                      radius: 13,
                      backgroundColor: AppColor.whiteColor,
                      child: Icon(
                        Icons.edit,
                        color: AppColor.blackColor,
                        size: 16,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            //commonSizedBox(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(
                profileController.languages.isEmpty
                    ? profileController.languages.length = 1
                    : profileController.languages.length,
                (index) {
                  return Column(
                    children: [
                      commonSizedBox(8),
                      Text(
                        profileController.languages[index]?.language ??
                            'Add your languages here',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            commonSizedBox(10),
          ],
        ),
      ),
    );
  }
}
