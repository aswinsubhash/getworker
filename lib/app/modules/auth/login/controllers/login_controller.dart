import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:getwork/app/common/widgets/full_screen_dialog_loader.dart';
import 'package:getwork/app/modules/auth/login/api/login_api.dart';
import 'package:getwork/app/modules/auth/login/model/login_model.dart';
import 'package:getwork/app/modules/auth/sign_up/views/sign_up_view.dart';
import 'package:getwork/app/utils/colors.dart';


class LoginController extends GetxController {
  var isPasswordHidden = true.obs;
  final isLoggedIn = false.obs;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
 final GlobalKey<FormState> formKeyLogin = GlobalKey<FormState>();

  void onLoginClick() {
    if (formKeyLogin.currentState!.validate()) {
      login();
    }
  }

 
  String? tokenId;
  String? userId;

  void login() async {
   
    LoginModel? response = await LoginAPI().postData(
      emailController.text,
      passwordController.text,
    );
    if (response != null) {
      tokenId = response.token;
      userId = response.id;
    }

    tokenSaving();
    log(tokenId.toString());
  }

  void forgotPasswordClick() {
    if(emailController.text.isEmpty){
       Get.showSnackbar(
          const GetSnackBar(
            message: "Enter your email", 
            backgroundColor: AppColor.errorColor,
            duration: Duration(seconds: 3),
            snackStyle: SnackStyle.FLOATING,
          ),
        );
    }else{
       LoginAPI().patchData(emailController.text);
   
    }
   
  }

  void onSignUpClick() {
    Get.off(() => SignUpView());
  }

  void setIsLoggedIn(bool value) {
    isLoggedIn.value = value;
  }

  Future<void> tokenSaving() async {
    final storage = FlutterSecureStorage();
    await storage.write(key: 'token', value: tokenId);
    await storage.write(key: 'userId', value: userId);
    final userid = await storage.read(key: 'userId');
    print(userid);
    setIsLoggedIn(true);
  }

  showLoading([String? message]){
    FullScreenDialogLoader.showLoading();
  }

  hideLoading(){
    FullScreenDialogLoader.hideLoading();
  }


}


