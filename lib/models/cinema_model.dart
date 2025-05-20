import 'package:movify/models/theater_model.dart';

class Cinema {
  final int id;
  final String name;
  final String address;
  final String city;
  final List<Theater> theater;

  Cinema({
    required this.id,
    required this.name,
    required this.address,
    required this.city,
    required this.theater
  });

  factory Cinema.fromMap(Map<String, dynamic> map) {
    return Cinema(
      id: map['id'],
      name: map['name'],
      address: map['address'],
      city: map['city'],
      theater: List<Theater>.from(
        map['Theaters'].map((t) => Theater.fromMap(t)),
      ),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'address': address,
      'city': city,
      'Theaters': theater
    };
  }
}