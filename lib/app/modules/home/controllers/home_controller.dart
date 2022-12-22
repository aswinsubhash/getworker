import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:getwork/app/modules/auth/login/controllers/login_controller.dart';
import 'package:getwork/app/modules/splash/views/splash_view.dart';

class HomeController extends GetxController {

final loginController = Get.put(LoginController());

Future<void>logout()async{
  final storage = FlutterSecureStorage();
  await storage.delete(key: 'token');
  loginController.setIsLoggedIn(false);
  Get.offAll(()=>SplashView());
}
}
