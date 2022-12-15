import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:getwork/app/modules/sign_up/controllers/sign_up_controller.dart';
import 'package:getwork/app/utils/colors.dart';

class PasswordTextField extends GetView<SignUpController> {
  final String hintText;
  PasswordTextField({
    required this.hintText,
  });
  @override
  Widget build(BuildContext context) {
    final signUpController = Get.put(SignUpController());
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        Obx(
          () => SizedBox(
            height: 50,
            width: size.width * 0.9,
            child: TextFormField(
              cursorColor: greenColor,
              obscureText: signUpController.isPasswordHidden.value,
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
