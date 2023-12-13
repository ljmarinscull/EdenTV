
import 'package:EdenTV/core/app_export.dart';
import 'package:EdenTV/core/error/failure.dart';
import 'package:EdenTV/data/datasource/api_client.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('- ApiClient class get method test', () {
    group('- Get Method', () {
      test('- Get Method Success test', () async {
        final service = ApiClient();

        final response = await service.get(movies);
        expect(response.isRight(), true);
      });

      test('- Get Method Fail test', () async {
        final service = ApiClient();

        final response = await service.get("test");

        expect(response.asLeft(), true);
      });

      test('- Get Method Fail and check error instance test', () async {
        final service = ApiClient();

        final response = await service.get("test");

        expect(response.asLeft(), isInstanceOf<HttpClientError>());
      });
    });
  });
}