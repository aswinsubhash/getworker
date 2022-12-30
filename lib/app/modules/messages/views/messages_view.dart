import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getwork/app/utils/app_string.dart';
import 'package:getwork/app/utils/colors.dart';
import 'package:getwork/app/utils/app_styles.dart';

import '../controllers/messages_controller.dart';

class MessagesView extends GetView<MessagesController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        title: Text(
          AppString.messageText,
          style:  AppStyle.appBarStyle,
        ),
        centerTitle: true,
        backgroundColor: whiteColor,
        elevation: 0.8,
      ),
      body: Center(
        child: Text(
          'MessagesView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
