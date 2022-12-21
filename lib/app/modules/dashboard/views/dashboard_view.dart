
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getwork/app/modules/contracts/views/contracts_view.dart';
import 'package:getwork/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:getwork/app/modules/home/views/home_view.dart';
import 'package:getwork/app/modules/messages/views/messages_view.dart';
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
                ContractsView(),
                MessagesView(),
                ProfileView(),
              ],
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            unselectedItemColor: blackColor,
            selectedItemColor: greenColor,
            onTap: controller.changeTabIndex,
            currentIndex: controller.tabIndex,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            type: BottomNavigationBarType.fixed,
            backgroundColor: whiteColor,
            elevation: 0,
            selectedFontSize: 10,
            unselectedFontSize: 11,
            items: [
              bottomNavigationBarItem(
                icon: Icons.search,
                label: 'Jobs',
              ),
               bottomNavigationBarItem(
                icon: Icons.library_books_outlined,
                label: 'Proposals',
              ),
               bottomNavigationBarItem(
                icon: Icons.note_alt_outlined,
                label: 'Contracts',
              ),
               bottomNavigationBarItem(
                icon: Icons.mail_outlined,
                label: 'Messages',
              ),
               bottomNavigationBarItem(
                icon: Icons.person_pin,
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
