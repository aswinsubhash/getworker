import 'dart:convert';
import 'dart:developer';
import 'package:getwork/app/common/widgets/custom_snackbar.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:getwork/app/modules/submit_proposal/model/submit_proposal_model.dart';

class SubmitProposalAPI {
  Future<SubmitProposalModel?> postData(
    String coverLetter,
    String bid,
    String daysToComple,
    String jobId,
  ) async {
    final storage = FlutterSecureStorage();
    final userId = await storage.read(key: 'userId');
    final token = await storage.read(key: 'token');
    final url = Uri.parse('http://10.0.2.2:3001/api/proposal/$userId/$jobId');

    var headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };
    Map<String, dynamic> requestBody = {
      "credit": "5",
      "cover": coverLetter,
      "bid": bid,
      "deadline": daysToComple
    };

    try {
      http.Response response = await http.post(
        url,
        headers: headers,
        body: jsonEncode(requestBody),
      );

      if (response.statusCode == 200) {
        return SubmitProposalModel.fromJson(jsonDecode(response.body));
      } else if (response.statusCode == 404) {
        CustomSnackBar.showErrorSnackBar(
            message: 'Something went wrong!Try again');
      } else {
        log(response.statusCode.toString());
        log(response.body);
      }

      log(response.body);
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}
