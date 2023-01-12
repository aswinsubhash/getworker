// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:getwork/app/common/widgets/common_widgets.dart';
import 'package:getwork/app/common/widgets/custom_button.dart';
import 'package:getwork/app/utils/colors.dart';

class CustomBottomSheet extends StatelessWidget {
  final String hintTextInfoTitle;
  final String hintTextInfoDescription;
  final TextEditingController infoTitle;
  final TextEditingController infoDescription;
  final VoidCallback onPressed;
  const CustomBottomSheet({
    Key? key,
    required this.hintTextInfoTitle,
    required this.hintTextInfoDescription,
    required this.infoTitle,
    required this.infoDescription,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Container(
        height: size.height * 0.65,
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
            // commonSizedBox(5),
            Row(
              children: [
                IconButton(
                  onPressed: () => Get.back(),
                  icon: Icon(
                    Icons.close_outlined,
                  ),
                ),
                commonWidthBox(100),
                Text(
                  'Edit your info',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                  ),
                )
              ],
            ),
            commonSizedBox(10),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Your title',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  commonSizedBox(10),
                  Text(
                    'Enter a single sentence title of your professional skill/experience(e.g. Self Taught Flutter Developer)',
                    style: TextStyle(height: 1.3),
                  ),
                  commonSizedBox(15),
                  Container(
                    height: 55,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        color: AppColor.dividerColor,
                      ),
                    ),
                    child: TextField(
                      controller: infoTitle,
                      cursorColor: AppColor.greenColor,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 10,
                        ),
                        border: InputBorder.none,
                        hintText: hintTextInfoTitle,
                        hintMaxLines: 3,
                        hintStyle: TextStyle(
                          height: 1.5,
                        ),
                      ),
                      maxLines: 2,
                      keyboardType: TextInputType.text,
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ),
                  commonSizedBox(15),
                  Container(
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        color: AppColor.dividerColor,
                      ),
                    ),
                    child: TextField(
                      controller: infoDescription,
                      cursorColor: AppColor.greenColor,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 10,
                        ),
                        border: InputBorder.none,
                        hintText: hintTextInfoDescription,
                        hintMaxLines: 3,
                        hintStyle: TextStyle(
                          height: 1.5,
                        ),
                      ),
                      maxLines: null,
                      keyboardType: TextInputType.multiline,
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ),
                  commonSizedBox(size.height * 0.05),
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
