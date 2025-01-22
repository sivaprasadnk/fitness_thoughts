import 'package:fitness_thoughts/data/models/version_model.dart';
import 'package:fitness_thoughts/data/repository/repository_impl.dart';

class GetLatestVersionFromDb {
  final RepositoryImpl repository;
  GetLatestVersionFromDb(this.repository);

  Future<VersionModel> call() async {
    return await repository.getLatestVersion();
  }
}
