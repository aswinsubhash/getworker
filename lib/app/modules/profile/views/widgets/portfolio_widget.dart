import 'package:flutter/material.dart';

import 'package:getwork/app/common/widgets/common_widgets.dart';
import 'package:getwork/app/utils/colors.dart';

class PortfolioWidget extends StatelessWidget {
  final List<dynamic> list;
  final VoidCallback onPressed;
  final VoidCallback imageClick;
  const PortfolioWidget({
    Key? key,
    required this.list,
    required this.onPressed,
    required this.imageClick,
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
                'Portfolio',
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
                  onTap: onPressed,
                  child: CircleAvatar(
                    radius: 13,
                    backgroundColor: AppColor.whiteColor,
                    child: Icon(
                      Icons.add,
                      color: AppColor.blackColor,
                      size: 16,
                    ),
                  ),
                ),
              )
            ],
          ),
          commonSizedBox(15),
          Wrap(
            direction: Axis.horizontal,
            spacing: 10.0,
            runSpacing: 10.0,
            children: List.generate(
              list.length,
              (index) {
                return InkWell(
                  onTap: imageClick,
                  child: Container(
                    width: 170,
                    height: 110,
                    decoration: BoxDecoration(
                      color: AppColor.greyColor,
                      image: DecorationImage(
                        image: NetworkImage(
                          list[index]?.image ?? '',
                        ),
                        fit: BoxFit.fill,
                      ),
                      borderRadius: BorderRadius.circular(
                        10,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
           commonSizedBox(30)
        ],
      ),
    );
  }
}
