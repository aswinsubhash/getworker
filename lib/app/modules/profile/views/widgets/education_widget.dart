import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwork/app/common/widgets/common_widgets.dart';
import 'package:getwork/app/modules/profile/controllers/profile_controller.dart';
import 'package:getwork/app/utils/colors.dart';

class EducationWidget extends StatelessWidget {
  final VoidCallback onPressed;
  const EducationWidget({
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
                  'Education',
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
            commonSizedBox(8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(
                profileController.education.isEmpty
                    ? profileController.education.length = 1
                    : profileController.education.length,
                (index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        profileController.education[index]?.school ??
                            'Add your education details here',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins',
                        ),
                      ),
                      commonSizedBox(5),
                      Text(
                        profileController.education[index]?.title ?? '',
                      ),
                      commonSizedBox(10)
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
