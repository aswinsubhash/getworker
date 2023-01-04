
import 'package:flutter/material.dart';


import 'package:getwork/app/utils/colors.dart';

class SkillsContainer extends StatelessWidget {
  final String? searchTag;
  const SkillsContainer({
    Key? key,
    required this.searchTag,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      decoration: BoxDecoration(
        color: AppColor.searchTagContainer,
        borderRadius: BorderRadius.circular(
          30,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 8,
        ),
        child: Text(searchTag.toString()),
      ),
    );
  }
}
