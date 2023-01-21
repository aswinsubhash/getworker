

import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color textColor;
  final Color buttonColor;
  final double radius;
  

  const CustomButton({
    Key? key,
    required this.text,
    required this.onPressed,
    required this.textColor,
    required this.buttonColor,
    required this.radius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonColor,
        minimumSize: const Size(double.infinity, 40),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
        )
      ),
      child: Text(
        text,
        style:  TextStyle(
          color: textColor,
          fontSize: 15,
         
          fontWeight: FontWeight.bold,
        ),
      ),
      
      
    );
  }
}
