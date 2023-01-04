import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getwork/app/common/widgets/custom_button.dart';
import 'package:getwork/app/utils/app_string.dart';
import 'package:getwork/app/utils/app_styles.dart';
import 'package:getwork/app/utils/colors.dart';
import 'package:getwork/app/utils/common_app_function.dart';

import '../controllers/submit_proposal_controller.dart';

class SubmitProposalView extends GetView<SubmitProposalController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            AppString.submitProposal,
            style: AppStyle.appBarStyle,
          ),
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
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Text('Single page html match style of another page'),
              CustomButton(
                text: 'test double pop',
                onPressed: () {
                  for (int i = 0; i < 1; i++) {
                    Get.back();
                  }
                },
                textColor: AppColor.whiteColor,
                buttonColor: AppColor.greenColor,
                radius: 30,
              ),
            ],
          ),
        ));
  }
}
