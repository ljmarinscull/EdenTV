import 'package:dartz/dartz.dart';

import '../../core/error/failure.dart';
import '../entities/movie_ui_state.dart';

abstract class MovieRepository {
    Future<Either<Failure, MovieUIState>> requestMovies();
}