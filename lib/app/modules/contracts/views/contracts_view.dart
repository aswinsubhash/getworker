import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getwork/app/utils/app_string.dart';
import 'package:getwork/app/utils/colors.dart';
import 'package:getwork/app/utils/app_styles.dart';


import '../controllers/contracts_controller.dart';

class ContractsView extends GetView<ContractsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      appBar: AppBar(
        title: Text(
          AppString.contractsText,
          style:  AppStyle.appBarStyle,
        ),
        centerTitle: true,
        backgroundColor: AppColor.whiteColor,
        elevation: 0.8,
      ),
      body: Center(
        child: Text(
          'ContractsView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
