

import 'package:flutter/material.dart';
import 'package:getwork/app/utils/colors.dart';

class CustomTextFieldWithButton extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final VoidCallback onPressed;
  const CustomTextFieldWithButton({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColor.whiteColor,
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: AppColor.dividerColor,
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: controller,
              cursorColor: AppColor.greenColor,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(
                  bottom: 5,
                  left: 10,
                ),
                hintText: hintText,
                border: InputBorder.none,
              ),
              style: TextStyle(
                fontSize: 15,
              ),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              elevation: 0,
              backgroundColor: AppColor.greenColor,
              minimumSize: Size(50, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(4),
                  bottomRight: Radius.circular(4),
                ),
              ),
            ),
            onPressed: onPressed,
            child: Text('Add'),
          )
        ],
      ),
    );
  }
}
