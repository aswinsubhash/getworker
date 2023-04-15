import 'dart:convert';
import 'dart:developer';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:getwork/app/modules/job_details/model/job_details_model.dart';
import 'package:http/http.dart' as http;

class JobDetailsAPI {
  Future<JobDetailsModel?> getJobDetails(String? jobId) async {
    final url = Uri.parse('http://10.0.2.2:3001/api/jobs/$jobId');
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
      print(response.body);
      print(response.statusCode);

      if (response.statusCode == 200) {
        return JobDetailsModel.fromJson(jsonDecode(response.body));
      } else {
        log(response.body);
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}
