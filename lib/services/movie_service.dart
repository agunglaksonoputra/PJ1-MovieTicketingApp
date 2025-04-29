import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:movify/models/movie_model.dart';

class MovieService {
  final String _baseUrl = 'https://api.themoviedb.org/3' ?? '';
  final String _apiKey = dotenv.env['TMDB_API_KEY'] ?? '';

  Future<List<Movie>> NowPlaying() async {
    final response = await http.get(
      Uri.parse('$_baseUrl/movie/now_playing?api_key=$_apiKey&language=en-US&page=1&region=ID'),
    );

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final List results = jsonData['results'];
      final List<Movie> movies = results.map((movie) => Movie.fromJson(movie)).toList();
      movies.sort((a, b) => b.ratingAvg.compareTo(a.ratingAvg));
      return movies.take(16).toList();
    } else {
      throw Exception('Failed to load now playing movies');
    }
  }

  Future<List<Movie>> MostPopular() async {
    final response = await http.get(
      Uri.parse('$_baseUrl/movie/popular?api_key=$_apiKey&language=en-US&page=1&region=ID'),
    );

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final List results = jsonData['results'];
      final List<Movie> movies = results.map((movie) => Movie.fromJson(movie)).where((movie) => movie.ratingAvg >= 6.5).toList();
      movies.sort((a, b) => b.view.compareTo(a.view));


      return movies.take(6).toList();
    } else {
      throw Exception('Failed to load most popular movies');
    }
  }

  Future<List<Movie>> Upcoming() async {
    final response = await http.get(
      Uri.parse('$_baseUrl/movie/upcoming?api_key=$_apiKey&language=en-US&page=1&region=ID'),
    );

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final List results = jsonData['results'];
      final List<Movie> movies = results.map((movie) => Movie.fromJson(movie)).toList();
      movies.sort((a, b) => b.ratingAvg.compareTo(a.ratingAvg));
      return movies.take(16).toList();
    } else {
      throw Exception('Failed to load upcoming movies');
    }
  }

  Future<Movie> getMovieById(int id) async {
    final response = await http.get(
      Uri.parse('$_baseUrl/movie/$id?api_key=$_apiKey&language=en-US'),
    );

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      return Movie.fromJson(jsonData);
    } else {
      throw Exception('Failed to load movie detail');
    }
  }

  Future<String> getMovieCertification(int movieId) async {
    final response = await http.get(
      Uri.parse('$_baseUrl/movie/$movieId/release_dates?api_key=$_apiKey'),
    );

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final List results = jsonData['results'];

      // Cari region ID (Indonesia), kalau tidak ketemu bisa fallback ke US
      final idRelease = results.firstWhere(
            (r) => r['iso_3166_1'] == 'ID',
        orElse: () => results.firstWhere(
              (r) => r['iso_3166_1'] == 'US',
          orElse: () => null,
        ),
      );

      if (idRelease != null && idRelease['release_dates'] != null && idRelease['release_dates'].isNotEmpty) {
        return idRelease['release_dates'][0]['certification'] ?? 'NR'; // NR = Not Rated
      } else {
        return 'NR';
      }
    } else {
      throw Exception('Failed to load certification');
    }
  }
}