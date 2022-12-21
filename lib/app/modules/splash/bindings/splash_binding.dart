import 'package:get/get.dart';
import 'package:getwork/app/modules/dashboard/controllers/dashboard_controller.dart';

import '../controllers/splash_controller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashController>(() => SplashController());
    Get.lazyPut<DashboardController>(() => DashboardController());
  }
}
