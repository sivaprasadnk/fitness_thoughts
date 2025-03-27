import 'package:fitness_thoughts/data/models/system_config_model.dart';
import 'package:fitness_thoughts/data/repository/repository_impl.dart';

class GetSystemConfig {
  final RepositoryImpl repository;
  GetSystemConfig(this.repository);

  Future<SystemConfig> call(String fcmToken) async {
    return await repository.getSystemConfig(fcmToken);
  }
}
