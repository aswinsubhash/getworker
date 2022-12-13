import 'package:get/get.dart';
import 'package:getwork/app/modules/landing/views/landing_view.dart';

class SplashController extends GetxController {
 

  
  @override
  void onInit() {
    goToLandingScreen();
    super.onInit();
  }

  void goToLandingScreen() async{
    await Future.delayed(const Duration(seconds: 3));
    Get.off(()=> LandingView());
  }

  void checkUserLoggedIn(){

  }




}
