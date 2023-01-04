import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:getwork/app/utils/colors.dart';

class FullScreenDialogLoader {
  static void showLoading() {
    Get.dialog(
      Center(
        child: SpinKitThreeBounce(
          color: AppColor.greenColor,
        ),
      ),
    );
  }

  static void hideLoading() {
    if (Get.isDialogOpen!) Get.back();
  }
}
