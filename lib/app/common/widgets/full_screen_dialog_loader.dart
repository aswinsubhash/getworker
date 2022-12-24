import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:getwork/app/utils/colors.dart';

class FullScreenDialogLoader {
  static void showDialog() {
    Get.dialog(
      WillPopScope(
        child: Center(
          child: SpinKitThreeBounce(
            color: greenColor,
            size: 50,
          ),
        ),
        onWillPop: () => Future.value(false),
      ),
      barrierDismissible: false,
      barrierColor: Colors.black.withOpacity(0.3),
      useSafeArea: true,
    );
  }
}
