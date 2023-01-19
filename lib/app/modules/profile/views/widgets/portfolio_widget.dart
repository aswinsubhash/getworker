import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:getwork/app/common/widgets/common_widgets.dart';
import 'package:getwork/app/modules/profile/controllers/profile_controller.dart';

import 'package:getwork/app/utils/colors.dart';

class PortfolioWidget extends StatelessWidget {
  const PortfolioWidget({
    Key? key,
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
                  'Portfolio',
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
                    onTap: () {
                      if (profileController.portfolios.length <= 3) {
                        profileController.uploadPortfolio();
                      } else {
                        Get.snackbar(
                          'Upload limit reached',
                          'You can upload only 4 portfolios',
                          backgroundColor: AppColor.errorColor,
                          colorText: AppColor.whiteColor,
                        );
                      }
                    },
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
                )
              ],
            ),
            commonSizedBox(15),
            Wrap(
              direction: Axis.horizontal,
              spacing: 10.0,
              runSpacing: 10.0,
              children: List.generate(
                profileController.portfolios.length,
                (index) {
                  return Stack(
                    children: [
                      Container(
                        width: 170,
                        height: 110,
                        decoration: BoxDecoration(
                          color: AppColor.greyColor,
                          image: DecorationImage(
                            image: NetworkImage(
                              profileController.portfolios[index]?.image ?? '',
                            ),
                            fit: BoxFit.fill,
                          ),
                          borderRadius: BorderRadius.circular(
                            10,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 0,
                        right: 0,
                        child: CircleAvatar(
                          backgroundColor: AppColor.greenColor,
                          radius: 12,
                          child: InkWell(
                            onTap: () {
                              profileController.deletePortfolio(profileController.portfolios[index]?.id ?? '');
                            },
                            child: CircleAvatar(
                              radius: 11,
                              backgroundColor: AppColor.whiteColor,
                              child: Icon(
                                Icons.close,
                                size: 11,
                                color: AppColor.blackColor,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  );
                },
              ),
            ),
            commonSizedBox(30)
          ],
        ),
      ),
    );
  }
}
