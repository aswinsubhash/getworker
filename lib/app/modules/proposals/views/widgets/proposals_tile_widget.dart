import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwork/app/common/widgets/common_widgets.dart';

import 'package:getwork/app/utils/colors.dart';

class ProposalTileWidget extends StatelessWidget {
  final String coverText;
  final String bidAmout;
  final String daysToComplete;
  const ProposalTileWidget({
    Key? key,
    required this.coverText,
    required this.bidAmout,
    required this.daysToComplete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: Get.height / 9,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: AppColor.whiteColor,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 5,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Wrap(
                  children: [
                    Text(
                      coverText,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                commonSizedBox(6),
                Row(
                  children: [
                    Text(
                      'Your Bid is: ',
                      style: TextStyle(),
                    ),
                    Text(
                      bidAmout,
                      style: TextStyle(
                        color: AppColor.greenColor,
                      ),
                    ),
                  ],
                ),
                commonSizedBox(6),
                Row(
                  children: [
                    Text(
                      'Complete Before:',
                      style: TextStyle(),
                    ),
                    Text(
                      daysToComplete,
                      style: TextStyle(
                        color: AppColor.greenColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
