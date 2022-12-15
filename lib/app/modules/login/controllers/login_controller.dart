import 'package:get/get.dart';
import 'package:getwork/app/modules/home/views/home_view.dart';


class LoginController extends GetxController {

   var isPasswordHidden = true.obs;

void onLoginClick(){
   Get.off(()=>HomeView());
}

void onLoginWithGoogleClick(){
 
}
}
