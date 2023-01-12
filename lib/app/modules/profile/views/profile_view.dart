import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:getwork/app/common/widgets/common_widgets.dart';
import 'package:getwork/app/common/widgets/custom_bottom_sheet.dart';
import 'package:getwork/app/modules/profile/controllers/profile_controller.dart';
import 'package:getwork/app/modules/profile/views/widgets/education_widget.dart';
import 'package:getwork/app/modules/profile/views/widgets/languages_widget.dart';
import 'package:getwork/app/modules/profile/views/widgets/portfolio_widget.dart';
import 'package:getwork/app/modules/profile/views/widgets/skill_widget.dart';
import 'package:getwork/app/modules/profile/views/widgets/user_info_widget.dart';
import 'package:getwork/app/modules/profile/views/widgets/userinfo_and_title_widget.dart';
import 'package:getwork/app/utils/app_string.dart';
import 'package:getwork/app/utils/colors.dart';
import 'package:getwork/app/utils/app_styles.dart';

class ProfileView extends GetView {
  final profileController = Get.put(ProfileController());
  @override
  Widget build(BuildContext context) {
    //  final size = MediaQuery.of(context).size;
    profileController.onInit();
    return Scaffold(
        backgroundColor: AppColor.whiteColor,
        appBar: AppBar(
          title: Text(
            AppString.profileText,
            style: AppStyle.appBarStyle,
          ),
          centerTitle: true,
          backgroundColor: AppColor.whiteColor,
          elevation: 0.8,
        ),
        body: Obx(
          () => profileController.isLoading.value
              ? SpinKitThreeBounce(
                  color: AppColor.greenColor,
                )
              : RefreshIndicator(
                  onRefresh: profileController.refreshProfile,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        commonSizedBox(20),
                        UserInfoWidget(
                          profilePic: profileController.profilePic.toString(),
                          profileName: profileController.profileName.toString(),
                          emailId: profileController.emailId.toString(),
                          onPressed: () {},
                        ),
                        commonSizedBox(15),
                        commonDivider(0.8),
                        commonSizedBox(15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                Text(
                                  '\$${profileController.totalEarned.toString()}',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                                Text(
                                  'Total Earnings',
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  '\$${profileController.pendingWithdraw.toString()}',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                                Text(
                                  'Pending Withdraw',
                                ),
                              ],
                            ),
                          ],
                        ),
                        commonSizedBox(20),
                        commonDivider(0.8),
                        UserInfoAndTitleWidget(
                          userTitle: profileController.userTitle.toString(),
                          userInfo: profileController.userInfo.toString(),
                          onPressed: () {
                            //profileController.showEditInfoBottomSheet(context);
                            Get.bottomSheet(
                              isScrollControlled: true,
                              ignoreSafeArea: false,
                              CustomBottomSheet(
                                infoTitle:
                                    profileController.infoTitleController,
                                infoDescription:
                                    profileController.infoDescriptionController,
                                hintTextInfoTitle: 'Add info title',
                                hintTextInfoDescription: 'Add info description',
                                onPressed: () {
                                 // print('servsdr');
                                  profileController.updateUserInfo(); 
                                },
                              ),
                            );
                          },
                        ),
                        commonDivider(0.8),
                        SkillsWidget(
                          list: profileController.skills,
                          onPressed: () {},
                        ),
                        commonDivider(0.8),
                        LanguagesWidget(
                          list: profileController.languages,
                          onPressed: () {},
                        ),
                        commonDivider(0.8),
                        EducationWidget(
                          onPressed: () {},
                          educationList: profileController.education,
                        ),
                        commonDivider(0.8),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              commonSizedBox(5),
                              Text(
                                'Work History',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              commonSizedBox(10),
                              Text(
                                'Your work history is visible here',
                                style: TextStyle(fontFamily: 'Poppins'),
                              ),
                              commonSizedBox(10),
                            ],
                          ),
                        ),
                        commonDivider(0.8),
                        PortfolioWidget(
                          list: profileController.portfolios,
                          onPressed: () {},
                          imageClick: () {
                            print('image clicked');
                          },
                        ),
                      ],
                    ),
                  ),
                ),
        ));
  }
}
