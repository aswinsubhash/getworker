import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getwork/app/utils/app_string.dart';
import 'package:getwork/app/utils/colors.dart';
import 'package:getwork/app/utils/app_styles.dart';

import '../controllers/proposals_controller.dart';

class ProposalsView extends GetView<ProposalsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        title: Text(
          AppString.proposalsText,
          style: AppStyle.appBarStyle,
        ),
        centerTitle: true,
        backgroundColor: whiteColor,
        elevation: 0.8,
      ),
      body: Center(
        child: Text(
          'ProposalsView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
