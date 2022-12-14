import 'package:get/get.dart';
import 'package:getwork/app/modules/login/views/login_view.dart';
import 'package:getwork/app/modules/sign_up/views/sign_up_view.dart';

class LandingController extends GetxController {
  void onLoginClick() {
    Get.to(() => LoginView());
  }

  void onSignUpClick() {
    Get.to(() => SignUpView());
  }
}
