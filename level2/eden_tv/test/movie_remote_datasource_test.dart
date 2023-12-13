import 'dart:convert';

import 'package:EdenTV/data/datasource/api_client.dart';
import 'package:EdenTV/data/datasource/movie_remote_datasource.dart';
import 'package:EdenTV/domain/entities/movie.dart';
import 'package:flutter_test/flutter_test.dart';

final testData = [
  {
    "id": "73",
    "title": "Disobedience",
    "year": "2017",
    "genres": ["Drama", "Romance"],
    "ratings": [
      7,
      1,
      6,
      9,
      10,
      3,
      5,
      2,
      2,
      10,
      4,
      4,
      1,
      2,
      3,
      7,
      10,
      1,
      3,
      2,
      9,
      5,
      8,
      4,
      1,
      10,
      1,
      4,
      4,
      2
    ],
    "poster":
        "MV5BMzYxNDI5OTcwMV5BMl5BanBnXkFtZTgwODc4MzE3NDM@._V1_SY500_CR0,0,337,500_AL_.jpg",
    "contentRating": "R",
    "duration": "PT114M",
    "releaseDate": "2018-04-27",
    "averageRating": 0,
    "originalTitle": "",
    "storyline":
        "From a screenplay by Sebasti\u00e1n Lelio and Rebecca Lenkiewicz, the film follows a woman as she returns to the community that shunned her decades earlier for an attraction to a childhood friend. Once back, their passions reignite as they explore the boundaries of faith and sexuality. Based on Naomi Alderman's book, the film stars Rachel Weisz, Rachel McAdams and Alessandro Nivola.                Written by\nBleecker Street",
    "actors": ["Rachel McAdams", "Rachel Weisz", "Alessandro Nivola"],
    "imdbRating": 7.0,
    "posterurl":
        "https://images-na.ssl-images-amazon.com/images/M/MV5BMzYxNDI5OTcwMV5BMl5BanBnXkFtZTgwODc4MzE3NDM@._V1_SY500_CR0,0,337,500_AL_.jpg"
  }
];

void main() {
  group('- MovieRemoteDatasource class test', () {
    group('- handleResponse Method', () {
      test('- handleResponse Method Success test', () async {
        final apiClient = ApiClient();
        final sut = MovieRemoteDatasource(apiClient);

        final response = sut.handleResponse(json.encode(testData));
        expect(response, isInstanceOf<List<Movie>>());
      });
    });
  });
}
