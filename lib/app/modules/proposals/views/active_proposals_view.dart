import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getwork/app/common/widgets/common_widgets.dart';
import 'package:getwork/app/modules/proposals/controllers/proposals_controller.dart';
import 'package:getwork/app/modules/proposals/views/widgets/proposals_tile_widget.dart';
import 'package:getwork/app/utils/colors.dart';

class ActiveProposalsView extends GetView {
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
                itemCount: proposalsController.activeProposals.length,
                itemBuilder: (context, index) {
                  return ProposalTileWidget(
                    coverText:
                        proposalsController.activeProposals[index]?.cover ?? '',
                    bidAmout:
                        '\$${proposalsController.activeProposals[index]?.bid ?? ''}',
                    daysToComplete:
                        ' ${proposalsController.activeProposals[index]?.deadline ?? ''} days',
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
