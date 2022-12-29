import 'dart:convert';
import 'dart:developer';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:getwork/app/modules/home/controllers/home_controller.dart';

import 'package:getwork/app/modules/home/model/get_all_jobs_model.dart';
import 'package:http/http.dart' as http;

class GetAllJobsAPI {
  final homeController = Get.put(HomeController());

  getJobResponse() async {
    final url = Uri.parse('http://10.0.2.2:3001/api/getAllJobs');
    final storage = FlutterSecureStorage();
    final token = await storage.read(key: 'token');

    var headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };

    try {
      homeController.isLoading(true);
      http.Response response = await http.get(
        url,
        headers: headers,
      );

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        JobsModel result = JobsModel.fromJson(data);

        print(result.allJobs);
        homeController.allJobs = result.allJobs;
        print(homeController.allJobs[0].title);

        homeController.isLoading(false);
      } else {
        throw 'Something went wrong';
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
