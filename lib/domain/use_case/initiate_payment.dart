import 'package:fitness_thoughts/data/repository/repository_impl.dart';
import 'package:flutter/material.dart';

class InitiatePayment {
  final RepositoryImpl repository;
  InitiatePayment(this.repository);

  Future call({
    required int amount,
    required String contact,
    required String email,
    required String key,
    required String appName,
    required String appDescription,
    // required Function(String paymentId) onSuccess,
    // required Function(String error) onFailure,
  }) async {
    debugPrint("@@ use case");
    return await repository.initiatePayment(
      amount: amount,
      contact: contact,
      email: email,
      key: key,
      appDescription: appDescription,
      appName: appName,
      // onSuccess: onSuccess,
      // onFailure: onFailure,
    );
  }
}
