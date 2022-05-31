// To parse this JSON data, do
//
//     final movieSearh = movieSearhFromMap(jsonString);

import 'dart:convert';

import 'package:peliculas/models/movie.dart';

class MovieSearh {
  MovieSearh({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  int page;
  List<Movie> results;
  int totalPages;
  int totalResults;

  factory MovieSearh.fromJson(String str) =>
      MovieSearh.fromMap(json.decode(str));

  factory MovieSearh.fromMap(Map<String, dynamic> json) => MovieSearh(
        page: json["page"],
        results: List<Movie>.from(json["results"].map((x) => Movie.fromMap(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
      );
}
