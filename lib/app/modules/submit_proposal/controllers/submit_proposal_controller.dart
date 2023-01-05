import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:getwork/app/common/widgets/custom_snackbar.dart';
import 'package:getwork/app/common/widgets/full_screen_dialog_loader.dart';
import 'package:getwork/app/modules/home/views/home_view.dart';
import 'package:getwork/app/modules/job_details/controllers/job_details_controller.dart';
import 'package:getwork/app/modules/submit_proposal/api/submit_proposal_api.dart';
import 'package:getwork/app/modules/submit_proposal/model/submit_proposal_model.dart';

class SubmitProposalController extends GetxController {
  final TextEditingController coverLetterController = TextEditingController();
  final TextEditingController budgetBidController = TextEditingController();
  final TextEditingController daysController = TextEditingController();

  final jobDetailsController = Get.put(JobDetailsController());
  onSubmitClick() async {
    if (coverLetterController.text.isEmpty ||
        coverLetterController.text.trim().isEmpty) {
      CustomSnackBar.showErrorSnackBar(message: 'Fill the cover letter');
    } else if (budgetBidController.text.isEmpty) {
      CustomSnackBar.showErrorSnackBar(message: 'Fill the bid');
    } else if (daysController.text.isEmpty) {
      CustomSnackBar.showErrorSnackBar(message: 'Fill the days');
    } else {
      FullScreenDialogLoader.showLoading();
      SubmitProposalModel? response = await SubmitProposalAPI().postData(
        coverLetterController.text,
        budgetBidController.text,
        daysController.text,
        jobDetailsController.jobId.toString(),
      );
      FullScreenDialogLoader.hideLoading();
      Get.offAll(() => HomeView(), transition: Transition.fade);
      CustomSnackBar.showSuccessSnackBar(message: 'Proposal submitted');
      print(response!.proposal!.id);
      print(response.job?.title);
    }
  }
}
