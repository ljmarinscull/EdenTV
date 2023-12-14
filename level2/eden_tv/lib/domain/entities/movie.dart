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

  String get allGenres => genres.join(", ");
  String get cast => actors.join(", ");

  static Movie empty() {
    return Movie(
        id: "-1",
        title: "Avengers",
        year: "unknown",
        genres: ["Drama"],
        ratings: [10],
        duration: "3h 5m",
        releaseDate: "2020",
        storyline: "unknown",
        actors: [],
        posterUrl: "https://images-na.ssl-images-amazon.com/images/M/MV5BMjQxMDE5NDg0NV5BMl5BanBnXkFtZTgwNTA5MDE2NDM@._V1_SY500_CR0,0,337,500_AL_.jpg");
  }

 @override
  String toString() {
    return "Movie: $title";
  }
}


