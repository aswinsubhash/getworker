import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getwork/app/common/widgets/common_widgets.dart';
import 'package:getwork/app/utils/app_string.dart';
import 'package:getwork/app/utils/colors.dart';
import 'package:getwork/app/utils/app_styles.dart';

import '../controllers/contracts_controller.dart';

class ContractsView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      appBar: AppBar(
        title: Text(
          AppString.contractsText,
          style: AppStyle.appBarStyle,
        ),
        centerTitle: true,
        backgroundColor: AppColor.whiteColor,
        elevation: 0.8,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          commonSizedBox(20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Text('Earnings available now :'),
                Text(
                  '\$0.00',
                  style: TextStyle(
                    color: AppColor.greenColor,
                  ),
                )
              ],
            ),
          ),
          commonSizedBox(15),
          commonDivider(0.8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Active Contracts',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
