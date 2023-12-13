import 'dart:convert';

import 'package:EdenTV/core/error/failure.dart';
import 'package:EdenTV/data/datasource/api_client.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../core/utils/movie_mapper.dart';
import '../../domain/entities/movie.dart';

enum MovieRemoteDatasourceError {
  invalidData,
  connectivity
}

class Error extends Failure {
  final MovieRemoteDatasourceError type;
  Error(this.type, String message): super(message);
}

class MovieRemoteDatasource {

  final String url;
  final HttpClient apiClient;

  MovieRemoteDatasource(this.apiClient, [this.url = ""]);

  Future<Either<Failure, List<Movie>>> requestMovies() async {
    final result = await apiClient.get(url);
    
    if(result.isRight()){
      return Right(handleResponse(result.asRight()));
    }
    return Left(result.asLeft());
  }

  List<Movie> handleResponse(dynamic responseData){
    final data = (json.decode(responseData) as List);
    return data.map((value) => MovieMapper.fromJson(value)).toList();
  }
}