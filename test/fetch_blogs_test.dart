// import 'package:dio/dio.dart';
// import 'package:fitness_thoughts/core/common_strings.dart';
// import 'package:fitness_thoughts/data/data_source/remote_datasource.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/annotations.dart';
// import 'package:mockito/mockito.dart';

// import 'fetch_blogs_test.mocks.dart';

// @GenerateMocks([Dio])
// void main() {
//   late MockClient mockClient;

//   setUp(() {
//     mockClient = MockClient();
//   });
//   group('blogs test', () {
//     test('fetch blogs', () async {
//       /// arrange
//       var url = '${baseUrl}blogs';
//       const testJson = '''[
//     {
//       "id": 2,
//       "created_at": "2025-01-23T08:16:30.365886+00:00",
//       "title": "Sleep and Obesity: The Hidden Link You Must Know",
//       "sub_title": "",
//       "content": "",
//       "author": "admin",
//       "image_asset_path": "assets/images/image3.jpg",
//       "image_network_path": "https://firebasestorage.googleapis.com/v0/b/fitness-thoughts-bac27.firebasestorage.app/o/image3.jpg?alt=media&token=a59cebae-d8ec-4f04-9475-f89383a7eeb8",
//       "is_active": true,
//       "is_featured": true,
//       "date_string": "Jan 2, 2025",
//       "date_time": "2025-01-02"
//     }
//     ]
//     ''';
//       when(mockClient.getUri(Uri.parse(url)))
//           .thenAnswer((_) async => Response(testJson, 200));

//       // Act
//       final result = await RemoteDatasourceImpl(mockClient).getPosts();

//       // Assert
//       expect(result.length, 1);
//       expect(result.any((blog) => blog.isFeatured!), true);
//       verify(mockClient.get(Uri.parse('${baseUrl}blogs'))).called(1);
//     });
//   });
// }
