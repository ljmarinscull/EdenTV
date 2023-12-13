import 'package:hive/hive.dart';
import 'package:EdenTV/core/utils/map_list.dart';

import '../../domain/entities/movie.dart';

part 'movie_model.g.dart';

@HiveType(typeId: 0)
class MovieModel {
  @HiveField(1)
  final String id;
  @HiveField(2)
  final String title;
  @HiveField(3)
  final String year;
  @HiveField(4)
  final List<String> genres;
  @HiveField(5)
  final List<int> ratings;
  @HiveField(6)
  final String duration;
  @HiveField(7)
  final String releaseDate;
  @HiveField(8)
  final String storyline;
  @HiveField(9)
  final List<String> actors;
  @HiveField(10)
  final String posterUrl;

  MovieModel(
      {required this.id,
      required this.title,
      required this.year,
      required this.genres,
      required this.ratings,
      required this.duration,
      required this.releaseDate,
      required this.storyline,
      required this.actors,
      required this.posterUrl});

  factory MovieModel.fromEntity(Movie movie) => MovieModel(
      id: movie.id,
      title: movie.title,
      year: movie.year,
      genres: movie.genres,
      ratings: movie.ratings,
      duration: movie.duration,
      releaseDate: movie.releaseDate,
      storyline: movie.storyline,
      actors: movie.actors,
      posterUrl: movie.posterUrl);

  Movie toEntity() => Movie(
      id: id,
      title: title,
      year: year,
      genres: genres,
      ratings: ratings,
      duration: duration,
      releaseDate: releaseDate,
      storyline: storyline,
      actors: actors,
      posterUrl: posterUrl);

  factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
      id: json['id'] ?? "",
      title: json['title'] ?? "",
      year: json['year'] ?? "",
      genres: getValues(json['genres']),
      ratings: getValues(json['ratings']),
      actors: getValues(json['actors']),
      duration: json['duration'] ?? "",
      releaseDate: json['releaseDate'] ?? "",
      storyline: json['storyline'] ?? "",
      posterUrl: json['posterurl'] ?? "");
}
