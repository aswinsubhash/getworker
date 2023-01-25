import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getwork/app/common/widgets/common_widgets.dart';
import 'package:getwork/app/modules/home/views/widgets/job_tile_widget.dart';
import 'package:getwork/app/modules/home/views/widgets/shimmer.dart';
import 'package:getwork/app/modules/my_dash/controllers/my_dash_controller.dart';
import 'package:getwork/app/utils/colors.dart';

class CompletedContractsView extends GetView {
  final myDashController = Get.put(MyDashController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          commonSizedBox(15),
          Expanded(
            child: Obx(
              () => myDashController.isLoading.value
                  ? ShimmerWidgetHome()
                  : ListView.separated(
                      separatorBuilder: (context, index) => Divider(
                        color: AppColor.dividerColor,
                      ),
                      itemCount: myDashController.completedJobs.length,
                      itemBuilder: (context, index) {
                        return JobDetailsTile(
                          title:
                              myDashController.completedJobs[index]?.title ??
                                  '',
                          budget: myDashController
                                  .completedJobs[index]?.budget
                                  .toString() ??
                              '',
                          description: myDashController
                                  .completedJobs[index]?.description ??
                              '',
                          level: myDashController.completedJobs[index]?.level
                                  ?.toUpperCase() ??
                              '',
                          deadline: myDashController
                                  .completedJobs[index]?.deadline
                                  .toString() ??
                              '',
                          proposals: myDashController
                                  .completedJobs[index]?.proposals?.length
                                  .toString() ??
                              '',
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
