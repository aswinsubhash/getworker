import 'dart:convert';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:getwork/app/common/widgets/custom_snackbar.dart';
import 'package:getwork/app/modules/home/controllers/home_controller.dart';

import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:getwork/app/modules/profile/model/profile_model.dart';
import 'package:http/http.dart';

class ProfileAPI {
  Future<ProfileModel?> getProfile() async {
    final storage = FlutterSecureStorage();
    final token = await storage.read(key: 'token');
    final userId = await storage.read(key: 'userId');
    final url = Uri.parse('http://10.0.2.2:3001/api/employee/profile/$userId');
    print(userId);
    print(token);
    var headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };

    try {
      http.Response response = await http.get(
        url,
        headers: headers,
      );
      if (response.statusCode == 200) {
        return ProfileModel.fromJson(jsonDecode(response.body));
      } else {
        log(response.body);
        log(response.statusCode.toString());
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  Future<Message?> updateUserInfo(
      String infoTitle, String infoDescription) async {
    final storage = FlutterSecureStorage();
    final token = await storage.read(key: 'token');
    final userId = await storage.read(key: 'userId');
    final url = Uri.parse('http://10.0.2.2:3001/api/employee/editInfo/$userId');

    var headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };

    Map<String, dynamic> requestBody = {
      "title": infoTitle,
      "info": infoDescription
    };

    try {
      http.Response response = await http.patch(
        url,
        headers: headers,
        body: jsonEncode(requestBody),
      );
      // print(response.body);
      if (response.statusCode >= 200 && response.statusCode <= 299) {
        return Message.fromJson(jsonDecode(response.body));
      } else {
        CustomSnackBar.showErrorSnackBar(message: 'Something went wrong');
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  Future<void> updateSkills(String skill) async {
    final storage = FlutterSecureStorage();
    final token = await storage.read(key: 'token');
    final userId = await storage.read(key: 'userId');
    final url =
        Uri.parse('http://10.0.2.2:3001/api/employee/editProfile/$userId');

    var headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };

    Map<String, dynamic> requestBody = {
      "skill": skill,
    };

    try {
      await http.post(
        url,
        headers: headers,
        body: jsonEncode(requestBody),
      );
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> updateLanguage(String language) async {
    final storage = FlutterSecureStorage();
    final token = await storage.read(key: 'token');
    final userId = await storage.read(key: 'userId');
    final url =
        Uri.parse('http://10.0.2.2:3001/api/employee/editProfile/$userId');

    var headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };

    Map<String, dynamic> requestBody = {
      "language": language,
    };

    try {
      await http.post(
        url,
        headers: headers,
        body: jsonEncode(requestBody),
      );
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> updateEducation(String schoolName, String degreeName) async {
    final storage = FlutterSecureStorage();
    final token = await storage.read(key: 'token');
    final userId = await storage.read(key: 'userId');
    final url =
        Uri.parse('http://10.0.2.2:3001/api/employee/education/$userId');

    var headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };

    Map<String, dynamic> requestBody = {
      "education": {
        "school": schoolName,
        "title": degreeName,
      }
    };

    try {
      await http.post(
        url,
        headers: headers,
        body: jsonEncode(requestBody),
      );
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> deleteEducation(String educationId) async {
    final storage = FlutterSecureStorage();
    final token = await storage.read(key: 'token');
    final userId = await storage.read(key: 'userId');
    final url = Uri.parse(
        'http://10.0.2.2:3001/api/employee/education/$userId/$educationId');

    var headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };

    try {
      await http.delete(
        url,
        headers: headers,
      );
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> updateProfilePic(String imageUrl) async {
    final storage = FlutterSecureStorage();
    final token = await storage.read(key: 'token');
    final userId = await storage.read(key: 'userId');
    final url =
        Uri.parse('http://10.0.2.2:3001/api/employee/profileImg/$userId');

    var headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };

    Map<String, dynamic> requestBody = {
      "image": imageUrl,
    };

    try {
      await http.patch(
        url,
        headers: headers,
        body: jsonEncode(requestBody),
      );
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> uploadPortfolio(String imageUrl) async {
    final storage = FlutterSecureStorage();
    final token = await storage.read(key: 'token');
    final userId = await storage.read(key: 'userId');
    final url =
        Uri.parse('http://10.0.2.2:3001/api/employee/addPortfolio/$userId');

    var headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };

    Map<String, dynamic> requestBody = {
      "image": imageUrl,
      "title": 'Portfolio title',
      "description": 'Portfolio description'
    };

    try {
      http.Response response = await http.post(
        url,
        headers: headers,
        body: jsonEncode(requestBody),
      );
      log(response.body);
    } catch (e) {
      log(e.toString());
    }
  }

  Future<Message?> deletePortfolio(String id) async {
    final storage = FlutterSecureStorage();
    final token = await storage.read(key: 'token');
    final userId = await storage.read(key: 'userId');
    final url = Uri.parse(
        'http://10.0.2.2:3001/api/employee/deletePortfolio/$userId/$id');

    var headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };
    try {
      http.Response response = await delete(
        url,
        headers: headers,
      );
      if (response.statusCode >= 200 && response.statusCode <= 299) {
        return Message.fromJson(jsonDecode(response.body));
      } else {
        CustomSnackBar.showErrorSnackBar(message: 'Something went wrong');
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  Future<void> resetPassword(String oldPass, String newPass) async {
    final storage = FlutterSecureStorage();
    final token = await storage.read(key: 'token');
    final userId = await storage.read(key: 'userId');
    final url = Uri.parse('http://10.0.2.2:3001/api/resetPassword/$userId');

    var headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };

    Map<String, dynamic> requestBody = {
      "oldPass": oldPass,
      "newPass": newPass,
    };

    try {
      http.Response response = await patch(
        url,
        headers: headers,
        body: jsonEncode(requestBody),
      );
      print(response.body);

      if (response.body == '"Incorrect Old Password!"') {
        CustomSnackBar.showErrorSnackBar(
          message: 'Incorrect old password',
        );
      } else {
        CustomSnackBar.showSuccessSnackBar(
          message: 'Password successfully changed',
        );
        Get.find<HomeController>().logout();
      }
    } catch (e) {
      log(e.toString());
    }
  }

  Future<Message?> deleteLanguageAndSkill(
      String? skill, String? language) async {
    final storage = FlutterSecureStorage();
    final token = await storage.read(key: 'token');
    final userId = await storage.read(key: 'userId');
    final url = Uri.parse(
        'http://10.0.2.2:3001/api/employee/editProfile/$userId?skill=$skill&language=$language');

    var headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };
    try {
      http.Response response = await delete(
        url,
        headers: headers,
      );
      if (response.statusCode >= 200 && response.statusCode <= 299) {
        return Message.fromJson(jsonDecode(response.body));
      } else {
        CustomSnackBar.showErrorSnackBar(message: 'Something went wrong');
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}
