import 'dart:convert';
import 'dart:developer';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:getwork/app/common/widgets/custom_snackbar.dart';
import 'package:getwork/app/modules/home/model/get_all_jobs_model.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class GetAllJobsAPI {
  Future<JobsModel?> getJobResponse() async {
    final url = Uri.parse('http://10.0.2.2:3001/api/getAllJobs');
    final storage = FlutterSecureStorage();
    final token = await storage.read(key: 'token');

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
        return JobsModel.fromJson(jsonDecode(response.body));
      } else {
        CustomSnackBar.showErrorSnackBar(
            message: 'Check your internet connection');
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  Future<void> saveJobs(String jobId) async {
    final storage = FlutterSecureStorage();
    final token = await storage.read(key: 'token');
    final userId = await storage.read(key: 'userId');
    final url =
        Uri.parse('http://10.0.2.2:3001/api/employee/saveJobs/$userId/$jobId');

    var headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };

    try {
      await get(
        url,
        headers: headers,
      );
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> unSaveJob(String jobId) async {
    final storage = FlutterSecureStorage();
    final token = await storage.read(key: 'token');
    final userId = await storage.read(key: 'userId');
    final url =
        Uri.parse('http://10.0.2.2:3001/api/employee/saveJobs/$userId/$jobId');

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
      log(response.body);
    } catch (e) {
      log(e.toString());
    }
  }
}
