import 'dart:developer';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwork/app/common/widgets/common_widgets.dart';
import 'package:getwork/app/modules/my_dash/controllers/my_dash_controller.dart';
import 'package:getwork/app/utils/colors.dart';

class BalanceView extends GetView {
  final myDashController = Get.put(MyDashController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      body: Obx(
        () => RefreshIndicator(
          onRefresh: myDashController.getMydashDetails,
          color: AppColor.greenColor,
          displacement: 30.0,
          child: ListView(
            children: [
              commonSizedBox(15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text('Earnings available now: '),
                        Text(
                          '\$${myDashController.totalEarned}',
                          style: TextStyle(
                            color: AppColor.greenColor,
                          ),
                        )
                      ],
                    ),
                    commonSizedBox(10),
                    Row(
                      children: [
                        Text('Pending Withdraw: '),
                        Text(
                          '\$${myDashController.pendingWithdraw}',
                          style: TextStyle(
                            color: AppColor.greenColor,
                          ),
                        )
                      ],
                    ),
                    commonSizedBox(10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text('Credits available now: '),
                            Text(
                              myDashController.credits.value.toString(),
                              style: TextStyle(
                                color: AppColor.greenColor,
                              ),
                            ),
                          ],
                        ),
                        RichText(
                          text: TextSpan(
                            text: 'Purchase Credits',
                            style: TextStyle(
                                color: AppColor.greenColor,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Poppins'),
                            recognizer: TapGestureRecognizer()
                              ..onTap = myDashController.onBuyCreditsClick,
                          ),
                        ),
                      ],
                    ),
                    commonSizedBox(10)
                  ],
                ),
              ),
              commonDivider(0.8),
            ],
          ),
        ),
      ),
    );
  }
}
