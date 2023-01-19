
import 'package:flutter/cupertino.dart';
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
    final size = MediaQuery.of(context).size;
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
                        Icons.add,
                        color: AppColor.blackColor,
                        size: 16,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            // commonSizedBox(8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(
                profileController.education.length,
                (int index) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: 0, top: 10),
                    child: Container(
                      width: double.infinity,
                      height: size.height / 19,
                      // color: Colors.blue,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                profileController.education[index]?.school ??
                                    'sdfsdf',
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                profileController.education[index]?.title ?? 'sdfsd',
                                style: TextStyle(fontFamily: 'Poppins'),
                              ),
                            ],
                          ),
                          InkWell(
                            onTap: () {
                              profileController.deleteEducation(
                                  profileController.education[index]?.id ?? '');
                            },
                            child: Icon(
                              CupertinoIcons.delete,
                              size: 20,
                              color: AppColor.greenColor,
                            ),
                          )
                        ],
                      ),
                    ),
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
