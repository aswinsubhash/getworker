import 'dart:developer';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getwork/app/common/widgets/common_widgets.dart';
import 'package:getwork/app/utils/colors.dart';

class BalanceView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      body: Column(
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
                      '\$16',
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
                          '1225',
                          style: TextStyle(
                            color: AppColor.greenColor,
                          ),
                        ),
                      ],
                    ),
                    RichText(
                      text: TextSpan(
                        text: 'Buy Credits',
                        style: TextStyle(
                          color: AppColor.greenColor,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins'
                        ),
                        recognizer: TapGestureRecognizer()..onTap = () {
                          log('buyconnects working');
                        },
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
    );
  }
}
