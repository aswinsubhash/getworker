import 'package:flutter/material.dart';
import 'package:getwork/app/common/widgets/common_widgets.dart';
import 'package:getwork/app/common/widgets/custom_button.dart';
import 'package:getwork/app/utils/colors.dart';

class PlansContainerWidget extends StatelessWidget {
  final String credits;
  final String amount;
  final String planName;
  final VoidCallback onPressed;
  const PlansContainerWidget({
    Key? key,
    required this.credits,
    required this.amount,
    required this.planName,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 200,
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColor.plansContainerColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '$credits Credits',
                style: TextStyle(
                  color: AppColor.whiteColor,
                ),
              ),
              
              Text(
                'Buy for Rs: $amount',
                style: TextStyle(
                  color: AppColor.whiteColor,
                ),
              ),
              commonSizedBox(20),
              Text(
                planName,
                style: TextStyle(
                  color: AppColor.whiteColor,
                  fontSize: 25,
                ),
              ),
              CustomButton(
                text: 'Buy Now',
                onPressed: onPressed,
                textColor: AppColor.whiteColor,
                buttonColor: AppColor.greenColor,
                radius: 5,
              )
            ],
          ),
        ),
      ),
    );
  }
}
