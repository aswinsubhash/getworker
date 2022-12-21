import 'package:get/get.dart';
import 'package:getwork/app/modules/dashboard/controllers/dashboard_controller.dart';

import '../controllers/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController());
    Get.lazyPut<DashboardController>(() => DashboardController());
  }
}
