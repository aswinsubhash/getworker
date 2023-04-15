import 'dart:convert';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:getwork/app/modules/purchase_credits/api/razor_pay_credentials.dart'
    as razorpay_credentials;
import 'package:getwork/app/modules/purchase_credits/controllers/purchase_credits_controller.dart';
import 'package:http/http.dart' as http;

class PurchaseCreditsAPI {
  Future<void> createOrder() async {
    final String basicAuth =
        'Basic ${base64Encode(utf8.encode('${razorpay_credentials.keyId}:${razorpay_credentials.keySecret}'))}';
    final url = Uri.parse('https://api.razorpay.com/v1/orders');

    var headers = {
      'Content-Type': 'application/json',
      'Authorization': basicAuth
    };

    Map<String, dynamic> requestBody = {
      "amount": 5000 * 100,
      "currency": "INR",
      "receipt": "rcpt_11"
    };
    try {
      var response = await http.post(
        url,
        headers: headers,
        body: jsonEncode(requestBody),
      );
      if (response.statusCode == 200) {
        openCheckout(jsonDecode(response.body)['id']);
      }
      log(response.body);
    } catch (e) {
      log(e.toString());
    }
  }

  void openCheckout(String orderId) {
    var options = {
      'key': razorpay_credentials.keyId,
      'amount': 5000 * 100,
      'name': 'GETWORKER',
      'order_id': orderId,
      'description': 'Basic Plan',
      'timeout': 60 * 5,
      'prefill': {
        'email': 'test@razorpay.com',
      }
    };

    Get.find<PurchaseCreditsController>().razorpay.open(options);
  }

  verifyPayment(
    String? orderId,
    String? paymentId,
    String? signature,
  ) async {
    final url =
        Uri.parse('http://10.0.2.2:3001/api/credit/paymentVerification');

    Map<String, dynamic> requestBody = {
      'razorpay_signature': signature,
      'razorpay_payment_id': paymentId,
      'razorpay_order_id': orderId,
    };

    var headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    };

    try {
      var response = await http.post(
        url,
        headers: headers,
        body: jsonEncode(requestBody),
      );
      log(response.body);
    } catch (e) {
      log(e.toString());
    }
  }
}
