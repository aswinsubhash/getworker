import 'package:get/get.dart';
import 'package:getwork/app/common/widgets/custom_snackbar.dart';
import 'package:getwork/app/modules/proposals/api/proposal_api.dart';
import 'package:getwork/app/modules/proposals/model/proposal_model.dart';

class ProposalsController extends GetxController {
  RxBool isLoading = true.obs;

  List<Proposal>? myProposals = [];
 List<Proposal>?reversedProposals ; 

  @override
  void onInit() {
    getAllProposals();
    super.onInit();
  }

  void getAllProposals() async {
    ProposalsModel? response = await ProposalsAPI().getMyProposals();

    if (response != null) {
      isLoading(false);
      if (response.proposals != null) {
         myProposals = response.proposals;
        // print(myProposals);
      reversedProposals = myProposals?.reversed.toList();
     
      }
    } else {
      isLoading(false);
      CustomSnackBar.showErrorSnackBar(
          message: 'Check your internet connection');
    }
  }
}
