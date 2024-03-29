import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:getwork/app/common/widgets/common_widgets.dart';
import 'package:getwork/app/common/widgets/custom_bottom_sheet.dart';
import 'package:getwork/app/common/widgets/custom_textfield_with_button.dart';
import 'package:getwork/app/modules/profile/controllers/profile_controller.dart';
import 'package:getwork/app/modules/profile/views/widgets/user_info_bottom_sheet.dart';
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
    final size = MediaQuery.of(context).size;
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
                onRefresh: profileController.getProfie,
                displacement: 30.0,
                color: AppColor.greenColor,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      commonSizedBox(20),
                      UserInfoWidget(
                        onPressed: profileController.uploadProfilePic,
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
                                'Total Balance',
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                profileController.totalCredits.toString(),
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              Text(
                                'Total Credits',
                              )
                            ],
                          )
                        ],
                      ),
                      commonSizedBox(20),
                      commonDivider(0.8),
                      UserInfoAndTitleWidget(
                        userTitle: profileController.userTitle.toString(),
                        userInfo: profileController.userInfo.toString(),
                        onPressed: () {
                          profileController.assignDataToTextfield();
                          Get.bottomSheet(
                            isScrollControlled: true,
                            ignoreSafeArea: false,
                            CustomBottomSheet(
                              infoTitle: profileController.infoTitleController,
                              infoDescription:
                                  profileController.infoDescriptionController,
                              hintTextInfoTitle: 'Add info title',
                              hintTextInfoDescription: 'Add info description',
                              onPressed: profileController.updateUserInfo,
                            ),
                          );
                        },
                      ),
                      commonDivider(0.8),
                      SkillsWidget(
                        onPressed: () {
                          Get.bottomSheet(
                            ignoreSafeArea: false,
                            isScrollControlled: true,
                            SafeArea(
                              child: Container(
                                height: size.height * 0.3,
                                decoration: BoxDecoration(
                                  color: AppColor.whiteColor,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20),
                                  ),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // commonSizedBox(5),
                                    Row(
                                      children: [
                                        IconButton(
                                          onPressed: () => Get.back(),
                                          icon: Icon(
                                            Icons.close_outlined,
                                          ),
                                        ),
                                        commonWidthBox(130),
                                        Text(
                                          'Skills',
                                          style: TextStyle(),
                                        )
                                      ],
                                    ),
                                    commonSizedBox(10),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 15,
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Enter the skill in which you are good at.(e.g.Flutter, React js, Python, etc)',
                                            style: TextStyle(height: 1.3),
                                          ),
                                          commonSizedBox(15),
                                          CustomTextFieldWithButton(
                                            onPressed:
                                                profileController.updateSkills,
                                            controller: profileController
                                                .skillController,
                                            hintText: 'Add your skill',
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                      commonDivider(0.8),
                      LanguagesWidget(
                        onPressed: () {
                          Get.bottomSheet(
                            ignoreSafeArea: false,
                            isScrollControlled: true,
                            SafeArea(
                              child: Container(
                                height: size.height * 0.3,
                                decoration: BoxDecoration(
                                  color: AppColor.whiteColor,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20),
                                  ),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // commonSizedBox(5),
                                    Row(
                                      children: [
                                        IconButton(
                                          onPressed: () => Get.back(),
                                          icon: Icon(
                                            Icons.close_outlined,
                                          ),
                                        ),
                                        commonWidthBox(115),
                                        Text(
                                          'Languages',
                                          style: TextStyle(),
                                        )
                                      ],
                                    ),
                                    commonSizedBox(10),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 15,
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Enter the language in which you are good at.(e.g.English, German, etc)',
                                            style: TextStyle(height: 1.3),
                                          ),
                                          commonSizedBox(15),
                                          CustomTextFieldWithButton(
                                            onPressed: profileController
                                                .updateLanguage,
                                            controller: profileController
                                                .languageController,
                                            hintText: 'Add language here',
                                          ),
                                          commonSizedBox(size.height * 0.05),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                      commonDivider(0.8),
                      EducationWidget(
                        onPressed: () {
                          Get.bottomSheet(
                            isScrollControlled: true,
                            ignoreSafeArea: false,
                            CustomEducationBottomSheet(
                              hintTextInfoDescription: 'Name of your degree',
                              hintTextInfoTitle: 'School of education',
                              schoolNameController:
                                  profileController.schoolNameController,
                              degreeController:
                                  profileController.degreeController,
                              onPressed: profileController.updateEducation,
                            ),
                          );
                        },
                      ),
                      commonSizedBox(10),
                      commonDivider(0.8),
                      PortfolioWidget(),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
