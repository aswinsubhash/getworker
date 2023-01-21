import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwork/app/common/widgets/custom_snackbar.dart';
import 'package:getwork/app/modules/proposals/api/proposal_api.dart';
import 'package:getwork/app/modules/proposals/model/proposal_model.dart';

class ProposalsController extends GetxController
    with GetTickerProviderStateMixin {
  RxBool isLoading = true.obs;

  var myProposals = <Proposal?>[].obs;
  var reversedProposals = <Proposal?>[].obs;
  var activeProposals = <Proposal?>[].obs;
  var shortlistedProposals = <Proposal?>[].obs;
  var rejectedProposals = <Proposal?>[].obs;
  // List<Proposal?> get activeProposals => reversedProposals.where((item) => item!.status == 'shortlisted').toList();

//  List<YourData> activeData = originalData.where((item) => item.status == 'active').toList();

  @override
  void onInit() {
    getAllProposals();
    //? filtering active proposals from all proposals
    activeProposals.value =
        reversedProposals.where((item) => item?.status == 'active').toList();
    //? filtering shortlisted proposals from all proposals
    shortlistedProposals.value = reversedProposals
        .where((item) => item?.status == 'shortlisted')
        .toList();
    //? filtering rejected proposals from all proposals
    rejectedProposals.value =
        reversedProposals.where((item) => item?.status == 'rejected').toList();
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
      CustomSnackBar.showErrorSnackBar(
          message: 'Check your internet connection');
    }
  }
}
