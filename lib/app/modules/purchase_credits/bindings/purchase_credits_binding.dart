import 'package:get/get.dart';

import '../controllers/purchase_credits_controller.dart';

class PurchaseCreditsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PurchaseCreditsController>(
      () => PurchaseCreditsController(),
    );
  }
}
