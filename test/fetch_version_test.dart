import 'package:fitness_thoughts/core/common_strings.dart';
import 'package:fitness_thoughts/data/data_source/remote_datasource.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'fetch_version_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  late MockClient mockClient;

  setUp(() {
    mockClient = MockClient();
  });
  group(
    'get version',
    () {
      test(
        'testing fetching version details from api',
        () async {
          /// arrange
          var url = '${baseUrl}version';
          var testJson =
              '[{"id":1,"created_at":"2025-01-22T11:46:01.222111+00:00","build_number":9,"version_number":100,"is_latest":true}]';
          when(mockClient.get(Uri.parse(url))).thenAnswer(
            (_) async => http.Response(testJson, 200),
          );

          /// act
          var result =
              await RemoteDatasourceImpl(mockClient).getLatestVersion();

          /// assert
          expect(result.isLatest, false);
        },
      );
    },
  );
}
