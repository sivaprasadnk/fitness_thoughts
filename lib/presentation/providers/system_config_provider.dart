import 'package:fitness_thoughts/data/models/system_config_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SystemConfigNotifier extends StateNotifier<SystemConfig> {
  SystemConfigNotifier()
      : super(SystemConfig(
          buildNumber: 1,
          id: 1,
          isLatest: true,
          versionNumber: 100,
        ));

  Future<void> loadSystemConfig(SystemConfig config) async {
    state = config;
  }
  //   try {
  //     state = await locator<GetSystemConfig>().call();
  //   } catch (e) {
  //     state = SystemConfig(
  //       buildNumber: 1,
  //       id: 1,
  //       isLatest: true,
  //       versionNumber: 100,
  //     );
  //   }
  // }
}

// Provider for Home Screen Data
final systemConfigProvider =
    StateNotifierProvider<SystemConfigNotifier, SystemConfig>((ref) {
  return SystemConfigNotifier();
});
