import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwork/app/modules/my_dash/api/my_dash_api.dart';
import 'package:getwork/app/modules/my_dash/model/my_dash_model.dart';

class MyDashController extends GetxController with GetTickerProviderStateMixin {
  late TabController tabController;

  var activeContracts = <ActiveContract?>[].obs;
  var completedJobs = <CompletedJobs?>[].obs;
  var credits = 0.obs;
  var totalEarned = 0.obs;
  var pendingWithdraw = 0.obs;
  var isLoading = true.obs;

  List<Tab> myTabs = <Tab>[
    Tab(
      text: 'Active',
    ),
    Tab(
      text: 'Completed',
    ),
    Tab(
      text: 'Balance',
    )
  ];

  @override
  void onInit() {
    tabController = TabController(length: 3, vsync: this);
    getMydashDetails();

    super.onInit();
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }

  /// This function retrieves the details for the user's dashboard.
  /// It calls the "getMyDashDetails" function from the "MyDashAPI" class and receives a response object of type "MyDashModel".
  /// If the response is not null, it updates the values of active contracts, completed jobs, credits, total earned, and pending withdraw.
  Future<void> getMydashDetails() async {
    MyDashModel? response = await MyDashAPI().getMyDashDetails();

    if (response != null) {
      isLoading(false);
      if (response.activeContracts != null) {
        activeContracts.value = response.activeContracts ?? [];
      }

      if (response.completedJobs != null) {
        completedJobs.value = response.completedJobs ?? [];
      }

      if (response.connects != null) {
        credits.value = response.connects ?? 0;
      }
      if (response.totalEarned != null) {
        totalEarned.value = response.totalEarned ?? 0;
      }

      if (response.pendingWithdraw != null) {
        pendingWithdraw.value = response.pendingWithdraw ?? 0;
      }
      if (response.connects != null) {
        credits.value = response.connects ?? 0;
        log(credits.toString());
      }
      if (response.totalEarned != null) {
        totalEarned.value = response.totalEarned ?? 0;
      }

      if (response.pendingWithdraw != null) {
        pendingWithdraw.value = response.pendingWithdraw ?? 0;
      }
    } else {
      isLoading(false);
      ////////////////////////////////////////
    }
  }
}
