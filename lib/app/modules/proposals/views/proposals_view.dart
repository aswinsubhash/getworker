import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwork/app/modules/proposals/views/active_proposals_view.dart';
import 'package:getwork/app/modules/proposals/views/rejected_proposals_view.dart';
import 'package:getwork/app/modules/proposals/views/shortlisted_proposals_view.dart';
import 'package:getwork/app/utils/app_string.dart';
import 'package:getwork/app/utils/colors.dart';
import 'package:getwork/app/utils/app_styles.dart';
import '../controllers/proposals_controller.dart';

class ProposalsView extends GetView {
  final proposalController = Get.put(ProposalsController());
  @override
  Widget build(BuildContext context) {
    proposalController.onInit();
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      appBar: AppBar(
        title: Text(
          AppString.proposalsText,
          style: AppStyle.appBarStyle,
        ),
        centerTitle: true,
        backgroundColor: AppColor.whiteColor,
        elevation: 0.8,
        bottom: TabBar(
          controller: proposalController.tabController,
          tabs: proposalController.myTabs,
          labelColor: AppColor.greenColor,
          unselectedLabelColor: AppColor.blackColor,
          indicatorColor: AppColor.greenColor,
        ),
      ),
      body: TabBarView(
        controller: proposalController.tabController,
        children: [
          ActiveProposalsView(),
          ShortlistedProposalsView(),
          RejectedProposalsView(),
        ],
      ),
    );
  }
}
