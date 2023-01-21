import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getwork/app/common/widgets/common_widgets.dart';
import 'package:getwork/app/modules/proposals/controllers/proposals_controller.dart';
import 'package:getwork/app/modules/proposals/views/widgets/proposals_tile_widget.dart';
import 'package:getwork/app/utils/colors.dart';

class RejectedProposalsView extends GetView {
  final proposalsController = Get.put(ProposalsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      body: Column(
        children: [
          commonSizedBox(5),
          Expanded(
            child: Obx(
              () => ListView.separated(
                separatorBuilder: (context, index) => Divider(
                  color: AppColor.dividerColor,
                ),
                itemCount: proposalsController.rejectedProposals.length,
                itemBuilder: (context, index) {
                  return ProposalTileWidget(
                    coverText:
                        proposalsController.rejectedProposals[index]?.cover ??
                            '',
                    bidAmout:
                        '\$${proposalsController.rejectedProposals[index]?.bid ?? ''}',
                    daysToComplete:
                        ' ${proposalsController.rejectedProposals[index]?.deadline ?? ''} days',
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
