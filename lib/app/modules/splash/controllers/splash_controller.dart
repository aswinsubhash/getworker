import 'package:get/get.dart';
import 'package:getwork/app/modules/auth/login/views/login_view.dart';
import 'package:getwork/app/modules/auth/otp/model/otp_model.dart';
import 'package:getwork/app/modules/auth/otp/views/otp_view.dart';
import 'package:getwork/app/modules/auth/reset_password/views/reset_password_view.dart';

class SplashController extends GetxController {
 

  
  @override
  void onInit() {
    goToLandingScreen();
    super.onInit();
  }

  void goToLandingScreen() async{
    await Future.delayed(const Duration(seconds: 3));
    Get.off(()=> ResetPasswordView());
  }

  void checkUserLoggedIn(){

  }




}
