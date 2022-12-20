// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:getwork/app/modules/auth/sign_up/controllers/sign_up_controller.dart';
import 'package:getwork/app/utils/colors.dart';

class PasswordTextField extends GetView {
  final String hintText;
  final String validationMessage;
  final String? controllerText;
  final String? minPassText;
  final String type;
  @override
  final TextEditingController controller;
  PasswordTextField(
      {required this.hintText,
      required this.validationMessage,
      this.controllerText,
      this.minPassText,
      required this.controller,
      required this.type});

  @override
  Widget build(BuildContext context) {
    final signUpController = Get.put(SignUpController());
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        Obx(
          () => SizedBox(
            height: 75,
            width: size.width * 0.9,
            child: TextFormField(
              controller: controller,
              cursorColor: greenColor,
              obscureText: signUpController.isPasswordHidden.value,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return validationMessage;
                } else {
                  if (value.length < 6) {
                    return minPassText;
                  }
                }
                return null;
              },
              onChanged: (value) => type == 'Password'
                  ? signUpController.password.value = value
                  : (value) => signUpController.confirmPassword.value,
              style: TextStyle(
                fontSize: 15,
              ),
              decoration: InputDecoration(
                hintText: hintText,
                suffix: InkWell(
                  child: Icon(
                    signUpController.isPasswordHidden.value
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                    color: signUpController.isPasswordHidden.value
                        ? greyColor
                        : greenColor,
                    size: 20,
                  ),
                  onTap: () {
                    signUpController.isPasswordHidden.value =
                        !signUpController.isPasswordHidden.value;
                  },
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: greenColor,
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                contentPadding: EdgeInsets.all(8.0),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
