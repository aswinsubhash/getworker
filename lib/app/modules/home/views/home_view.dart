import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getwork/app/utils/colors.dart';
import 'package:getwork/app/utils/text_style.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        title: Text(
          'Jobs',
          style: appBarStyle
        ),
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
