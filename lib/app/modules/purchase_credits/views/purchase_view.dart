import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwork/app/common/widgets/common_widgets.dart';
import 'package:getwork/app/modules/purchase_credits/controllers/purchase_credits_controller.dart';
import 'package:getwork/app/modules/purchase_credits/views/widgets/plans_container_widget.dart';
import 'package:getwork/app/utils/colors.dart';

class PurchaseView extends GetView {
  final purchaseCreditsController = Get.put(PurchaseCreditsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 21),
        child: SingleChildScrollView(
          child: Column(
            children: [
             PlansContainerWidget(
              credits: '100',
              amount: '500.00',
              planName: 'Basic Plan',
              onPressed: (){
              purchaseCreditsController.createOrder();
              },
             ),
            commonSizedBox(20),
             PlansContainerWidget(
              credits: '200',
              amount: '1000.00',
              planName: 'Value Plan',
              onPressed: (){},
             ),
            commonSizedBox(20),
             PlansContainerWidget(
              credits: '500',
              amount: '5000.00',
              planName: 'Premium Plan',
              onPressed: (){},
             ),
            ],
          
          ),
        ),
      ),
    );
  }
}
