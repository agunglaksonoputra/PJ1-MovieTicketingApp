import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

import '../models/seat_model.dart';

class SeatService {
  final String _baseUrl = dotenv.env['BASE_URL']!;


  Future<List<Seat>> fetchSeats(int theaterId, int scheduleId) async {
    final seatsResponse = await http.get(
      Uri.parse('$_baseUrl/cinema/theater/$theaterId/seat'),
    );

    final bookedResponse = await http.get(
      Uri.parse('$_baseUrl/cinema/schedule/$scheduleId/seat-booked'),
    );

    if (seatsResponse.statusCode == 200 && bookedResponse.statusCode == 200) {
      final List<dynamic> seatsJson = jsonDecode(seatsResponse.body);
      final List<dynamic> bookedJson = jsonDecode(bookedResponse.body);

      final List<int> bookedSeatIds = bookedJson
          .map<int>((item) => item['seat_id'] as int)
          .toList();

      return seatsJson.map((json) {
        final seat = Seat.fromJson(json);
        seat.isBooked = bookedSeatIds.contains(seat.id);
        return seat;
      }).toList();
    } else {
      throw Exception('Failed to load seats');
    }
  }

}