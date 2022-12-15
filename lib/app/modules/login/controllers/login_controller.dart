import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:getwork/app/modules/home/views/home_view.dart';


class LoginController extends GetxController {

   var isPasswordHidden = true.obs;
   final TextEditingController emailController = TextEditingController();
   final TextEditingController passwordController = TextEditingController();
   final formKey = GlobalKey<FormState>();

void onLoginClick(){
  if(formKey.currentState!.validate()){

  }
}


}
