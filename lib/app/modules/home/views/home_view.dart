import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:getwork/app/modules/home/views/available_jobs_view.dart';

import 'package:getwork/app/modules/home/views/saved_jobs_view.dart';
import 'package:getwork/app/modules/home/views/widgets/job_tile_widget.dart';
import 'package:getwork/app/modules/home/views/widgets/custom_search_bar.dart';
import 'package:getwork/app/modules/home/views/widgets/shimmer.dart';
import 'package:getwork/app/modules/profile/model/profile_model.dart';
import 'package:getwork/app/utils/app_string.dart';
import 'package:getwork/app/utils/colors.dart';
import 'package:getwork/app/utils/app_styles.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView {
  final homeContrller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      appBar: AppBar(
        actions: [
          GestureDetector(
            onTap: homeContrller.logout,
            child: Icon(
              Icons.logout,
              color: AppColor.blackColor,
            ),
          )
        ],
        title: Text(
          AppString.jobsText,
          style: AppStyle.appBarStyle,
        ),
        centerTitle: true,
        backgroundColor: AppColor.whiteColor,
        elevation: 0.5,
        bottom: TabBar(
          controller: homeContrller.tabController,
          tabs: homeContrller.myTabs,
          labelColor: AppColor.greenColor,
          unselectedLabelColor: AppColor.blackColor,
          labelStyle: TextStyle(fontFamily: 'Poppins'),
          indicatorColor: AppColor.greenColor,
        ),
      ),
      body: TabBarView(
        controller: homeContrller.tabController,
        children: [
          AvailableJobsView(),
          SavedJobsView(),
        ],
      ),
    );
  }
}
