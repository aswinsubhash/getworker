import 'package:get/get.dart';
import 'package:getwork/app/modules/home/views/home_view.dart';
import 'package:getwork/app/modules/sign_up/views/sign_up_view.dart';

class LoginController extends GetxController {

void onLoginClick(){
   Get.off(()=>HomeView());
}

void onLoginWithGoogleClick(){
 
}
}
