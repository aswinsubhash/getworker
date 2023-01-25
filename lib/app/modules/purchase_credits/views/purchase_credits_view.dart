import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getwork/app/modules/purchase_credits/views/history_view.dart';
import 'package:getwork/app/modules/purchase_credits/views/purchase_view.dart';
import 'package:getwork/app/utils/app_styles.dart';
import 'package:getwork/app/utils/colors.dart';
import 'package:getwork/app/utils/common_app_function.dart';

import '../controllers/purchase_credits_controller.dart';

class PurchaseCreditsView extends GetView {
  final purchaseCreditsController = Get.put(PurchaseCreditsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      appBar: AppBar(
        backgroundColor: AppColor.whiteColor,
        elevation: 0.8,
        title: Text(
          'Purchase Credits',
          style: AppStyle.appBarStyle,
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: AppFuctions.onBackButton,
          icon: Icon(
            CupertinoIcons.back,
            color: AppColor.blackColor,
          ),
        ),
        bottom: TabBar(
          controller: purchaseCreditsController.tabController,
          tabs: purchaseCreditsController.myTabs,
          labelColor: AppColor.greenColor,
          unselectedLabelColor: AppColor.blackColor,
          indicatorColor: AppColor.greenColor,
        ),
      ),
      body: TabBarView(
        controller: purchaseCreditsController.tabController,
        children: [
          PurchaseView(),
          HistoryView()
        ],
      ),
    );
  }
}
