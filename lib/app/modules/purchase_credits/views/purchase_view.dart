import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getwork/app/utils/colors.dart';

class PurchaseView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      body: Center(
        child: Text(
          'PurchaseView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
