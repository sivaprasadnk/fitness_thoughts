import 'package:fitness_thoughts/core/interceptor/dio_client.dart';
import 'package:fitness_thoughts/data/models/blog_model.dart';
import 'package:fitness_thoughts/data/models/system_config_model.dart';
import 'package:flutter/foundation.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
// import 'package:http/http.dart' as http;

abstract class RemoteDatasource {
  Future<List<BlogModel>> getPosts();
  Future<List<BlogModel>> getRecentPosts(int count);
  Future<BlogModel> getPostDetails(int id);
  Future<SystemConfig> getLatestVersion();
  Future<SystemConfig> getSystemConfig();
  Future initiatePayment({
    required int amount,
    required String contact,
    required String email,
    required String key,
    required String appName,
    required String appDescription,
    // required Function(String paymentId) onSuccess,
    // required Function(String error) onFailure,
  });
}

class RemoteDatasourceImpl extends RemoteDatasource {
final DioClient client;
final Razorpay _razorpay;
  RemoteDatasourceImpl(this.client, this._razorpay) {
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }
  @override
  Future<List<BlogModel>> getPosts() async {
    // var url = '${baseUrl}blogs';
    var url = kDebugMode ? 'blogs/dev' : "blogs";
    var response = await client.getRequest(url);

    var blogs = (response.data as List)
        .map((e) => BlogModel.fromJson(e))
        .toList();
        
    return blogs;
  }
  
  @override
  Future<SystemConfig> getLatestVersion() async {
    // var url = '${baseUrl}version';
    var response = await client.getRequest('version');
    // var list =
    //     (response.data as List)
    //     .map((e) => SystemConfig.fromJson(e))
    //     .toList();
    return SystemConfig.fromJson(response.data);
  }
  
  @override
  Future<BlogModel> getPostDetails(int id) async {
    // var url = '${baseUrl}blog/$id';
    var url = kDebugMode ? "blog/dev/$id" : "blog/$id";
    var response = await client.getRequest(url);
    return BlogModel.fromJson(response.data);
  }
  
  @override
  Future<List<BlogModel>> getRecentPosts(int count) async {
    var url = kDebugMode ? "blogs/dev/recent/$count" : "blogs/recent/$count";
    var response = await client.getRequest(url);
    var blogs = (response.data as List)
        .map((e) => BlogModel.fromJson(e))
        .toList();
    debugPrint("@@ blogs length :${blogs.length}");
    return blogs;
  }
  
  @override
  Future<SystemConfig> getSystemConfig() async {
    var response = await client.getRequest('version');
    // var list =
    //     (response.data as List)
    //     .map((e) => SystemConfig.fromJson(e))
    //     .toList();
    return SystemConfig.fromJson(response.data);
  }
  
  @override
  Future<void> initiatePayment({
    required int amount,
    required String contact,
    required String email,
    required String key,
    required String appName,
    required String appDescription,
    // required Function(String paymentId) onSuccess,
    // required Function(String error) onFailure,
  }) async {
    debugPrint("@@ data source");

    var options = {
      // 'key': 'rzp_live_vLmR8VABHADVBS',
      // 'key': 'rzp_test_BgbHKlrzYG4l3h',
      'key': key,
      'amount': 100,
      'currency': 'INR',
      'name': appName,
      'description': appDescription,
      'prefill': {'contact': contact, 'email': email},
      'external': {
        'wallets': ['paytm'],
      }
      // 'method': {
      //   'upi': true // Enable UPI as payment method
      // }
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      // onFailure("Error: $e");
    }
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    print("Payment Successful: ${response.paymentId}");
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    print(
        "Payment Error: ${response.code} ${response.error} - ${response.message}");
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    print("External Wallet Selected: ${response.walletName}");
  }
}
