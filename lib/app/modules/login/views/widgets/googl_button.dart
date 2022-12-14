import 'package:flutter/material.dart';
import 'package:getwork/app/common/widgets/common_widgets.dart';
import 'package:getwork/app/utils/colors.dart';

class GoogleButtonWidget extends StatelessWidget {
  final VoidCallback onPressed;
  const GoogleButtonWidget({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          CircleAvatar(
            radius: 15,
            backgroundColor: whiteColor,
            child: Image(
              height: 20,
              width: 20,
              image: AssetImage(
                'assets/images/google_icon.png',
              ),
            ),
          ),
          commonWidthBox(12),
          Text(
            'Log In with Google',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: googleButtonColor,
        minimumSize: const Size(double.infinity, 40),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
  }
}
