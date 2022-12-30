// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:getwork/app/common/widgets/common_widgets.dart';
import 'package:getwork/app/utils/colors.dart';

class JobDetailsTile extends StatelessWidget {
  final String title;
  final String budget;
  final String description;
  final String? proposals;
  final String level;
  const JobDetailsTile({
    Key? key,
    required this.title,
    required this.budget,
    required this.description,
    this.proposals,
    required this.level,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 230,
      // color: greenColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    title,
                    softWrap: true,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'poppins',
                    ),
                  ),
                ),
                CircleAvatar(
                  backgroundColor: dividerColor,
                  child: CircleAvatar(
                    backgroundColor: whiteColor,
                    radius: 16.5,
                    child: Icon(
                      CupertinoIcons.suit_heart,
                      size: 20,
                      color: greenColor,
                    ),
                  ),
                  radius: 18,
                )
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
                      'Budget',
                      style: TextStyle(
                        fontSize: 12,
                        color: dimBlack,
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
                      'Experience Level',
                      style: TextStyle(
                        fontSize: 12,
                        color: dimBlack,
                      ),
                    ),
                  ],
                )
              ],
            ),
            commonSizedBox(15),
            Expanded(
              child: Text(
                description,
                softWrap: false,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
            ),
            Text(
              "Total Proposals : 5",
            ),
          ],
        ),
      ),
    );
  }
}
