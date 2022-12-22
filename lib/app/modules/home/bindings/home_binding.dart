import 'package:get/get.dart';
import 'package:getwork/app/modules/auth/login/controllers/login_controller.dart';

import '../../dashboard/controllers/dashboard_controller.dart';
import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<LoginController>(() => LoginController());
    Get.lazyPut<DashboardController>(() => DashboardController());
  }
}
