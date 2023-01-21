import 'package:flutter/material.dart';
import 'package:getwork/app/common/widgets/common_widgets.dart';
import 'package:getwork/app/utils/colors.dart';

class UserInfoAndTitleWidget extends StatelessWidget {
  final String userTitle;
  final String userInfo;
  final VoidCallback onPressed;
  const UserInfoAndTitleWidget({
    Key? key,
    required this.userTitle,
    required this.userInfo,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          commonSizedBox(10),
          Row(
            children: [
              Flexible(
                child: Text(
                  userTitle,
                  style: TextStyle(
                
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              commonWidthBox(10),
              CircleAvatar(
                radius: 15,
                backgroundColor: AppColor.greenColor,
                child: InkWell(
                  onTap: onPressed,
                  child: CircleAvatar(
                    radius: 13,
                    backgroundColor: AppColor.whiteColor,
                    child: Icon(
                      Icons.edit,
                      color: AppColor.blackColor,
                      size: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
          commonSizedBox(10),
          Text(
            userInfo,
            style: TextStyle(
              fontSize: 16,
          
            ),
          ),
          commonSizedBox(15),
        ],
      ),
    );
  }
}
