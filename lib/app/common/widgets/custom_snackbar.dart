import 'package:get/get.dart';
import 'package:getwork/app/utils/colors.dart';

class CustomSnackBar {
  //error bottom snackbar
  static void showErrorSnackBar({
    required String message,
  }) {
    Get.showSnackbar(
      GetSnackBar(
        message: message,
        backgroundColor: AppColor.errorColor,
        duration: Duration(seconds: 3),
        snackStyle: SnackStyle.FLOATING,
      ),
    );
  }

//success bottom snackbar
  static void showSuccessSnackBar({
    required String message,
  }) {
    Get.showSnackbar(
      GetSnackBar(
        message: message,
        backgroundColor: AppColor.greenColor,
        duration: Duration(seconds: 3),
        snackStyle: SnackStyle.FLOATING,
      ),
    );
  }

//welcome top snackbar
  static void welcomeSnackBar({
    required String message,
  }) {
    Get.snackbar(
      'Welcome to GETWORKER',
      message,
      backgroundColor: AppColor.greenColor,
      colorText: AppColor.whiteColor,
    );
  }
}
