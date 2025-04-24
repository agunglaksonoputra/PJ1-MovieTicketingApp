import 'dart:ffi';

class Movie {
  final int id;
  final String title;
  final String overview;
  final String posterPath;
  final String releaseDate;
  final double ratingAvg;
  final int ratingCount;
  final double view;

  Movie({
    required this.id,
    required this.title,
    required this.overview,
    required this.posterPath,
    required this.releaseDate,
    required this.ratingAvg,
    required this.ratingCount,
    required this.view,
  });

  String get posterUrl => 'https://image.tmdb.org/t/p/w500$posterPath';
  String get ratingAverage => ratingAvg.toStringAsFixed(1);

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['id'],
      title: json['title'],
      overview: json['overview'],
      posterPath: json['poster_path'] ?? '',
      releaseDate: json['release_date'] ?? '',
      ratingAvg: json['vote_average'],
      ratingCount: json['vote_count'],
      view: json['popularity'],
    );
  }
}