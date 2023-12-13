import 'dart:io';

import 'package:EdenTV/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

abstract class HttpClient {
  Future<Either<Failure, dynamic>> get(String from);
}

class HttpClientError extends Failure {
  HttpClientError(String message) : super(message);
}

class ApiClient extends HttpClient {
  late final Dio _dio;

  ApiClient({Dio? dio}){
    _dio =  dio ?? Dio(
      BaseOptions(
        connectTimeout: const Duration(seconds: 5),
        receiveTimeout: const Duration(seconds: 3),
      ),
    );
  }

  @override
  Future<Either<Failure, dynamic>> get(String from) async {
    try {
      Response response = await _dio.get(from);
      if (response.statusCode == 200) {
        return Right(response.data);
      }
      return Left(HttpClientError('Unexpected error'));
    } on SocketException {
      return Left(HttpClientError('No Internet connection'));
    } catch (error) {
      return Left(
          HttpClientError(error.toString()));
    }
  }
}
