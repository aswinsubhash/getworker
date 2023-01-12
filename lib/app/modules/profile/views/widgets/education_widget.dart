
import 'package:flutter/material.dart';

import 'package:getwork/app/common/widgets/common_widgets.dart';
import 'package:getwork/app/utils/colors.dart';

class EducationWidget extends StatelessWidget {
  final List<dynamic> educationList;
  final VoidCallback onPressed;
  const EducationWidget({
    Key? key,
    required this.onPressed,
    required this.educationList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           commonSizedBox(5),
          Row(
            children: [
              Text(
                'Education',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              commonWidthBox(10),
              CircleAvatar(
                radius: 15,
                backgroundColor: AppColor.greenColor,
                child: InkWell(
                  onTap: () {},
                  child: CircleAvatar(
                    radius: 13,
                    backgroundColor: AppColor.whiteColor,
                    child: Icon(
                      Icons.edit,
                      color: AppColor.blackColor,
                      size: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
          commonSizedBox(8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(
              educationList.isEmpty ? educationList.length = 1  : educationList.length,
              (index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      educationList[index]?.school ??
                          'Add your education details here',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontFamily: 'Poppins'),
                    ),
                    commonSizedBox(5),
                    Text(
                      educationList[index]?.title ?? '',
                    ),
                    commonSizedBox(10)
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
