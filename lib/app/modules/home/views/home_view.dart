import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getwork/app/modules/auth/login/controllers/login_controller.dart';
import 'package:getwork/app/modules/splash/views/splash_view.dart';
import 'package:getwork/app/utils/colors.dart';
import 'package:getwork/app/utils/text_style.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView {
  @override
  Widget build(BuildContext context) {
    final homeContrller = Get.put(HomeController());
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        actions: [
          GestureDetector(
          onTap: homeContrller.logout,
            child: Icon(
              Icons.logout,
              color: blackColor,
            ),
          )
        ],
        title: Text('Jobs', style: appBarStyle),
        centerTitle: true,
        backgroundColor: whiteColor,
        elevation: 0.8,
      ),
      body: Center(
        child: Text(
          'JobView is working',
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
