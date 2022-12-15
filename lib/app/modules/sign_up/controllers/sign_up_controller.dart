
import 'dart:developer';
import 'package:getwork/app/utils/colors.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:getwork/app/modules/sign_up/model/signup_model.dart';

class SignUpController extends GetxController {
  var isPasswordHidden = true.obs;
  void createAccountClick() {
    // Get.to(() => LoginView());
    if (formKey.currentState!.validate()) {
      postData(
        name: nameController.text,
        email: emailController.text,
        password: passwordController.text,
        userType: 'employee',
      );
    }
  }

  final formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  dynamic statusCode;

  Future<SignupModel?> postData({
    required String name,
    required String email,
    required String password,
    required String userType,
  }) async {
    try {
      final SignupModel signupModel = SignupModel(
        name: name,
        email: email,
        password: password,
        userType: userType,
      );
      final request = await http.post(
          Uri.parse('http://10.0.2.2:3001/api/register'),
          body: signupModel.toJson());
      statusCode = request.statusCode;
      if (request.statusCode == 200) {
        log(request.body.toString());
        Get.snackbar(
          'Success',
          'Otp sent successfully',
          backgroundColor: greenColor,
        );
      }
      if (request.statusCode == 404) {
        Get.snackbar(
          'Alert',
          'Email already in use !',
        );
      }
      log(request.statusCode.toString());
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}
