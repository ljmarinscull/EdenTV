
import 'package:EdenTV/domain/entities/movie_ui_state.dart';
import 'package:dartz/dartz.dart';

import '../../core/error/failure.dart';
import '../repository/movie_repository.dart';

class RequestMovies {
  final MovieRepository repository;

  RequestMovies(this.repository);

  Future<Either<Failure, MovieUIState>> call() async {
    return repository.requestMovies();
  }
}