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
  /// Each variable is declared using the 'obs' property to make them observable, so that any changes to the value of the variable will automatically update any widgets that depend on it.
  /// The variables include:
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
    // Call the getProfile function from the ProfileAPI class and assign the response to the variable "response"
    ProfileModel? response = await ProfileAPI().getProfile();
    // check if the response is not null
    if (response != null) {
      // set loading state to false
      isLoading(false);
      // assign the profile picture
      if (response.image != null) {
        profilePic.value = response.image ?? '';
      } else {
        // assign the profile picture if image is null
        profilePic.value =
            'https://cdn.vectorstock.com/i/preview-1x/30/40/business-men-icon-vector-24533040.jpg';
      }
      // assign the profile name
      if (response.owner?.name != null) {
        profileName.value = response.owner?.name ?? '';
      } else {
        // assign the profile name if it is null
        profileName.value = 'User';
      }
      // assign the emailId
      if (response.owner?.email != null) {
        emailId.value = response.owner?.email ?? '';
      }
      // assign the total earnings
      if (response.totalEarned != null) {
        totalEarned.value = response.totalEarned ?? 0;
      } else {
        // In case null make it as 0
        totalEarned.value = 0;
      }
      // assign the pending withdra
      if (response.pendingWithdraw != null) {
        pendingWithdraw.value = response.pendingWithdraw ?? 0;
      } else {
        // In case null make it as 0
        pendingWithdraw.value = 0;
      }
      // assign the user title
      if (response.userTitle != null) {
        userTitle.value = response.userTitle ?? '';
        // In case the value is null, set it to "Add Title"
      } else {
        userTitle.value = 'Add Title';
      }
      // assign the user info
      if (response.userInfo != null) {
        userInfo.value = response.userInfo ?? '';
        // In case the value is null, set it to "Add Your Info"
      } else {
        userInfo.value = 'Add Your Info';
      }
      // assign the skills
      if (response.skills != null) {
        skills.value = response.skills ?? [];
        // In case null assign empty list
      } else {
        skills.value = [];
      }

      // assign the languages
      if (response.languages != null) {
        languages.value = response.languages ?? [];
      } else {
        // In case null assign empty list
        languages.value = [];
      }

      // assign the educations
      if (response.educations != null) {
        education.value = response.educations ?? [];
        // In case null assign empty list
      } else {
        education.value = [];
      }

      // assign the portfolios
      if (response.portfolios != null) {
        portfolios.value = response.portfolios ?? [];
      }

      // assign the saved jobs to the variable saved jobs in the home controller
      if (response.savedJobs != null) {
        homeController.savedJobs.value = response.savedJobs ?? [];
      }
      // assign the credits
      if (response.connects != null) {
        totalCredits.value = response.connects ?? 0;
      }
    } else {
      // Set loading state to false
      isLoading(false);
      // Show error message if something went wrong with the api
      CustomSnackBar.showErrorSnackBar(
        message: 'Something went wrong',
      );
    }
  }

  /// This function assigns the current user's title and description to the text fields,
  /// allowing the user to see their current information and make changes if necessary.
  void assignDataToTextfield() {
    // Assign current user title to the infoTitleController text field
    infoTitleController.text = userTitle.toString();
    // Assign current user description to the infoDescriptionController text field
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
      // Show error message if info title field is empty
      CustomSnackBar.showErrorSnackBar(message: 'Enter your info title');
    } else if (infoDescriptionController.text.isEmpty) {
      // Show error message if info description field is empty
      CustomSnackBar.showErrorSnackBar(
          message: 'Enter your detailed description');
    } else {
      // Call the updateUserInfo function from the ProfileAPI class and pass in the title and description
      Message? response = await ProfileAPI().updateUserInfo(
        infoTitleController.text,
        infoDescriptionController.text,
      );
      // Set loading state to true
      isLoading(true);
      // Get the updated profile
      getProfie();
      // Navigate back to previous screen
      Get.back();
      // Compare the input fields with the current user's title and description
      (infoTitleController.text == userTitle.toString() &&
              infoDescriptionController.text == userInfo.toString())
          // Show a snackbar with a message indicating the no changes
          ? CustomSnackBar.showSuccessSnackBar(message: 'No changes')
          // Show a snackbar with a message indicating the update was successful or if an error occured
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
      // Show error message if skill field is empty
      CustomSnackBar.showErrorSnackBar(
        message: 'Please add your skill',
      );
    } else {
      // Call the updateSkills function from the ProfileAPI class and pass in the skill
      await ProfileAPI().updateSkills(skillController.text);
      //Set loading state to true
      isLoading(true);
      // Navigate back to previous screen
      Get.back();
      await Future.delayed(Duration(seconds: 1));
      // Get the updated profile
      getProfie();
      // Clear the skill field
      skillController.clear();
      // Show snackbar with a message indicating the update was successful
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
      // Show error message if language field is empty
      CustomSnackBar.showErrorSnackBar(
        message: 'Please add language',
      );
    } else {
      // Call the updateLanguage function from the ProfileAPI class and pass in the language
      await ProfileAPI().updateLanguage(languageController.text);
      //Set loading state to true
      isLoading(true);
      // Navigate back to previous screen
      Get.back();
      await Future.delayed(Duration(seconds: 1));
      // Get the updated profile
      getProfie();
      // Clear the language field
      languageController.clear();
      // Show snackbar with a message indicating the update was successful
      CustomSnackBar.showSuccessSnackBar(
        message: 'Successfully submitted',
      );
    }
  }

  /// This function allows a user to update their education information on their profile.
  /// It first checks if the school name and degree fields are empty and if they are, it shows an error message.
  /// If both fields are filled, it calls the "updateEducation" function from the "ProfileAPI" class and passes in the school name and degree as arguments.
  /// it also updates the profile, navigates back to the previous screen, clears the school name and degree fields, and shows a snackbar with a message indicating the update was successful.
  Future<void> updateEducation() async {
    if (schoolNameController.text.isEmpty) {
      // Show error message if school name field is empty
      CustomSnackBar.showErrorSnackBar(
        message: 'Please add school name',
      );
    } else if (degreeController.text.isEmpty) {
      // Show error message if degree field is empty
      CustomSnackBar.showErrorSnackBar(
        message: 'Please add degree name',
      );
    } else {
      // Call the updateEducation function from the ProfileAPI class and pass in the school name and degree
      await ProfileAPI().updateEducation(
        schoolNameController.text,
        degreeController.text,
      );
      // Get the updated profile
      getProfie();
      // navigate back to the previous screen
      Get.back();
      // clear the school name and degree fields
      schoolNameController.clear();
      degreeController.clear();
      // Show snackbar with a message indicating the update was successf
      CustomSnackBar.showSuccessSnackBar(
        message: 'Successfully submitted',
      );
    }
  }

  /// This function allows a user to delete an education from their profile.
  /// It takes an educationId as an argument, it calls the "deleteEducation" function from the "ProfileAPI" class and passes in the educationId as an argument.
  /// It also navigates back to the previous screen, updates the profile, and shows a snackbar with a message indicating the deletion was successful.
  Future<void> deleteEducation(String educationId) async {
    // Call the deleteEducation function from the ProfileAPI class and pass in the educationId
    await ProfileAPI().deleteEducation(educationId);
    // navigate back to the previous screen
    Get.back();
    // Get the updated profile
    getProfie();
    // Show snackbar with a message indicating the deletion was successful
    CustomSnackBar.showErrorSnackBar(message: 'Deleted successfully');
  }

  /// This function allows a user to upload a profile picture to their profile.
  /// It uses the "CloudinaryPublic" class to upload the image to cloudinary,
  /// and the "ImagePicker" class to select the image from the device's gallery.
  /// It then calls the "updateProfilePic" function from the "ProfileAPI" class and passes in the image's secureUrl as an argument.
  /// Finally, it updates the profile and shows a snackbar with the response message.
  Future<void> uploadProfilePic() async {
    /// Finally, it updates the profile and shows a snackbar with the response
    final cloudinary = CloudinaryPublic('dficlknqi', 'zueui8am');
    // Pick an image from the device's gallery
    var image = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (image != null) {
      try {
        // Upload the image to cloudinary and return the response
        CloudinaryResponse response = await cloudinary.uploadFile(
          CloudinaryFile.fromFile(image.path, folder: 'getworker'),
        );
        // call the updateProfilePic function from the ProfileAPI class and pass in the image's secureUrl
        await ProfileAPI().updateProfilePic(response.secureUrl);
        // Get the updated profile
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
    // Initialize the CloudinaryPublic class with the cloud_name and api_key
    final cloudinary = CloudinaryPublic('dficlknqi', 'zueui8am');
    // Pick an image from the device's gallery
    var image = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (image != null) {
      try {
        // Upload the image to cloudinary and return the response
        CloudinaryResponse response = await cloudinary.uploadFile(
          CloudinaryFile.fromFile(image.path, folder: 'getworker'),
        );
        // call the uploadPortfolio function from the ProfileAPI class and pass in the image's secureUrl
        await ProfileAPI().uploadPortfolio(response.secureUrl);
        // Get the updated profile
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
    // Call the deletePortfolio function from the ProfileAPI class and pass in the portfolio id
    Message? response = await ProfileAPI().deletePortfolio(portfolioId);
    // Set the loading state to true
    isLoading(true);
    // Get the updated profile
    getProfie();
    // Show snackbar with the response message
    CustomSnackBar.showErrorSnackBar(message: response?.message ?? '');
  }

  /// This function allows a user to reset their password.
  /// It first checks if the old password field is empty and if it is, it shows an error message.
  /// Similarly, it checks if the new password field is empty and if it is, it shows an error message.
  /// Then, it checks if the new password and the confirm password fields match, if they don't match it shows an error message.
  /// If all the above conditions are met, it calls the "resetPassword" function from the "ProfileAPI" class and passes in the old and new password as arguments.
  Future<void> resetPassword() async {
    if (oldPasswordController.text.isEmpty) {
      // Show error message if old password field is empty
      CustomSnackBar.showErrorSnackBar(message: 'Enter your old password');
    } else if (newPasswordController.text.isEmpty) {
      // Show error message if new password field is empty
      CustomSnackBar.showErrorSnackBar(message: 'Enter your new password');
    } else if (newPasswordController.text != confirmPasswordController.text) {
      // Show error message if new password and confirm password fields don't match
      CustomSnackBar.showErrorSnackBar(message: 'Password does not match');
    } else {
      // Call the resetPassword function from the ProfileAPI class and pass in the old and new password
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
    // Call the deleteLanguageAndSkill function from the ProfileAPI class and pass in the skill and language
    Message? respose =
        await ProfileAPI().deleteLanguageAndSkill(skill, language);
    // Set the loading state to true
    isLoading(true);
    // Get the updated profile
    getProfie();
    // Show snackbar with the response message
    CustomSnackBar.showErrorSnackBar(message: respose?.message ?? '');
  }
}
