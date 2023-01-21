import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwork/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:getwork/app/modules/dashboard/views/dashboard_view.dart';
import 'package:getwork/app/modules/home/views/available_jobs_view.dart';

class MyDashController extends GetxController with GetTickerProviderStateMixin {
  late TabController tabController;
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
    super.onInit();
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }


}
