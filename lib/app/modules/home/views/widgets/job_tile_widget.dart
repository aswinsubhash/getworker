// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:getwork/app/common/widgets/common_widgets.dart';
import 'package:getwork/app/modules/home/controllers/home_controller.dart';
import 'package:getwork/app/utils/colors.dart';

class JobDetailsTile extends StatelessWidget {
  final String title;
  final String budget;
  final String description;
  final String? proposals;
  final String level;
  final String deadline;
  const JobDetailsTile({
    Key? key,
    required this.title,
    required this.budget,
    required this.description,
    this.proposals,
    required this.level,
    required this.deadline,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: Get.height / 6.4,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: AppColor.whiteColor,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            commonSizedBox(8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    title,
                    softWrap: true,
                    // maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                     
                    ),
                  ),
                ),
              ],
            ),
            commonSizedBox(15),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '\$$budget',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    commonSizedBox(5),
                    Text(
                      'Est.Budget',
                      style: TextStyle(
                        fontSize: 12,
                        color: AppColor.dimBlack,
                      ),
                    ),
                  ],
                ),
                commonWidthBox(150),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      level,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    commonSizedBox(5),
                    Text(
                      'Difficulty',
                      style: TextStyle(
                        fontSize: 12,
                        color: AppColor.dimBlack,
                      ),
                    ),
                  ],
                )
              ],
            ),
            commonSizedBox(10),
            Text(
              "Deadline : $deadline days",
              style: TextStyle(fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}
