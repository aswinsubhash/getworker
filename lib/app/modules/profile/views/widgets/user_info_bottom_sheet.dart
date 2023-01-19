import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:getwork/app/common/widgets/common_widgets.dart';
import 'package:getwork/app/common/widgets/custom_button.dart';
import 'package:getwork/app/utils/colors.dart';

class CustomEducationBottomSheet extends StatelessWidget {
  final String hintTextInfoTitle;
  final String hintTextInfoDescription;
  final TextEditingController schoolNameController;
  final TextEditingController degreeController;
  final VoidCallback onPressed;
  const CustomEducationBottomSheet({
    Key? key,
    required this.hintTextInfoTitle,
    required this.hintTextInfoDescription,
    required this.schoolNameController,
    required this.degreeController,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Container(
        height: size.height * 0.35,
        // color: AppColor.whiteColor,
        decoration: BoxDecoration(
          color: AppColor.whiteColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () => Get.back(),
                  icon: Icon(
                    Icons.close_outlined,
                  ),
                ),
                commonWidthBox(105),
                Text(
                  'Add education',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  commonSizedBox(15),
                  Container(
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        color: AppColor.dividerColor,
                      ),
                    ),
                    child: TextField(
                      controller: schoolNameController,
                      cursorColor: AppColor.greenColor,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 10,
                        ),
                        border: InputBorder.none,
                        hintText: hintTextInfoTitle,
                      ),
                      maxLines: 1,
                      keyboardType: TextInputType.text,
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ),
                  commonSizedBox(15),
                  Container(
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        color: AppColor.dividerColor,
                      ),
                    ),
                    child: TextField(
                      controller: degreeController,
                      cursorColor: AppColor.greenColor,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 10,
                        ),
                        border: InputBorder.none,
                        hintText: hintTextInfoDescription,
                      ),
                      keyboardType: TextInputType.text,
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ),
                  commonSizedBox(size.height * 0.04),
                  CustomButton(
                    text: 'Save',
                    onPressed: onPressed,
                    textColor: AppColor.whiteColor,
                    buttonColor: AppColor.greenColor,
                    radius: 30,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
