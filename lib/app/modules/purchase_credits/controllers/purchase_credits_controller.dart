import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwork/app/modules/purchase_credits/api/purchase_credits_api.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class PurchaseCreditsController extends GetxController
    with GetTickerProviderStateMixin {
  late TabController tabController;

  List<Tab> myTabs = <Tab>[
    Tab(
      text: 'Purchase',
    ),
    Tab(
      text: 'History',
    )
  ];

  final razorpay = Razorpay();

  @override
  void onInit() {
    tabController = TabController(length: 2, vsync: this);
    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    super.onInit();
  }

  @override
  void onClose() {
    tabController.dispose();
    razorpay.clear();
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    log('Payment Success  :  ${response.paymentId} ${response.orderId} ${response.signature}');
    PurchaseCreditsAPI().verifyPayment(
      response.orderId,
      response.paymentId,
      response.signature,
    );
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    log('Payment Error  : ${response.code} ${response.message}');
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    log('External Wallet  :${response.walletName}');
  }

  Future<void> createOrder() async {
    await PurchaseCreditsAPI().createOrder();
    //   final url = Uri.https("api.razorpay.com", "v1/orders");

    //   var headers = {
    //     'Content-Type': 'application/json',
    //     'Authorization': 'Basic ${base64Encode(utf8.encode('${razorpay_credentials.keyId}:${razorpay_credentials.keySecret}'))}'
    //   };

    //   Map<String, dynamic> requestBody = {
    //     "amount": 500 * 100,
    //     "currency": "INR",
    //     "receipt": "rcpt_11"
    //   };

    //   var response = await http.post(
    //     url,
    //     headers: headers,
    //     body: jsonEncode(requestBody),
    //   );
    //   if (response.statusCode == 200) {
    //     openCheckout(jsonDecode(response.body)['id']);
    //   }
    //   log(response.body);
    // }

    // void openCheckout(String orderId) {
    //   var options = {
    //     'key': razorpay_credentials.keyId,
    //     'amount': 500 * 100,
    //     'name': 'GETWORKER',
    //     'order_id': orderId,
    //     'description': 'Basic Plan',
    //     'timeout': 60 * 5,
    //     'prefill': {
    //       'email': 'test@razorpay.com',
    //     }
    //   };
    //   razorpay.open(options);
  }
}
