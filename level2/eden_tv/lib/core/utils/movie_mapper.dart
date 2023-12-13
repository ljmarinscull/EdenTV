import '../../domain/entities/movie.dart';
import 'map_list.dart';

class MovieMapper {
  static Movie fromJson(Map<String, dynamic> json) =>
      Movie(
          id: json['id'] ?? "",
          title: json['title'] ?? "",
          year: json['year'] ?? "",
          genres: getValues(json['genres']),
          ratings: getValues(json['ratings']),
          actors: getValues(json['actors']),
          duration: parseDuration(json["duration"]),
          releaseDate: json['releaseDate'] ?? "",
          storyline: json['storyline'] ?? "",
          posterUrl: json['posterurl'] ?? "");

  static String parseDuration(String value) {
    var duration = "unknown";

    if (value.isNotEmpty) {
      final parsedDuration = value.substring(2, value.length - 1);
      final parsedMinutes = int.tryParse(parsedDuration);
      if (parsedMinutes != null) {
        final hours = (parsedMinutes / 60).round();
        final minutes = parsedMinutes % 60;
        duration = "${hours}h ${minutes}m";
        return duration;
      }
      return duration;
    }
    return duration;
  }
}