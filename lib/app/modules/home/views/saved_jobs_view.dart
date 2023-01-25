import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getwork/app/common/widgets/common_widgets.dart';
import 'package:getwork/app/modules/home/controllers/home_controller.dart';
import 'package:getwork/app/modules/home/views/widgets/custom_search_bar.dart';
import 'package:getwork/app/modules/home/views/widgets/job_tile_widget.dart';
import 'package:getwork/app/modules/home/views/widgets/shimmer.dart';
import 'package:getwork/app/utils/colors.dart';

class SavedJobsView extends GetView {

  final homeContrller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      body: Column(
        children: [
          commonSizedBox(20),
          Center(
            child: SizedBox(
              width: Get.width * 0.95,
              height: 45,
              child: CustomSearchBar(
                hintText: 'Search for job',
                onPressed: () {},
              ),
            ),
          ),
          commonSizedBox(10),
          Expanded(
            child: Obx(
              () => homeContrller.isLoading.value
                  ? ShimmerWidgetHome()
                  : ListView.separated(
                      separatorBuilder: (context, index) => Divider(
                        color: AppColor.dividerColor,
                      ),
                      itemCount:homeContrller.savedJobs.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            homeContrller.onJobClick(
                                homeContrller.allJobs?[index].id ?? '');
                          },
                          splashColor: AppColor.transparent,
                          child: JobDetailsTile(
                          
                            title:
                                homeContrller.savedJobs[index]?.title ?? '',
                            budget: homeContrller.savedJobs[index]?.budget
                                    .toString() ??
                                '',
                            description: homeContrller
                                    .savedJobs[index]?.description ??
                                '',
                            level: homeContrller.savedJobs[index]?.level
                                    ?.toUpperCase() ??
                                '',
                            deadline: homeContrller
                                    .savedJobs[index]?.deadline
                                    .toString() ??
                                '',
                            proposals: homeContrller
                                    .savedJobs[index]?.proposals?.length
                                    .toString() ??
                                '',
                          ),
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
