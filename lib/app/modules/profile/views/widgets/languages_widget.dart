import 'package:flutter/material.dart';
import 'package:getwork/app/common/widgets/common_widgets.dart';
import 'package:getwork/app/utils/colors.dart';

class LanguagesWidget extends StatelessWidget {
  final List<dynamic> list;
  final VoidCallback onPressed;

  const LanguagesWidget({
    Key? key,
    required this.list,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          commonSizedBox(5),
          Row(
            children: [
              Text(
                'Languages',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              commonWidthBox(10),
              CircleAvatar(
                radius: 15,
                backgroundColor: AppColor.greenColor,
                child: InkWell(
                  onTap: () {},
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
          //commonSizedBox(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(
              list.isEmpty ? list.length = 1 : list.length,
              (index) {
                return Column(
                  children: [
                    commonSizedBox(8),
                    Text(
                      list[index]?.language ?? 'Add your languages here',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          commonSizedBox(10),
        ],
      ),
    );
  }
}
