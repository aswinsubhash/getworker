import 'package:flutter/material.dart';
import 'package:getwork/app/utils/colors.dart';

commonSizedBox(double height) {
  return SizedBox(
    height: height,
  );
}

commonWidthBox(double width) {
  return SizedBox(
    width: width,
  );
}

commonDivider(double thickness) {
  return Divider(
    color: AppColor.dividerColor,
    thickness: thickness,
  );
}
