import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getwork/app/common/widgets/common_widgets.dart';
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
      ),
      body: SafeArea(
        child: Obx(
          () => proposalController.isLoading.value
              ? CircularProgressIndicator(color: AppColor.greenColor)
              : ListView.separated(
                
                  itemBuilder: (context, index) {
                    return ListTile(
                      // title:
                      //     Text(proposalController.reversedProposals?[0].cover ?? ''),
                      //     subtitle: Text("Your Bid :\$${proposalController.myProposals?[1].bid}"),
                    );
                  },
                  separatorBuilder: (context, index) => commonDivider(0.8),
                  itemCount: 4,
                ),
        ),
      ),
    );
  }
}
