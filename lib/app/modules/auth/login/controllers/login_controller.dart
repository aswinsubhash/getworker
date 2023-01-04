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

  void login() async {
   
    LoginModel? response = await LoginAPI().postData(
      emailController.text,
      passwordController.text,
    );
    if (response != null) {
      tokenId = response.token;
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
    setIsLoggedIn(true);
  }

  showLoading([String? message]){
    FullScreenDialogLoader.showLoading();
  }

  hideLoading(){
    FullScreenDialogLoader.hideLoading();
  }


}

//  // Function called when login button is clicked
//   void onLoginClick() {
//     // Validate the form
//     if (formKeyLogin.currentState!.validate()) {
//       // If form is valid, call login function
//       login();
//     }
//   }

//   // Variable to hold the returned token
//   String? tokenId;

//   // Function to make the login API call and save the returned token
//   void login() async {
//     // Make the login API call
//     LoginModel? response = await LoginAPI().postData(
//       emailController.text,
//       passwordController.text,
//     );
//     // If a response is received, save the token
//     if (response != null) {
//       tokenId = response.token;
//     }

//     // Save the token to secure storage
//     tokenSaving();
//     // Log the token
//     log(tokenId.toString());
//   }

//   // Function called when the forgot password button is clicked
//   void forgotPasswordClick() {
//     // Check if the email field is empty
//     if(emailController.text.isEmpty){
//        // If it is, display a snackbar message
//        Get.showSnackbar(
//           const GetSnackBar(
//             message: "Enter your email", 
//             backgroundColor: errorColor,
//             duration: Duration(seconds: 3),
//             snackStyle: SnackStyle.FLOATING,
//           ),
//         );
//     }else{
//       // If the email field is not empty, make an API call to send a password reset email
//       LoginAPI().patchData(emailController.text);
   
//     }
   
//   }

//   // Function called when the sign up button is clicked
//   void onSignUpClick() {
//     // Navigate to the sign up view
//     Get.off(() => SignUpView());
//   }

//   // Function to update the value of the isLoggedIn observable
//   void setIsLoggedIn(bool value) {
//     isLoggedIn.value = value;
//   }
