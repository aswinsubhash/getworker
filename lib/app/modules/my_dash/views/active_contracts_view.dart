import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getwork/app/modules/home/views/widgets/job_tile_widget.dart';
import 'package:getwork/app/modules/home/views/widgets/shimmer.dart';
import 'package:getwork/app/modules/my_dash/controllers/my_dash_controller.dart';
import 'package:getwork/app/utils/colors.dart';

class ActiveContractsView extends GetView {
  final myDashController = Get.put(MyDashController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      body: RefreshIndicator(
        onRefresh: myDashController.getMydashDetails,
        color: AppColor.greenColor,
         displacement: 30.0, 
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Obx(
                () => myDashController.isLoading.value
                    ? ShimmerWidgetHome()
                    : ListView.separated(
                        separatorBuilder: (context, index) => Divider(
                          color: AppColor.dividerColor,
                        ),
                        itemCount: myDashController.activeContracts.length,
                        itemBuilder: (context, index) {
                          return JobDetailsTile(
                            title: myDashController
                                    .activeContracts[index]?.title ??
                                '',
                            budget: myDashController
                                    .activeContracts[index]?.budget
                                    .toString() ??
                                '',
                            description: myDashController
                                    .activeContracts[index]?.description ??
                                '',
                            level: myDashController
                                    .activeContracts[index]?.level
                                    ?.toUpperCase() ??
                                '',
                            deadline: myDashController
                                    .activeContracts[index]?.deadline
                                    .toString() ??
                                '',
                            proposals: myDashController
                                    .activeContracts[index]?.proposals?.length
                                    .toString() ??
                                '',
                          );
                        },
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
