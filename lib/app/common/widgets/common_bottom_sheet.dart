import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwork/app/common/widgets/common_widgets.dart';
import 'package:getwork/app/common/widgets/custom_button.dart';
import 'package:getwork/app/utils/colors.dart';

class BottomSheetWithTextFields extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.88,
      color: AppColor.whiteColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              IconButton(
                onPressed: () {
                  Get.back();
                },
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
                  style: TextStyle(
                    fontWeight: FontWeight.bold
                  ),
                ),
                commonSizedBox(10),
                Text(
                  'Enter a single sentence title of your professional skill/experience(e.g. Expert Flutter Developer with Node Js experience)',
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
                    // controller: submitProposalController.coverLetterController,
                    cursorColor: AppColor.greenColor,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      border: InputBorder.none,
                      hintText: 'I am a self taught flutter developer',
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
                commonSizedBox(15),
                Container(
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      color: AppColor.dividerColor,
                    ),
                  ),
                  child: TextField(
                    // controller: submitProposalController.coverLetterController,
                    cursorColor: AppColor.greenColor,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      border: InputBorder.none,
                      hintText:
                          'Enter a detailed description on why the employer should choose you',
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
                commonSizedBox(size.height / 2.5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: 150,
                      child: CustomButton(
                        text: 'Cancel',
                        onPressed: () {Get.back();}, 
                        textColor: AppColor.greenColor,
                        buttonColor: AppColor.whiteColor,
                        radius: 30,
                      ),
                    ),
                    SizedBox(
                      width: 150,
                      child: CustomButton(
                        text: 'Save',
                        onPressed: () {},
                        textColor: AppColor.whiteColor,
                        buttonColor: AppColor.greenColor,
                        radius: 30,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
