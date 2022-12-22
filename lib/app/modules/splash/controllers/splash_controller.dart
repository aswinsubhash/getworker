import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:getwork/app/modules/auth/login/controllers/login_controller.dart';
import 'package:getwork/app/modules/auth/login/views/login_view.dart';
import 'package:getwork/app/modules/dashboard/views/dashboard_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashController extends GetxController {
  final loginController = Get.put(LoginController());

  @override
  void onInit() {
   // goToLandingScreen();
   checkUserLoggedIn();
    super.onInit();
  }

  void goToLandingScreen() async {
    await Future.delayed(const Duration(seconds: 3));
    Get.off(() => LoginView());
  }

  Future<void> checkUserLoggedIn()async{
    final storage = FlutterSecureStorage();
    String? token = await storage.read(key: 'token');
    if(token != null){
      loginController.setIsLoggedIn(true);
    }else{
      loginController.setIsLoggedIn(false);
    }

    if(loginController.isLoggedIn.value){
      await Future.delayed(const Duration(seconds: 3));
      Get.off(()=>DashboardView());
    }else{
      await Future.delayed(const Duration(seconds: 3));
      Get.off(()=>LoginView());
    }
  }
  
}
