import 'package:get/get.dart';

import '../controllers/submit_proposal_controller.dart';

class SubmitProposalBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SubmitProposalController>(
      () => SubmitProposalController(),
    );
  }
}
