
import 'package:flutter/material.dart';

class Loader extends StatelessWidget {
  final Color color;
  const Loader({
    Key? key,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: CircularProgressIndicator(
        color: color,
      ),
    );
  }
}
