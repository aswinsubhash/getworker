import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getwork/app/modules/my_dash/views/active_contracts_view.dart';
import 'package:getwork/app/modules/my_dash/views/balance_view.dart';
import 'package:getwork/app/modules/my_dash/views/completed_contracts_view.dart';
import 'package:getwork/app/utils/app_string.dart';
import 'package:getwork/app/utils/app_styles.dart';
import 'package:getwork/app/utils/colors.dart';

import '../controllers/my_dash_controller.dart';

class MyDashView extends GetView {
  final myDashController = Get.put(MyDashController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.whiteColor,
          title: Text(
            AppString.mydashText,
            style: AppStyle.appBarStyle,
          ),
          centerTitle: true,
          elevation: 0.8,
          bottom: TabBar(
            controller: myDashController.tabController,
            tabs: myDashController.myTabs,
            labelColor: AppColor.greenColor,
            unselectedLabelColor: AppColor.blackColor,
           
            indicatorColor: AppColor.greenColor,
          ),
        ),
        body: TabBarView(
          controller: myDashController.tabController,
          children: [
            ActiveContractsView(),
            CompletedContractsView(),
            BalanceView(),
          ],
        ));
  }
}
