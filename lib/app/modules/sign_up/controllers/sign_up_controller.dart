import 'package:get/get.dart';
import 'package:getwork/app/modules/login/views/login_view.dart';

class SignUpController extends GetxController {

  var isPasswordHidden = true.obs;
  void loginClick(){
    Get.to(()=>LoginView());
  }
}
