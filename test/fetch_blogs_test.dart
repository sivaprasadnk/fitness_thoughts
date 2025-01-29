import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:fitness_thoughts/core/locator.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'dio_client_test.mocks.dart';

// class MockDioClient extends Mock implements DioClient {}
// class MockDio extends Mock implements Dio {}

// @GenerateMocks([DioClient])
void main() {
  late MockDio mockDio;
  setup();
  setUp(() {
    mockDio = MockDio();
  });
  group('blogs test', () {
    test('fetch blogs', () async {
      /// arrange
      var url = 'blogs';
      const testJson = '''[
    {
      "id": 2,
      "created_at": "2025-01-23T08:16:30.365886+00:00",
      "title": "Sleep and Obesity: The Hidden Link You Must Know",
      "sub_title": "",
      "content": "",
      "author": "admin",
      "image_asset_path": "assets/images/image3.jpg",
      "image_network_path": "https://firebasestorage.googleapis.com/v0/b/fitness-thoughts-bac27.firebasestorage.app/o/image3.jpg?alt=media&token=a59cebae-d8ec-4f04-9475-f89383a7eeb8",
      "is_active": true,
      "is_featured": true,
      "date_string": "Jan 2, 2025",
      "date_time": "2025-01-02"
    }, {
      "id": 2,
      "created_at": "2025-01-23T08:16:30.365886+00:00",
      "title": "Sleep and Obesity: The Hidden Link You Must Know",
      "sub_title": "",
      "content": "",
      "author": "admin",
      "image_asset_path": "assets/images/image3.jpg",
      "image_network_path": "https://firebasestorage.googleapis.com/v0/b/fitness-thoughts-bac27.firebasestorage.app/o/image3.jpg?alt=media&token=a59cebae-d8ec-4f04-9475-f89383a7eeb8",
      "is_active": true,
      "is_featured": true,
      "date_string": "Jan 2, 2025",
      "date_time": "2025-01-02"
    }
    ]
    ''';
      when(mockDio.get(url)).thenAnswer((_) async => Response(
          data: testJson,
          statusCode: 200,
          requestOptions: RequestOptions(path: url)));

      // Act
      final result = await mockDio.get(url);

      // Assert
      expect((jsonDecode(result.data) as List).length, 2);
      // expect(result.any((blog) => blog.isFeatured!), true);
      // verify(mockDio.get(url)).called(1);
    });
  });
}
