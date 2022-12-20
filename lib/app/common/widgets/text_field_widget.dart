import 'package:flutter/material.dart';

import 'package:getwork/app/utils/colors.dart';

class TextFieldWidget extends StatelessWidget {
  final double height;
  final double width;
  final String hintText;
  final TextEditingController controller;
  final String validationMessage;
  final String? checkValidationMessage;

  TextFieldWidget({
    Key? key,
    required this.height,
    required this.width,
    required this.hintText,
    required this.controller,
    required this.validationMessage,
    this.checkValidationMessage
  }) : super(key: key);

 

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: TextFormField(
        validator: (value) {
          if (value == null || value.isEmpty) {
            return validationMessage;
          } else {
            if (!RegExp(r'.+@.+\.com$').hasMatch(value)) {
              
              return checkValidationMessage;
            } 
          }
          return null;
        },
        controller: controller,
        cursorColor: greenColor,
        style: TextStyle(
          fontSize: 15,
        ),
        decoration: InputDecoration(
          hintText: hintText,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: greenColor,
            ),
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
          contentPadding: EdgeInsets.all(8.0),
        ),
      ),
    );
  }
}
