import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwork/app/common/widgets/common_widgets.dart';
import 'package:getwork/app/modules/home/views/widgets/job_tile_widget.dart';
import 'package:getwork/app/modules/home/views/widgets/custom_search_bar.dart';
import 'package:getwork/app/modules/home/views/widgets/shimmer.dart';
import 'package:getwork/app/utils/colors.dart';
import '../controllers/home_controller.dart';

class AvailableJobsView extends GetView {
  final homeContrller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      body: Column(
        children: [
          commonSizedBox(20),
          Center(
            child: SizedBox(
              width: size.width * 0.95,
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
                      itemCount: homeContrller.allJobs?.length ?? 0,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            homeContrller.onJobClick(
                                homeContrller.allJobs?[index].id ?? '');
                          },
                          splashColor: AppColor.transparent,
                          child: JobDetailsTile(
                            title: homeContrller.allJobs?[index].title ?? '',
                            budget: homeContrller.allJobs?[index].budget
                                    .toString() ??
                                '',
                            description:
                                homeContrller.allJobs?[index].description ?? '',
                            level: homeContrller.allJobs?[index].level
                                    ?.toUpperCase() ??
                                '',
                            deadline: homeContrller.allJobs?[index].deadline
                                    .toString() ??
                                '',
                            proposals: homeContrller
                                    .allJobs?[index].proposals?.length
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
