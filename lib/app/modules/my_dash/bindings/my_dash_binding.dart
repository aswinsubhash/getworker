import 'package:get/get.dart';

import '../controllers/my_dash_controller.dart';

class MyDashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyDashController>(
      () => MyDashController(),
    );
  }
}
