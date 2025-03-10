import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:fitness_thoughts/core/interceptor/dio_client.dart';
import 'package:fitness_thoughts/data/data_source/local_datasource.dart';
import 'package:fitness_thoughts/data/data_source/remote_datasource.dart';
import 'package:fitness_thoughts/data/repository/repository_impl.dart';
import 'package:fitness_thoughts/domain/use_case/get_post_details.dart';
import 'package:fitness_thoughts/domain/use_case/get_posts.dart';
import 'package:fitness_thoughts/domain/use_case/get_recent_posts.dart';
import 'package:fitness_thoughts/domain/use_case/get_system_config.dart';
import 'package:fitness_thoughts/domain/use_case/initiate_payment.dart';
import 'package:get_it/get_it.dart';
import 'package:local_auth/local_auth.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
// import 'package:http/http.dart' as http;

final locator = GetIt.instance;

void setup() {
  // locator.registerSingleton<http.Client>(http.Client());
  locator.registerSingleton<Dio>(Dio());
  locator.registerSingleton<Razorpay>(Razorpay());
  locator.registerSingleton<LocalAuthentication>(LocalAuthentication());
  locator.registerSingleton<Connectivity>(Connectivity());
  locator.registerSingleton<DioClient>(DioClient(locator(), locator()));

  locator
      .registerSingleton<RemoteDatasourceImpl>(
      RemoteDatasourceImpl(locator(), locator()));
  locator.registerSingleton<LocalDatasourceImpl>(LocalDatasourceImpl());

  locator
      .registerSingleton<RepositoryImpl>(RepositoryImpl(locator(), locator()));

  GetIt.I.registerSingleton<GetPosts>(GetPosts(locator()));
  GetIt.I.registerSingleton<GetRecentPosts>(GetRecentPosts(locator()));
  GetIt.I.registerSingleton<GetPostDetails>(GetPostDetails(locator()));

  // locator.registerSingleton<GetLatestVersionFromDb>(
  //     GetLatestVersionFromDb(locator()));
  locator.registerSingleton<GetSystemConfig>(GetSystemConfig(locator()));
  locator.registerSingleton<InitiatePayment>(InitiatePayment(locator()));
}
