import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:getwork/app/common/widgets/common_widgets.dart';
import 'package:getwork/app/common/widgets/custom_button.dart';
import 'package:getwork/app/modules/job_details/views/widgets/skills_widget.dart';
import 'package:getwork/app/utils/app_string.dart';
import 'package:getwork/app/utils/app_styles.dart';
import 'package:getwork/app/utils/colors.dart';
import 'package:getwork/app/utils/common_app_function.dart';

import '../controllers/job_details_controller.dart';

class JobDetailsView extends GetView {
  final jobDetailsController = Get.put(JobDetailsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.whiteColor,
        elevation: 0.5,
        centerTitle: true,
        leading: IconButton(
          onPressed: AppFuctions.onBackButton,
          icon: Icon(
            CupertinoIcons.back,
            color: AppColor.blackColor,
          ),
        ),
        title: Text(
          AppString.jobDetails,
          style: AppStyle.appBarStyle,
        ),
      ),
      body: Obx(
        () => jobDetailsController.isLoading.value
            ? Center(
                child: SpinKitThreeBounce(
                  color: AppColor.greenColor,
                ),
              )
            : Stack(
                children: [
                  ListView(
                    children: [
                      commonSizedBox(20),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 21,
                        ),
                        child: Text(
                          jobDetailsController.jobTitle.toString(),
                          softWrap: true,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      commonSizedBox(10),
                      commonDivider(0.8),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 21,
                        ),
                        child: Text(
                          jobDetailsController.description.toString(),
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            height: 1.5,
                          ),
                        ),
                      ),
                      commonDivider(0.8),
                      commonSizedBox(10),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 21,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Estimated Budget',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: AppColor.blackColor,
                                  ),
                                ),
                                Text(
                                  '\$${jobDetailsController.budget}',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),

                            commonSizedBox(5),

                            // commonWidthBox(150),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Deadline',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: AppColor.blackColor,
                                  ),
                                ),
                                Text(
                                  "${jobDetailsController.deadline.toString()} days ",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                            commonSizedBox(5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Difficulty',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: AppColor.blackColor,
                                  ),
                                ),
                                Text(
                                  jobDetailsController.level.value
                                      .toUpperCase(),
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                            commonSizedBox(5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Proposals',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: AppColor.blackColor,
                                  ),
                                ),
                                Text(
                                  jobDetailsController.proposals!.length
                                      .toString(),
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      commonSizedBox(10),
                      commonDivider(0.8),
                      commonSizedBox(6),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 21,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Skills and Expertise',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,

                              ),
                            ),
                            commonSizedBox(10),
                            Row(
                              children: [
                                Wrap(
                                  direction: Axis.horizontal,
                                  spacing: 8.0,
                                  runSpacing: 4.0,
                                  children: List.generate(
                                    jobDetailsController.searchTag?.length ?? 0,
                                    (index) {
                                      return SkillsContainer(
                                        searchTag: jobDetailsController
                                            .searchTag?[index],
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    bottom: 0,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        children: [
                          SizedBox(
                            width: Get.height / 2.65,
                            child: CustomButton(
                              text: 'Apply now',
                              onPressed: jobDetailsController.onSubmitProposal,
                              textColor: AppColor.whiteColor,
                              buttonColor: AppColor.greenColor,
                              radius: 30,
                            ),
                          ),
                          commonWidthBox(5),
                          InkWell(
                            onTap: () {
                              jobDetailsController.saveJobs();
                            },
                            child: CircleAvatar(
                              radius: 22,
                              backgroundColor: AppColor.greenColor,
                              child: CircleAvatar(
                                radius: 20,
                                backgroundColor: AppColor.whiteColor,
                                child: jobDetailsController.isClicked.value ==
                                        false
                                    ? Icon(
                                        CupertinoIcons.heart,
                                        size: 24,
                                        color: AppColor.greenColor,
                                      )
                                    : Icon(
                                        CupertinoIcons.heart_fill,
                                        size: 24,
                                        color: AppColor.errorColor,
                                      ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
      ),
    );
  }
}
