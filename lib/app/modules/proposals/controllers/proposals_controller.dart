import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwork/app/modules/proposals/api/proposal_api.dart';
import 'package:getwork/app/modules/proposals/model/proposal_model.dart';

class ProposalsController extends GetxController
    with GetTickerProviderStateMixin {
  RxBool isLoading = true.obs;

  var myProposals = <Proposal?>[].obs;
  var reversedProposals = <Proposal?>[].obs;

  get activeProposals =>
      reversedProposals.where((item) => item?.status == 'active').toList();
  get shortlistedProposals =>
      reversedProposals.where((item) => item?.status == 'shortlisted').toList();
  get rejectedProposals =>
      reversedProposals.where((item) => item?.status == 'rejected').toList();

//  List<YourData> activeData = originalData.where((item) => item.status == 'active').toList();

  @override
  void onInit() {
    getAllProposals();

    tabController = TabController(length: 3, vsync: this);

    super.onInit();
  }

  late TabController tabController;
  List<Tab> myTabs = <Tab>[
    Tab(
      text: 'Active',
    ),
    Tab(
      text: 'Shortlisted',
    ),
    Tab(
      text: 'Rejected',
    )
  ];

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }

  void getAllProposals() async {
    ProposalsModel? response = await ProposalsAPI().getMyProposals();

    if (response != null) {
      isLoading(false);
      if (response.proposals != null) {
        myProposals.value = response.proposals ?? [];
        reversedProposals.value = myProposals.reversed.toList();
      }
    } else {
      isLoading(false);
    }
  }
}
