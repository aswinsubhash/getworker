import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getwork/app/common/widgets/common_widgets.dart';
import 'package:getwork/app/modules/home/views/widgets/custom_search_bar.dart';
import 'package:getwork/app/modules/proposals/controllers/proposals_controller.dart';
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
                  return Column(
                    children: [
                      Container(
                        width: double.infinity,
                        height: Get.height / 9,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: AppColor.whiteColor,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Wrap(
                                children: [
                                  Text(
                                    proposalsController
                                            .activeProposals[index]?.cover ??
                                        '',
                                    softWrap: true,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              commonSizedBox(6),
                              Row(
                                children: [
                                  Text(
                                    'Your Bid is: ',
                                    style: TextStyle(),
                                  ),
                                  Text(
                                    '\$${proposalsController.activeProposals[index]?.bid ?? ''}',
                                    style: TextStyle(
                                      color: AppColor.greenColor,
                                    ),
                                  ),
                                ],
                              ),
                              commonSizedBox(6),
                              Row(
                                children: [
                                  Text(
                                    'Complete Before:',
                                    style: TextStyle(),
                                  ),
                                  Text(
                                    ' ${proposalsController.activeProposals[index]?.deadline ?? ''} days',
                                    style: TextStyle(
                                      color: AppColor.greenColor,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  );
                }),
          )),
        ],
      ),
    );
  }
}
