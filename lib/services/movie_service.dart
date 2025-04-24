import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:movify/models/movie_model.dart';

class MovieService {
  final String _baseUrl = 'https://api.themoviedb.org/3' ?? '';
  final String _apiKey = dotenv.env['TMDB_API_KEY'] ?? '';

  Future<List<Movie>> NowPlaying() async {
    final response = await http.get(
      Uri.parse('$_baseUrl/movie/now_playing?api_key=$_apiKey&language=id-ID&page=1&region=ID'),
    );

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final List results = jsonData['results'];
      final List<Movie> movies = results.map((movie) => Movie.fromJson(movie)).toList();
      movies.sort((a, b) => b.ratingAvg.compareTo(a.ratingAvg));
      return movies.take(15).toList();
    } else {
      throw Exception('Failed to load now playing movies');
    }
  }

  Future<List<Movie>> MostPopular() async {
    final response = await http.get(
      Uri.parse('$_baseUrl/movie/popular?api_key=$_apiKey&language=id-ID&page=1&region=ID'),
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
}