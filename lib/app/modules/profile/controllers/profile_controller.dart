import 'dart:developer';

import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwork/app/common/widgets/custom_snackbar.dart';
import 'package:getwork/app/modules/home/controllers/home_controller.dart';
import 'package:getwork/app/modules/profile/api/profile_api.dart';
import 'package:getwork/app/modules/profile/model/profile_model.dart';
import 'package:image_picker/image_picker.dart';

class ProfileController extends GetxController {
  final homeController = Get.put(HomeController());

  /// The above code declares a series of observable variables that are used to store data retrieved from the API.
  /// Each variable is declared using the 'obs' property to make them observable
  ///  so that any changes to the value of the variable will automatically update any widgets that depend on it.

  // - isLoading: a boolean variable that indicates whether the data is currently being loaded
  var isLoading = true.obs;
  // - profilePic: a string variable that stores the URL of the user's profile picture
  var profilePic = ''.obs;
  // - profileName: a string variable that stores the user's name
  var profileName = ''.obs;
  // - emailId: a string variable that stores the user's email address
  var emailId = ''.obs;
  // - totalEarned: an integer variable that stores the user's total earnings
  var totalEarned = 0.obs;
  // - pendingWithdraw: an integer variable that stores the user's pending withdraw amount
  var pendingWithdraw = 0.obs;
  // - userTitle: a string variable that stores the user's title
  var userTitle = ''.obs;
  // - userInfo: a string variable that stores the user's info
  var userInfo = ''.obs;
  // - skills: a list of Skill objects that stores the user's skills
  var skills = <Skill?>[].obs;
  // - languages: a list of Language objects that stores the user's languages
  var languages = <Language?>[].obs;
  // - education: a list of Education objects that stores the user's education
  var education = <Education?>[].obs;
  // - portfolios: a list of Portfolio objects that stores the user's portfolios
  var portfolios = <Portfolio?>[].obs;
  // - totalCredits: an integer variable that stores the user's total credits
  var totalCredits = 0.obs;

  //Text editing controllers
  final TextEditingController infoTitleController = TextEditingController();
  final TextEditingController infoDescriptionController =
      TextEditingController();
  final TextEditingController skillController = TextEditingController();
  final TextEditingController languageController = TextEditingController();
  //education controllers
  final TextEditingController schoolNameController = TextEditingController();
  final TextEditingController degreeController = TextEditingController();
  //reset password controllers
  final TextEditingController oldPasswordController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  void onInit() {
    getProfie();
    super.onInit();
  }

  /// This function retrieves the user's profile information from the API.
  /// It calls the "getProfile" function from the "ProfileAPI" class and assigns the response to the variable "response".
  /// If the response is not null, it sets the loading state to false, assigns the profile picture, name, email, total earnings, pending withdraw,
  /// user title, user info, skills, languages, education, portfolios, saved jobs, and total credits to the corresponding variables,
  /// and if the API returns null, it sets the loading state to false and shows an error message.
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

      if (response.owner?.name != null) {
        profileName.value = response.owner?.name ?? '';
      } else {
        profileName.value = 'User';
      }

      if (response.owner?.email != null) {
        emailId.value = response.owner?.email ?? '';
      }

      if (response.totalEarned != null) {
        totalEarned.value = response.totalEarned ?? 0;
      } else {
        totalEarned.value = 0;
      }

      if (response.pendingWithdraw != null) {
        pendingWithdraw.value = response.pendingWithdraw ?? 0;
      } else {
        pendingWithdraw.value = 0;
      }

      if (response.userTitle != null) {
        userTitle.value = response.userTitle ?? '';
      } else {
        userTitle.value = 'Add Title';
      }

      if (response.userInfo != null) {
        userInfo.value = response.userInfo ?? '';
      } else {
        userInfo.value = 'Add Your Info';
      }

      if (response.skills != null) {
        skills.value = response.skills ?? [];
      } else {
        skills.value = [];
      }

      if (response.languages != null) {
        languages.value = response.languages ?? [];
      } else {
        languages.value = [];
      }

      if (response.educations != null) {
        education.value = response.educations ?? [];
      } else {
        education.value = [];
      }

      if (response.portfolios != null) {
        portfolios.value = response.portfolios ?? [];
      }

      if (response.savedJobs != null) {
        homeController.savedJobs.value = response.savedJobs ?? [];
      }

      if (response.connects != null) {
        totalCredits.value = response.connects ?? 0;
      }
    } else {
      isLoading(false);

      CustomSnackBar.showErrorSnackBar(
        message: 'Something went wrong',
      );
    }
  }

  /// This function assigns the current user's title and description to the text fields,
  /// allowing the user to see their current information and make changes if necessary.
  void assignDataToTextfield() {
    infoTitleController.text = userTitle.toString();
    infoDescriptionController.text = userInfo.toString();
  }

  /// This function allows a user to update their profile information such as their title and detailed description.
  /// It first checks if the title and description fields are empty and if they are, it shows an error message.
  /// If both fields are filled, it calls the "updateUserInfo" function from the "ProfileAPI" class and passes in the title and description as arguments.
  /// It also updates the profile, navigates back to the previous screen, sets loading state to true,
  /// compares the inputted fields with the current user's title and description,
  /// and shows a snackbar with a message indicating whether there were changes made or not and if an error occured.
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

      isLoading(true);

      getProfie();

      Get.back();
      // Compare the input fields with the current user's title and description
      (infoTitleController.text == userTitle.toString() &&
              infoDescriptionController.text == userInfo.toString())
          ? CustomSnackBar.showSuccessSnackBar(message: 'No changes')
          : CustomSnackBar.showSuccessSnackBar(
              message: response?.message ?? '',
            );
    }
  }

  /// This function allows a user to update their skills information on their profile.
  /// It first checks if the skill field is empty and if it is, it shows an error message.
  /// If the field is filled, it calls the "updateSkills" function from the "ProfileAPI" class and passes in the skill as an argument.
  /// it also updates the profile, navigates back to the previous screen, clears the skill field, sets loading state to true,
  /// and shows a snackbar with a message indicating the update was successful.
  Future<void> updateSkills() async {
    if (skillController.text.isEmpty) {
      CustomSnackBar.showErrorSnackBar(
        message: 'Please add your skill',
      );
    } else {
      await ProfileAPI().updateSkills(skillController.text);

      isLoading(true);

      Get.back();
      await Future.delayed(Duration(seconds: 1));

      getProfie();

      skillController.clear();

      CustomSnackBar.showSuccessSnackBar(
        message: 'Successfully submitted',
      );
    }
  }

  /// This function allows a user to update their language information on their profile.
  /// It first checks if the language field is empty and if it is, it shows an error message.
  /// If the field is filled, it calls the "updateLanguage" function from the "ProfileAPI" class and passes in the language as an argument.
  /// it also updates the profile, navigates back to the previous screen, clears the language field, sets loading state to true,
  /// and shows a snackbar with a message indicating the update was successful.
  Future<void> updateLanguage() async {
    if (languageController.text.isEmpty) {
      CustomSnackBar.showErrorSnackBar(
        message: 'Please add language',
      );
    } else {
      await ProfileAPI().updateLanguage(languageController.text);

      isLoading(true);

      Get.back();
      await Future.delayed(Duration(seconds: 1));

      getProfie();

      languageController.clear();

      CustomSnackBar.showSuccessSnackBar(
        message: 'Successfully submitted',
      );
    }
  }

  /// This function allows a user to update their education information on their profile.
  /// It first checks if the school name and degree fields are empty and if they are, it shows an error message.
  /// If both fields are filled, it calls the "updateEducation" function from the "ProfileAPI" class and passes in the school name and degree as arguments.
  /// it also updates the profile, navigates back to the previous screen, clears the school name and degree fields, and
  /// shows a snackbar with a message indicating the update was successful.
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

  /// This function allows a user to delete an education from their profile.
  /// It takes an educationId as an argument, it calls the "deleteEducation" function from the "ProfileAPI" class and passes in the educationId as an argument.
  /// It also navigates back to the previous screen, updates the profile, and shows a snackbar with a message indicating the deletion was successful.
  Future<void> deleteEducation(String educationId) async {
    await ProfileAPI().deleteEducation(educationId);

    Get.back();

    getProfie();

    CustomSnackBar.showErrorSnackBar(message: 'Deleted successfully');
  }

  /// This function allows a user to upload a profile picture to their profile.
  /// It uses the "CloudinaryPublic" class to upload the image to cloudinary,
  /// and the "ImagePicker" class to select the image from the device's gallery.
  /// It then calls the "updateProfilePic" function from the "ProfileAPI" class and passes in the image's secureUrl as an argument.
  /// Finally, it updates the profile and shows a snackbar with the response message.
  Future<void> uploadProfilePic() async {
    final cloudinary = CloudinaryPublic('dficlknqi', 'zueui8am');

    var image = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (image != null) {
      try {
        CloudinaryResponse response = await cloudinary.uploadFile(
          CloudinaryFile.fromFile(image.path, folder: 'getworker'),
        );

        await ProfileAPI().updateProfilePic(response.secureUrl);

        getProfie();
      } on CloudinaryException catch (e) {
        print(e.message);
        print(e);
      }
    } else {
      print("No image selected");
    }
  }

  /// This function allows a user to upload a portfolio image to their profile.
  /// It uses the "CloudinaryPublic" class to upload the image to cloudinary,
  /// and the "ImagePicker" class to select the image from the device's gallery.
  /// It then calls the "uploadPortfolio" function from the "ProfileAPI" class and passes in the image's secureUrl as an argument.
  /// Finally, it updates the profile and shows a snackbar with the response message.
  Future<void> uploadPortfolio() async {
    final cloudinary = CloudinaryPublic('dficlknqi', 'zueui8am');

    var image = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (image != null) {
      try {
        CloudinaryResponse response = await cloudinary.uploadFile(
          CloudinaryFile.fromFile(image.path, folder: 'getworker'),
        );

        await ProfileAPI().uploadPortfolio(response.secureUrl);

        getProfie();
      } on CloudinaryException catch (e) {
        print(e.message);
        print(e);
      }
    } else {
      print("No image selected");
    }
  }

  /// This function allows a user to delete a portfolio by its id.
  /// It calls the "deletePortfolio" function from the "ProfileAPI" class and passes in the portfolio id as an argument.
  /// It also sets the loading state to true, updates the profile, and shows a snackbar with the response message.
  Future<void> deletePortfolio(String portfolioId) async {
    Message? response = await ProfileAPI().deletePortfolio(portfolioId);

    isLoading(true);

    getProfie();

    CustomSnackBar.showErrorSnackBar(message: response?.message ?? '');
  }

  /// This function allows a user to reset their password.
  /// It first checks if the old password field is empty and if it is, it shows an error message.
  /// Similarly, it checks if the new password field is empty and if it is, it shows an error message.
  /// Then, it checks if the new password and the confirm password fields match, if they don't match it shows an error message.
  /// If all the above conditions are met, it calls the "resetPassword" function from the "ProfileAPI" class and passes in the old and new password as arguments.
  Future<void> resetPassword() async {
    if (oldPasswordController.text.isEmpty) {
      CustomSnackBar.showErrorSnackBar(message: 'Enter your old password');
    } else if (newPasswordController.text.isEmpty) {
      CustomSnackBar.showErrorSnackBar(message: 'Enter your new password');
    } else if (newPasswordController.text != confirmPasswordController.text) {
      CustomSnackBar.showErrorSnackBar(message: 'Password does not match');
    } else {
      await ProfileAPI().resetPassword(
        oldPasswordController.text,
        newPasswordController.text,
      );
    }
  }

  /// This function allows a user to delete a language or a skill from their profile.
  /// It takes two optional arguments, one for the skill and one for the language,
  /// it calls the "deleteLanguageAndSkill" function from the "ProfileAPI" class and passes in the skill and language as arguments.
  /// It also sets the loading state to true, updates the profile, and shows a snackbar with the response message.
  Future<void> deleteLanguageAndSkill([String? skill, String? language]) async {
    Message? respose =
        await ProfileAPI().deleteLanguageAndSkill(skill, language);

    isLoading(true);

    getProfie();

    CustomSnackBar.showErrorSnackBar(message: respose?.message ?? '');
  }
}
