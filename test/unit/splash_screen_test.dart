import 'package:fitness_thoughts/core/locator.dart';
import 'package:fitness_thoughts/data/models/blog_model.dart';
import 'package:fitness_thoughts/data/models/system_config_model.dart';
import 'package:fitness_thoughts/domain/use_case/get_recent_posts.dart';
import 'package:fitness_thoughts/domain/use_case/get_system_config.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'mock_get_recent_posts.mocks.dart';
import 'mock_get_system_config.mocks.dart';



void main() {
  late MockGetSystemConfig mockGetSystemConfig;
  late MockGetRecentPosts mockGetRecentPosts;

  setUp(() async {
    mockGetSystemConfig = MockGetSystemConfig();
    mockGetRecentPosts = MockGetRecentPosts();

    locator.registerLazySingleton<GetSystemConfig>(() => mockGetSystemConfig);
    locator.registerLazySingleton<GetRecentPosts>(() => mockGetRecentPosts);
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

    when(mockGetSystemConfig.call()).thenAnswer(
      (_) async => mockResult,
    );

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

  test('should handle successful GetRecentPosts call', () async {
    // Arrange
    final List<BlogModel> mockResult = [
      BlogModel(
        id: 1,
        title: 'Hey',
        subTitle: "Hello",
        author: "",
        imageAssetPath: "",
        imageNetworkPath: "",
        cacheKey: "",
        content: "",
        date: DateTime.now(),
        dateString: "",
        isActive: true,
        isFeatured: true,
        tags: [],
      )
    ];

    when(mockGetRecentPosts.call(1)).thenAnswer(
      (_) async => mockResult,
    );

    // Act
    final result = await locator<GetRecentPosts>().call(1);

    // Assert
    expect(result.length, 1);
    verify(mockGetRecentPosts.call(1)).called(1);
  });


}
