import 'dart:developer';

import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwork/app/common/widgets/custom_snackbar.dart';
import 'package:getwork/app/modules/profile/api/profile_api.dart';
import 'package:getwork/app/modules/profile/model/profile_model.dart';
import 'package:image_picker/image_picker.dart';

class ProfileController extends GetxController {
  var isLoading = true.obs;
  var profilePic = ''.obs;
  var profileName = ''.obs;
  var emailId = ''.obs;
  var totalEarned = 0.obs;
  var pendingWithdraw = 0.obs;
  var userTitle = ''.obs;
  var userInfo = ''.obs;
  var skills = <Skill?>[].obs;
  var languages = <Language?>[].obs;
  var education = <Education?>[].obs;
  var portfolios = <Portfolio?>[].obs;
  var imageUrl = ''.obs;

  //Text editing controllers
  final TextEditingController infoTitleController = TextEditingController();
  final TextEditingController infoDescriptionController =
      TextEditingController();
  final TextEditingController skillController = TextEditingController();
  final TextEditingController languageController = TextEditingController();
  final TextEditingController schoolNameController = TextEditingController();
  final TextEditingController degreeController = TextEditingController();

  @override
  void onInit() {
    getProfie();
    super.onInit();
  }

  Future<void> getProfie() async {
    ProfileModel? response = await ProfileAPI().getProfile();
    if (response != null) {
      isLoading(false);
      if (response.image != null) {
        profilePic.value = response.image ?? '';
      } else {
        profilePic.value =
            'https://cdn.vectorstock.com/i/preview-1x/30/40/business-men-icon-vector-24533040.jpg';
      }
      // fetching profile name from API
      if (response.owner?.name != null) {
        profileName.value = response.owner?.name ?? '';
      } else {
        profileName.value = 'User';
      }
      // fetching emailId from API
      if (response.owner?.email != null) {
        emailId.value = response.owner?.email ?? '';
      }
      // fetchig total earnings from API
      if (response.totalEarned != null) {
        totalEarned.value = response.totalEarned ?? 0;
      } else {
        // In case null make it as 0
        totalEarned.value = 0;
      }
      // fetching pending withdraw from API
      if (response.pendingWithdraw != null) {
        pendingWithdraw.value = response.pendingWithdraw ?? 0;
      } else {
        pendingWithdraw.value = 0;
      }
      // fetching user title from API
      if (response.userTitle != null) {
        userTitle.value = response.userTitle ?? '';
        // In case null show a text to add title
      } else {
        userTitle.value = 'Add Title';
      }
      // fetching  user info from API
      if (response.userInfo != null) {
        userInfo.value = response.userInfo ?? '';
        // In case null show a text to add user info
      } else {
        userInfo.value = 'Add Your Info';
      }
      // fetching skills from API
      if (response.skills != null) {
        // print(response.skills);
        skills.value = response.skills ?? [];
      } else {
        skills.value = [];
      }

      //fetching languages from API
      if (response.languages != null) {
        languages.value = response.languages ?? [];
      } else {
        languages.value = [];
      }

      // fetching education from API
      if (response.educations != null) {
        education.value = response.educations ?? [];
      } else {
        education.value = [];
      }

      // fetching portfolio from API
      if (response.portfolios != null) {
        portfolios.value = response.portfolios ?? [];
      } else {}
    } else {
      isLoading(false);
      print('sedvsdfesf');
      CustomSnackBar.showErrorSnackBar(
        message: 'Something went wrong',
      );
    }
  }

  void assignDataToTextfield() {
    infoTitleController.text = userTitle.toString();
    infoDescriptionController.text = userInfo.toString();
  }

  Future<void> updateUserInfo() async {
    if (infoTitleController.text.isEmpty) {
      CustomSnackBar.showErrorSnackBar(message: 'Enter your info title');
    } else if (infoDescriptionController.text.isEmpty) {
      CustomSnackBar.showErrorSnackBar(
          message: 'Enter your detailed description');
    } else {
      Message? response = await ProfileAPI().updateUserInfo(
        infoTitleController.text,
        infoDescriptionController.text,
      );
      getProfie();

      Get.back();

      (infoTitleController.text == userTitle.toString() &&
              infoDescriptionController.text == userInfo.toString())
          ? CustomSnackBar.showSuccessSnackBar(message: 'No changes')
          : CustomSnackBar.showSuccessSnackBar(
              message: response?.message ?? '',
            );
    }
  }

  Future<void> updateSkills() async {
    if (skillController.text.isEmpty) {
      CustomSnackBar.showErrorSnackBar(
        message: 'Please add your skill',
      );
    } else {
      await ProfileAPI().updateSkills(skillController.text);
      getProfie();

      skillController.clear();
      Get.back();
      CustomSnackBar.showSuccessSnackBar(
        message: 'Successfully submitted',
      );
    }
  }

  Future<void> updateLanguage() async {
    if (languageController.text.isEmpty) {
      CustomSnackBar.showErrorSnackBar(
        message: 'Please add language',
      );
    } else {
      await ProfileAPI().updateLanguage(languageController.text);
      getProfie();

      languageController.clear();
      Get.back();
      CustomSnackBar.showSuccessSnackBar(
        message: 'Successfully submitted',
      );
    }
  }

  Future<void> updateEducation() async {
    if (schoolNameController.text.isEmpty) {
      CustomSnackBar.showErrorSnackBar(
        message: 'Please add school name',
      );
    } else if (degreeController.text.isEmpty) {
      CustomSnackBar.showErrorSnackBar(
        message: 'Please add degree name',
      );
    } else {
      await ProfileAPI().updateEducation(
        schoolNameController.text,
        degreeController.text,
      );
      getProfie();

      Get.back();
      schoolNameController.clear();
      degreeController.clear();

      CustomSnackBar.showSuccessSnackBar(
        message: 'Successfully submitted',
      );
    }
  }

  Future<void> deleteEducation(String educationId) async {
    await ProfileAPI().deleteEducation(educationId);
    Get.back();
    getProfie();
    CustomSnackBar.showErrorSnackBar(message: 'Education deleted');
  }

  Future<void> uploadImage() async {
    final cloudinary = CloudinaryPublic('dficlknqi', 'zueui8am');
    var image = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (image != null) {
      try {
        CloudinaryResponse response = await cloudinary.uploadFile(
          CloudinaryFile.fromFile(image.path, folder: 'getworker'),
        );
      
        imageUrl.value = response.secureUrl;
        print('url vanno mone');
        log(imageUrl.toString());
      } on CloudinaryException catch (e) {
        print(e.message);
        print(e);
      }
    } else {
      print("No image selected");
    }
  }
}
