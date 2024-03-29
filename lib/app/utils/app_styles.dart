import 'package:flutter/cupertino.dart';
import 'package:getwork/app/utils/colors.dart';

class AppStyle {
  static const TextStyle appBarStyle = TextStyle(
    color: AppColor.blackColor,
  );

  static const TextStyle logoNameStyle = TextStyle(
    fontSize: 30,
    color: AppColor.greenColor,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle subTextStyle = TextStyle(
    fontSize: 18.5,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle resetAndOtpStyle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w500,
  );

  static const BoxDecoration backgroundImage = BoxDecoration(
    image: DecorationImage(
      image: AssetImage("assets/images/login.png"),
      opacity: 0.1,
      fit: BoxFit.contain,
    ),
  );
}
