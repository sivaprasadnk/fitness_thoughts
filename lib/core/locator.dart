import 'package:fitness_thoughts/data/data_source/local_datasource.dart';
import 'package:fitness_thoughts/data/data_source/remote_datasource.dart';
import 'package:fitness_thoughts/data/repository/repository_impl.dart';
import 'package:fitness_thoughts/domain/use_case/get_latest_version_from_db.dart';
import 'package:fitness_thoughts/domain/use_case/get_posts.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

final locator = GetIt.instance;

void setup() {
  locator.registerSingleton<http.Client>(http.Client());

  locator
      .registerSingleton<RemoteDatasourceImpl>(RemoteDatasourceImpl(locator()));
  locator.registerSingleton<LocalDatasourceImpl>(LocalDatasourceImpl());

  locator
      .registerSingleton<RepositoryImpl>(RepositoryImpl(locator(), locator()));

  GetIt.I.registerSingleton<GetPosts>(GetPosts(locator()));
  
  locator.registerSingleton<GetLatestVersionFromDb>(
      GetLatestVersionFromDb(locator()));

}
