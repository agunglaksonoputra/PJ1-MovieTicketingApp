class Movie {
  final int id;
  final String title;
  final String overview;
  final String posterPath;
  final String backdropPath;
  final String releaseDate;
  final double ratingAvg;
  final int ratingCount;
  final double view;
  final int runtime;
  final String originalLanguage;
  final List<String> genres;
  final String? certification;

  Movie({
    required this.id,
    required this.title,
    required this.overview,
    required this.posterPath,
    required this.backdropPath,
    required this.releaseDate,
    required this.ratingAvg,
    required this.ratingCount,
    required this.view,
    required this.runtime,
    required this.originalLanguage,
    required this.genres,
    required this.certification,
  });

  String get posterUrl => 'https://image.tmdb.org/t/p/w500$posterPath';
  String get backdropUrl => 'https://image.tmdb.org/t/p/w500$backdropPath';
  String get ratingAverage => ratingAvg.toStringAsFixed(1);
  String get runtimeFormatted {
    final int hours = runtime ~/ 60; // bagi, lalu dibulatkan ke bawah
    final int minutes = runtime % 60; // sisa pembagian
    if (hours > 0) {
      return '${hours}h ${minutes}m';
    } else {
      return '${minutes}m';
    }
  }

  String get originalLanguageName {
    switch (originalLanguage) {
      case 'en':
        return 'English';
      case 'ja':
        return 'Japanese';
      case 'ko':
        return 'Korean';
      case 'id':
        return 'Indonesian';
      case 'fr':
        return 'French';
      case 'zh':
        return 'Chinese';
      default:
        return originalLanguage.toUpperCase(); // fallback
    }
  }

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['id'],
      title: json['title'],
      overview: json['overview'],
      posterPath: json['poster_path'] ?? '',
      backdropPath: json['backdrop_path'] ?? '',
      releaseDate: json['release_date'] ?? '',
      ratingAvg: json['vote_average'],
      ratingCount: json['vote_count'],
      view: json['popularity'],
      runtime: json['runtime'] ?? 0,
      originalLanguage: json['original_language'] ?? '',
      genres: (json['genres'] as List<dynamic>?)
          ?.map((genre) => genre['name'] as String)
          .toList()
          ?? [],
      certification: json['certification'] ?? '',
    );
  }
}