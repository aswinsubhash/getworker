import 'dart:convert';
import 'dart:developer';
import 'package:getwork/app/common/widgets/custom_snackbar.dart';
import 'package:getwork/app/modules/proposals/model/proposal_model.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';


class ProposalsAPI {
  Future<ProposalsModel?> getMyProposals() async {
    final storage = FlutterSecureStorage();
    final userId = await storage.read(key: 'userId');
    final token = await storage.read(key: 'token');
    final url = Uri.parse('http://10.0.2.2:3001/api/myProposals/$userId');

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
        return ProposalsModel.fromJson(jsonDecode(response.body));
      } else {
        CustomSnackBar.showErrorSnackBar(
            message: 'Check your internet connection');
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}
