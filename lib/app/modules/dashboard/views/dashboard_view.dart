
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:getwork/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:getwork/app/modules/home/views/home_view.dart';
import 'package:getwork/app/modules/messages/views/messages_view.dart';
import 'package:getwork/app/modules/my_dash/views/my_dash_view.dart';
import 'package:getwork/app/modules/profile/views/profile_view.dart';
import 'package:getwork/app/modules/proposals/views/proposals_view.dart';
import 'package:getwork/app/utils/colors.dart';

class DashboardView extends GetView {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(
      builder: (controller) {
        return Scaffold(
          body: SafeArea(
            child: IndexedStack(
              index: controller.tabIndex,
              children: [
                HomeView(),
                ProposalsView(),
                MyDashView(),
                MessagesView(),
                ProfileView(),
              ],
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            unselectedItemColor:  AppColor.blackColor,
            selectedItemColor: AppColor.greenColor,
            onTap: controller.changeTabIndex,
            currentIndex: controller.tabIndex,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            type: BottomNavigationBarType.fixed,
            backgroundColor: AppColor.whiteColor,
            elevation: 0,
            selectedFontSize: 10,
            unselectedFontSize: 11,
            items: [
              bottomNavigationBarItem(
                icon: CupertinoIcons.search,
                label: 'Jobs',
              ),
               bottomNavigationBarItem(
                icon: CupertinoIcons.doc_checkmark,
                label: 'Proposals',
              ),
               bottomNavigationBarItem(
                icon: Icons.dashboard_outlined,
                label: 'My dash',
              ),
               bottomNavigationBarItem(
                icon: CupertinoIcons.chat_bubble_2,
                label: 'Messages',
              ),
               bottomNavigationBarItem(
                icon: CupertinoIcons.person,
                label: 'Profile',
              ),
            ],
          ),
        );
      },
    );
  }

  bottomNavigationBarItem({required IconData icon, required String label}) {
    return BottomNavigationBarItem(
      icon: Icon(icon),
      label: label,
    );
  }
}
