import 'package:flutter/cupertino.dart';
import 'package:getwork/app/utils/colors.dart';

const TextStyle appBarStyle = TextStyle(
  color: blackColor,
  fontFamily: 'Poppins',
);

const TextStyle logoNameStyle = TextStyle(
  fontFamily: 'Poppins',
  fontSize: 30,
  color: greenColor,
  fontWeight: FontWeight.w600,
);

const TextStyle subTextStyle = TextStyle(
  fontSize: 18.5,
  fontWeight: FontWeight.w500,
  fontFamily: 'Poppins',
);

const TextStyle resetAndOtpStyle = TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.w500,
  fontFamily: 'Poppins',
);

const BoxDecoration backgroundImage = BoxDecoration(
  image: DecorationImage(
    image: AssetImage("assets/images/login.png"),
    opacity: 0.1,
    fit: BoxFit.contain,
  ),
);
