import 'package:intl/intl.dart';
import 'package:movify/models/theater_model.dart';

class Schedule {
  final int id;
  final String title;
  final String date;
  final String startTime;
  final double price;

  Schedule({
    required this.id,
    required this.title,
    required this.date,
    required this.startTime,
    required this.price,
  });

  String get formattedPrice {
    final formatter = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp ',
      decimalDigits: 0,
    );
    return formatter.format(price);
  }

  String get formattedStartTime {
    try {
      final parsedTime = DateFormat('HH:mm:ss').parse(startTime);
      return DateFormat('HH:mm').format(parsedTime);
    } catch (e) {
      return startTime;
    }
  }

  String get formattedFullDate {
    final parsedDate = DateTime.tryParse(date);
    if (parsedDate != null) {
      return DateFormat('EEEE, d MMMM yyyy', 'en_US').format(parsedDate);
    } else {
      return date;
    }
  }

  String get formattedDate {
    final parsedDate = DateTime.tryParse(date);
    if (parsedDate != null) {
      return DateFormat('d MMM').format(parsedDate);
    } else {
      return date;
    }
  }

  factory Schedule.fromMap(Map<String, dynamic> map) {
    return Schedule(
      id: map['id'],
      title: map['title'],
      date: map['date'],
      startTime: map['start_time'],
      price: double.parse(map['price']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'date': date,
      'start_time': startTime,
      'price': price
    };
  }
}