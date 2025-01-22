import 'package:fitness_thoughts/data/data_source/remote_datasource.dart';
import 'package:fitness_thoughts/data/repository/repository_impl.dart';
import 'package:fitness_thoughts/domain/use_case/get_latest_version_from_db.dart';
import 'package:fitness_thoughts/domain/use_case/get_posts.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void setup() {
  locator.registerSingleton<RemoteDatasourceImpl>(RemoteDatasourceImpl());
  locator.registerSingleton<RepositoryImpl>(RepositoryImpl(locator()));

// Alternatively you could write it if you don't like global variables
  // GetIt.I.registerSingleton<GetRecentPosts>(GetRecentPosts(locator()));
  GetIt.I.registerSingleton<GetPosts>(GetPosts(locator()));
  
  locator.registerSingleton<GetLatestVersionFromDb>(
      GetLatestVersionFromDb(locator()));
}
