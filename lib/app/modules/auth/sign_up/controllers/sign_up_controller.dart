import 'package:getwork/app/modules/auth/login/views/login_view.dart';
import 'package:getwork/app/modules/auth/sign_up/api/signup_api.dart';
import 'package:getwork/app/modules/auth/sign_up/model/signup_model.dart';
import 'package:getwork/app/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  var isPasswordHidden = true.obs;

 final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  void createAccountClick() {
    if (formKey.currentState!.validate()) {
      if (passwordController.text != confirmPasswordController.text) {
        Get.showSnackbar(
          GetSnackBar(
            message: "Password do not match",
            backgroundColor: errorColor,
            duration: const Duration(seconds: 3),
            snackStyle: SnackStyle.FLOATING,
          ),
        );
      } else {
        signUp();
      }
    }
  }

  void loginClick() {
    Get.off(() => LoginView());
  }

  String? id;

  void signUp() async {
    SignupModel? response = await SignupAPI().postData(
      nameController.text,
      emailController.text,
      passwordController.text,
    );
    if (response != null) {
      id = response.id;
    }
  }
}
