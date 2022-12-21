import 'package:get/get.dart';

import '../controllers/proposals_controller.dart';

class ProposalsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProposalsController>(
      () => ProposalsController(),
    );
  }
}
