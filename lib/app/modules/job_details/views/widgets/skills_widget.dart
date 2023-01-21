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
    return Chip(
      backgroundColor: AppColor.searchTagContainer,
      label: Text(searchTag ?? ''),
      deleteIcon: Icon(
        Icons.close,
        size: 20,
      ),
    );
  }
}
