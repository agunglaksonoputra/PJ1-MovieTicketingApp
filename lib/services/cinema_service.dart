import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:movify/models/cinema_model.dart';

class CinemaService {
  final String _baserUrl = dotenv.env['BASE_URL']!;

  Future<List<Cinema>> getCinemasShowingMovie(String city, int movieId) async {
    final response = await http.get(
      Uri.parse('$_baserUrl/cinema/get-cinema-by-showing-movie/city/$city/movie/$movieId'),
    );

    if (response.statusCode == 200) {
      final List data = jsonDecode(response.body);
      return data.map((e) => Cinema.fromMap(e)).toList();
    } else {
      throw Exception('Failed to load cinemas');
    }
  }
}