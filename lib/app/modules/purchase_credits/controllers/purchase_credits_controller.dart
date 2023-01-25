import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PurchaseCreditsController extends GetxController
    with GetTickerProviderStateMixin {
  late TabController tabController;

  List<Tab> myTabs = <Tab>[
    Tab(
      text: 'Purchase',
    ),
    Tab(
      text: 'History',
    )
  ];

  @override
  void onInit() {
    tabController = TabController(length: 2, vsync: this);
    super.onInit();
  }

  @override
  void onClose() {
    tabController.dispose();
  }
}
