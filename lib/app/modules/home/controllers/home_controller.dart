import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:getwork/app/modules/auth/login/controllers/login_controller.dart';
import 'package:getwork/app/modules/auth/login/views/login_view.dart';
import 'package:getwork/app/modules/home/api/get_all_jobs_api.dart';
import 'package:getwork/app/modules/home/model/all_job_list_model.dart';

class HomeController extends GetxController {
  final loginController = Get.put(LoginController());

  RxBool isLoading = false.obs;

  List<AllJob> allJobs = [];

  @override
  void onInit() async {
    jobData();
    super.onInit();
  }

  Future<void> logout() async {
    final storage = FlutterSecureStorage();
    await storage.delete(key: 'token');
    loginController.setIsLoggedIn(false);
    Get.offAll(() => LoginView());
  }

  void jobData() async {
    await Future.delayed(Duration(seconds: 1));
    GetAllJobsAPI().getJobResponse();
  }
}
