import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getwork/app/common/widgets/common_widgets.dart';
import 'package:getwork/app/modules/my_dash/controllers/my_dash_controller.dart';
import 'package:getwork/app/utils/colors.dart';

class ActiveContractsView extends GetView {
  final myDashController = Get.put(MyDashController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          commonSizedBox(15),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
            ),
            child: Wrap(
              children: [
                Text('Contracts youre actively working on will appear here.'),
              ],
            ),
          ),
          commonSizedBox(10),
          commonDivider(0.8),
        ],
      ),
    );
  }
}
