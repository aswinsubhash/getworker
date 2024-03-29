import 'package:get/get.dart';
import 'package:getwork/app/common/widgets/full_screen_dialog_loader.dart';
import 'package:getwork/app/modules/dashboard/views/dashboard_view.dart';
import 'package:getwork/app/modules/home/api/get_all_jobs_api.dart';
import 'package:getwork/app/modules/home/controllers/home_controller.dart';
import 'package:getwork/app/modules/job_details/api/job_details_api.dart';
import 'package:getwork/app/modules/job_details/model/job_details_model.dart';
import 'package:getwork/app/modules/profile/controllers/profile_controller.dart';
import 'package:getwork/app/modules/submit_proposal/views/submit_proposal_view.dart';

class JobDetailsController extends GetxController {
  final homeController = Get.put(HomeController());

  RxBool isLoading = true.obs;
  RxString jobId = ''.obs;
  RxString jobTitle = ''.obs;
  RxString description = ''.obs;
  RxInt budget = 0.obs;
  RxString level = ''.toUpperCase().obs;
  RxInt deadline = 0.obs;
  List<String>? searchTag = [];
  List<Proposal>? proposals = [];
  var isClicked = false.obs;

  @override
  void onInit() {
    jobDetails();
    super.onInit();
  }

  void jobDetails() async {
    JobDetailsModel? response =
        await JobDetailsAPI().getJobDetails(homeController.jobId);

    if (response != null) {
      isLoading(false);
      jobTitle.value = response.title.toString();
      description.value = response.description.toString();
      budget.value = response.budget ?? 0;
      level.value = response.level ?? '';
      deadline.value = response.deadline ?? 0;
      searchTag = response.searchTag;
      proposals = response.proposals;
      jobId.value = response.id.toString();
      print(jobId);
    } else {
      isLoading(false);
    }
  }

  void onSubmitProposal() {
    Get.to(
      () => SubmitProposalView(),
      transition: Transition.rightToLeft,
    );
  }

  Future<void> saveJobs() async {
    isClicked(true);
    FullScreenDialogLoader.showLoading();
    await GetAllJobsAPI().saveJobs(jobId.value);
    Get.find<ProfileController>().getProfie();
    FullScreenDialogLoader.hideLoading();
    Get.off(()=>DashboardView());
    print(jobId);
  }
}
