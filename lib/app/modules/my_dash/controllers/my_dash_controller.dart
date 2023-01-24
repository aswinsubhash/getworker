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
    getBalance();

    super.onInit();
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }

  Future<void> getContracts() async {
    MyDashModel? response = await MyDashAPI().getContracts();

    if (response != null) {
      if (response.activeContracts != null) {
        activeContracts.value = response.activeContracts ?? [];
        log(activeContracts[1]?.title ?? 'hghhggg');
      }

      if (response.completedJobs != null) {
        completedJobs.value = response.completedJobs ?? [];
        log(completedJobs[1]?.title ?? '');
      }

      if (response.connects != null) {
        credits.value = response.connects ?? 0;
        log(credits.toString());
      }
      if (response.totalEarned != null) {
        totalEarned.value = response.totalEarned ?? 0;
        log('This is total earned ${totalEarned.toString()}');
      }

      if (response.pendingWithdraw != null) {
        pendingWithdraw.value = response.pendingWithdraw ?? 0;
        log(pendingWithdraw.toString());
      }
    } else {
      ////////////////////////////////////////
    }
  }

  Future<void> getBalance() async {
    MyDashModel? response = await MyDashAPI().getContracts();
    if (response != null) {
      if (response.connects != null) {
        credits.value = response.connects ?? 0;
        log(credits.toString());
      }
      if (response.totalEarned != null) {
        totalEarned.value = response.totalEarned ?? 0;
        log('This is total earned ${totalEarned.toString()}');
      }

      if (response.pendingWithdraw != null) {
        pendingWithdraw.value = response.pendingWithdraw ?? 0;
        log(pendingWithdraw.toString());
      }
    } else {
      ////////////////////////////////////////
    }
  }
}
