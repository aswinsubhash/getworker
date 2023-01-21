// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:getwork/app/common/widgets/common_widgets.dart';
import 'package:getwork/app/modules/profile/controllers/profile_controller.dart';
import 'package:getwork/app/utils/colors.dart';

class SkillsWidget extends StatelessWidget {
  final VoidCallback onPressed;
  const SkillsWidget({
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
                  'Skills',
                  style: TextStyle(
                  
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
                        Icons.add,
                        color: AppColor.blackColor,
                        size: 16,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            commonSizedBox(10),
            Wrap(
              direction: Axis.horizontal,
              spacing: 5.0,
              children: List.generate(
                profileController.skills.isEmpty
                    ? profileController.skills.length = 1
                    : profileController.skills.length,
                (index) {
                  return Chip(
                    backgroundColor: AppColor.searchTagContainer,
                    label: Text(profileController.skills[index]?.skill ?? 'Add your skill'),
               
                    deleteIcon: Icon(
                      Icons.close,
                      size: 20,
                    ),
                    onDeleted: () {
                      profileController.deleteLanguageAndSkill(
                        profileController.skills[index]?.skill ?? '',
                        '',
                      );
                    },
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
