import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:getwork/app/utils/colors.dart';

class RichTextWidget extends StatelessWidget {
  final String text;
  final String clickText;
  final VoidCallback onPressed;
  final Color clickTextColor;
  const RichTextWidget({
    Key? key,
    required this.text,
    required this.clickText,
    required this.onPressed,
    required this.clickTextColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: text,
        style: TextStyle(color: Colors.black, fontSize: 15),
        children: <TextSpan>[
          TextSpan(
            text: clickText,
            style: TextStyle(
              color: signUpColor,
              fontSize: 15,
            ),
            recognizer: TapGestureRecognizer()..onTap = onPressed,
          ),
        ],
      ),
    );
  }
}
