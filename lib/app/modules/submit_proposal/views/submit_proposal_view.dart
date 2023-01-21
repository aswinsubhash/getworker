import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getwork/app/common/widgets/common_widgets.dart';
import 'package:getwork/app/common/widgets/custom_button.dart';
import 'package:getwork/app/modules/job_details/controllers/job_details_controller.dart';
import 'package:getwork/app/utils/app_string.dart';
import 'package:getwork/app/utils/app_styles.dart';
import 'package:getwork/app/utils/colors.dart';
import 'package:getwork/app/utils/common_app_function.dart';

import '../controllers/submit_proposal_controller.dart';

class SubmitProposalView extends GetView {
  final jobDetailsController = Get.put(JobDetailsController());
  final submitProposalController = Get.put(SubmitProposalController());
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: AppColor.whiteColor,
        appBar: AppBar(
          title: Text(
            AppString.submitProposal,
            style: AppStyle.appBarStyle,
          ),
          backgroundColor: AppColor.whiteColor,
          elevation: 0.7,
          centerTitle: true,
          leading: IconButton(
            onPressed: AppFuctions.onBackButton,
            icon: Icon(
              CupertinoIcons.back,
              color: AppColor.blackColor,
            ),
          ),
        ),
        body: Obx(
          () => SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 21),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  commonSizedBox(10),
                  Text(
                    jobDetailsController.jobTitle.toString(),
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                    softWrap: true,
                  ),
                  commonSizedBox(10),
                  Text(
                    'Cover letter',
                  ),
                  commonSizedBox(10),
                  Container(
                    height: 100,
                    width: size.width * 0.9,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        color: AppColor.dividerColor,
                      ),
                    ),
                    child: TextField(
                      controller:
                          submitProposalController.coverLetterController,
                      cursorColor: AppColor.greenColor,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 22,
                          horizontal: 10,
                        ),
                        border: InputBorder.none,
                        hintText:
                            'Enter a detailed description on why the employer should choose you',
                        hintMaxLines: 3,
                        hintStyle: TextStyle(
                          height: 1.5,
                        ),
                      ),
                      maxLines: null,
                      keyboardType: TextInputType.multiline,
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ),
                  commonSizedBox(10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              "What is the rate you'd like to bid for this job?"),
                          commonSizedBox(9),
                          Text(
                            "Client's budget: \$ ${jobDetailsController.budget}",
                            style: TextStyle(
                              fontSize: 12,
                              color: AppColor.dimBlack,
                            ),
                          ),
                          commonSizedBox(10),
                          Container(
                            height: 35,
                            width: 150,
                            decoration: BoxDecoration(
                              color: AppColor.whiteColor,
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                color: AppColor.dividerColor,
                              ),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  width: 30,
                                  height: 40,
                                  color: AppColor.searchTagContainer,
                                  child: Center(child: Text("\$")),
                                ),
                                Expanded(
                                  child: TextField(
                                    controller: submitProposalController
                                        .budgetBidController,
                                    cursorColor: AppColor.greenColor,
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.only(
                                        bottom: 15,
                                        left: 10,
                                      ),
                                      border: InputBorder.none,
                                    ),
                                    style: TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 40,
                                  height: 40,
                                  color: AppColor.searchTagContainer,
                                  child: Center(child: Text(".00")),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  commonSizedBox(10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Days need to finish'),
                      commonSizedBox(9),
                      Text(
                        "Client's deadline: ${jobDetailsController.deadline} days",
                        style: TextStyle(
                          fontSize: 12,
                          color: AppColor.dimBlack,
                        ),
                      ),
                      commonSizedBox(10),
                      Container(
                        height: 35,
                        width: 150,
                        decoration: BoxDecoration(
                          color: AppColor.whiteColor,
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                            color: AppColor.dividerColor,
                          ),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextField(
                                controller:
                                    submitProposalController.daysController,
                                cursorColor: AppColor.greenColor,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(
                                    bottom: 15,
                                    left: 10,
                                  ),
                                  border: InputBorder.none,
                                ),
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ),
                            Container(
                              width: 50,
                              height: 40,
                              color: AppColor.searchTagContainer,
                              child: Center(child: Text("days")),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  commonSizedBox(size.height / 2.8),
                  Center(
                    child: SizedBox(
                      width: size.width * 0.9,
                      child: CustomButton(
                        text: 'Submit  proposal',
                        onPressed: submitProposalController.onSubmitClick,
                        textColor: AppColor.whiteColor,
                        buttonColor: AppColor.greenColor,
                        radius: 30,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
