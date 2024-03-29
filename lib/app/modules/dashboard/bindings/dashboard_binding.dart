import 'package:get/get.dart';
import 'package:getwork/app/modules/home/controllers/home_controller.dart';
import 'package:getwork/app/modules/messages/controllers/messages_controller.dart';
import 'package:getwork/app/modules/my_dash/controllers/my_dash_controller.dart';
import 'package:getwork/app/modules/profile/controllers/profile_controller.dart';
import 'package:getwork/app/modules/proposals/controllers/proposals_controller.dart';

import '../controllers/dashboard_controller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardController>(() => DashboardController());
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<ProposalsController>(() => ProposalsController());
    Get.lazyPut<MyDashController>(() => MyDashController());
    Get.lazyPut<MessagesController>(() => MessagesController());
    Get.lazyPut<ProfileController>(() => ProfileController());
  }
}
