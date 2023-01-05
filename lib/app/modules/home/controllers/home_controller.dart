import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:getwork/app/common/widgets/custom_snackbar.dart';
import 'package:getwork/app/modules/auth/login/controllers/login_controller.dart';
import 'package:getwork/app/modules/auth/login/views/login_view.dart';
import 'package:getwork/app/modules/home/api/get_all_jobs_api.dart';
import 'package:getwork/app/modules/home/model/all_job_list_model.dart';
import 'package:getwork/app/modules/home/model/get_all_jobs_model.dart';
import 'package:getwork/app/modules/job_details/views/job_details_view.dart';

class HomeController extends GetxController {
  final loginController = Get.put(LoginController());

  RxBool isLoading = true.obs;

  List<AllJob>? allJobs = [];
  String? jobId;

  @override
  void onInit() {
    jobData();
    super.onInit();
  }

  Future<void> logout() async {
    final storage = FlutterSecureStorage();
    await storage.delete(key: 'token');
    await storage.delete(key: 'userId');
    loginController.setIsLoggedIn(false);
    Get.offAll(() => LoginView());
  }

  void jobData() async {
    await Future.delayed(Duration(seconds: 1));

    JobsModel? response = await GetAllJobsAPI().getJobResponse();
    if (response != null) {
      isLoading(false);
      if (response.allJobs != null) {
        allJobs = response.allJobs;
      }
    } else {
      isLoading(false);
      CustomSnackBar.showErrorSnackBar(
          message: 'Check your internet connection');
    }
  }

  void onJobClick(String? jobDetailsId) {
    Get.to(
      () => JobDetailsView(),
      transition: Transition.rightToLeft,
    );

    jobId = jobDetailsId;
  }
}
