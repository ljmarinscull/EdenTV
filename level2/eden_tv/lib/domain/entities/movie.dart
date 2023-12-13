import 'package:EdenTV/core/app_export.dart';

class Movie {
  String id;
  String title;
  String year;
  List<String> genres;
  List<int> ratings;
  String duration;
  String releaseDate;
  String storyline;
  List<String> actors;
  String posterUrl;

  Movie({
      required this.id,
      required this.title,
      required this.year,
      required this.genres,
      required this.ratings,
      required this.duration,
      required this.releaseDate,
      required this.storyline,
      required this.actors,
      required this.posterUrl
      });

  double getRating() {
    if(ratings.isEmpty) {
      return 0.0;
    }
    return (ratings.reduce((a, b) => a + b) / ratings.length).toDoubleValue(fractionDigits:1);
  }

  get allGenres => genres.join(", ");
  get cast => actors.join(", ");

  static Movie empty() {
    return Movie(
        id: "-1",
        title: "unknown",
        year: "unknown",
        genres: [],
        ratings: [],
        duration: "unknown",
        releaseDate: "unknown",
        storyline: "unknown",
        actors: [],
        posterUrl: "unknown");
  }

 @override
  String toString() {
    return "Movie: $title";
  }
}


