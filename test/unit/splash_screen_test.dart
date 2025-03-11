import 'package:fitness_thoughts/core/locator.dart';
import 'package:fitness_thoughts/data/models/system_config_model.dart';
import 'package:fitness_thoughts/domain/use_case/get_system_config.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockGetSystemConfig extends Mock implements GetSystemConfig {}

void main() {
  late MockGetSystemConfig mockGetSystemConfig;

  setUp(() async {
    mockGetSystemConfig = MockGetSystemConfig();

    locator.registerLazySingleton<GetSystemConfig>(() => mockGetSystemConfig);
  });

  tearDown(() {
    locator.reset();
  });

  test('should handle successful GetSystemConfig call', () async {
    // Arrange
    final mockResult = SystemConfig(
      buildNumber: 2, // Higher version to trigger update logic
      showBiometrics: true,
      id: 1,
      isLatest: true,
      versionNumber: 100,
    );

    when(mockGetSystemConfig.call()).thenAnswer((_) async => mockResult);

    // Act
    final result = await locator<GetSystemConfig>().call();

    // Assert
    expect(result.buildNumber, 2);
    expect(result.showBiometrics, true);
    verify(mockGetSystemConfig.call()).called(1);
  });

  test('should handle failure of GetSystemConfig call', () async {
    // Arrange
    when(mockGetSystemConfig.call()).thenThrow(Exception('API Error'));

    // Act
    try {
      await locator<GetSystemConfig>().call();
      fail('Exception not thrown');
    } catch (e) {
      // Assert
      expect(e.toString(), contains('API Error'));
    }

    verify(mockGetSystemConfig.call()).called(1);
  });
}
