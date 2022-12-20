import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:getwork/app/modules/auth/login/controllers/login_controller.dart';
import 'package:getwork/app/utils/colors.dart';

class PasswordLoginTextField extends GetView {
  final String hintText;
  final String validationMessage;
   @override
  final TextEditingController controller;
  PasswordLoginTextField({
    required this.hintText,
    required this.validationMessage,
    required this.controller,
  });
  @override
  Widget build(BuildContext context) {
    final loginController = Get.put(LoginController());
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        Obx(
          () => SizedBox(
            height: 70,
            width: size.width * 0.9,
            child: TextFormField(
              controller: controller,
              cursorColor: greenColor,
              obscureText: loginController.isPasswordHidden.value,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return validationMessage;
                }
                return null;
              },
              style: TextStyle(
                fontSize: 15,
              ),
              decoration: InputDecoration(
                hintText: hintText,
                suffix: InkWell(
                  child: Icon(
                    loginController.isPasswordHidden.value
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                    color: loginController.isPasswordHidden.value
                        ? greyColor
                        : greenColor,
                    size: 20,
                  ),
                  onTap: () {
                    loginController.isPasswordHidden.value =
                        !loginController.isPasswordHidden.value;
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
