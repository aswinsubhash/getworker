import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
    final size = MediaQuery.of(context).size;
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
                child: CircularProgressIndicator(
                  color: AppColor.greenColor,
                ),
              )
            : Stack(
                children: [
                  ListView(
                    //crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      commonSizedBox(20),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 21,
                        ),
                        child: Text(
                          jobDetailsController.jobTitle.toString(),
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Poppins',
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
                      commonSizedBox(6),
                      commonDivider(0.8),
                      commonSizedBox(10),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 21,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '\$${jobDetailsController.budget}',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                commonSizedBox(5),
                                Text(
                                  'Budget',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: AppColor.dimBlack,
                                  ),
                                ),
                              ],
                            ),
                            // commonWidthBox(150),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${jobDetailsController.deadline.toString()} Days ",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                commonSizedBox(5),
                                Text(
                                  'Deadline',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: AppColor.dimBlack,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  jobDetailsController.level
                                      .toString()
                                      .toUpperCase(),
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                commonSizedBox(5),
                                Text(
                                  'Experience Level',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: AppColor.dimBlack,
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
                                fontFamily: 'Poppins',
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
                      child: SizedBox(
                        width: size.width * 0.9,
                        child: CustomButton(
                          text: 'Submit a proposal',
                          onPressed: jobDetailsController.onSubmitProposal,
                          textColor: AppColor.whiteColor,
                          buttonColor: AppColor.greenColor,
                          radius: 30,
                        ),
                      ),
                    ),
                  )
                ],
              ),
      ),
    );
  }
}
