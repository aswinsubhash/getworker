import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwork/app/common/widgets/common_widgets.dart';
import 'package:getwork/app/modules/auth/login/controllers/login_controller.dart';
import 'package:getwork/app/modules/home/views/widgets/job_tile_widget.dart';
import 'package:getwork/app/modules/home/views/widgets/custom_search_bar.dart';
import 'package:getwork/app/utils/colors.dart';
import 'package:getwork/app/utils/text_style.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView {
  final homeContrller = Get.put(HomeController());
  final loginController = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        actions: [
          GestureDetector(
            onTap: homeContrller.logout,
            child: Icon(
              Icons.logout,
              color: blackColor,
            ),
          )
        ],
        title: Text(
          'Jobs',
          style: appBarStyle,
        ),
        centerTitle: true,
        backgroundColor: whiteColor,
        elevation: 0.8,
      ),
      body: Column(
        children: [
          commonSizedBox(20),
          Center(
            child: SizedBox(
              width: size.width * 0.95,
              height: 45,
              child: CustomSearchBar(
                hintText: 'Search for job',
                onPressed: () {},
              ),
            ),
          ),
          commonSizedBox(12),
          commonDivider(0.7),
          Expanded(
            child: Obx(
              () => homeContrller.isLoading.value // 34:28
                  ? Center(
                      child: CircularProgressIndicator(
                      color: greenColor,
                    ))
                  : ListView.separated(
                      separatorBuilder: (context, index) => commonDivider(0.7),
                      itemCount: homeContrller.allJobs.length,
                      itemBuilder: (context, index) {
                        return JobDetailsTile(
                          title: homeContrller.allJobs[index].title,
                          budget:
                              homeContrller.allJobs[index].budget.toString(),
                          description: homeContrller.allJobs[index].description,
                          level:
                              homeContrller.allJobs[index].level.toUpperCase(),
                        );
                      },
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
