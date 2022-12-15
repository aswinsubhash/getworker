// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:getwork/app/utils/colors.dart';

class TextFieldWidget extends StatelessWidget {
  final double height;
  final double width;
  final String hintText;
  // final TextEditingController controller;

  const TextFieldWidget({
    Key? key,
    required this.height,
    required this.width,
    required this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: TextFormField(
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
