class Seat {
  final int id;
  final int theaterId;
  final String label;
  final String row;
  final int col;
  bool isBooked;
  bool isSelected;

  Seat({
    required this.id,
    required this.theaterId,
    required this.label,
    required this.row,
    required this.col,
    this.isBooked = false,
    this.isSelected = false,
  });

  factory Seat.fromMap(Map<String, dynamic> map) {
    return Seat(
      id: map['id'],
      theaterId: map['theater_id'],
      label: map['seat_label'],
      row: map['row'],
      col: map['col']
    );
  }

  factory Seat.fromJson(Map<String, dynamic> json) {
    if (json['id'] == null ||
        json['theater_id'] == null ||
        json['seat_label'] == null ||
        json['row'] == null ||
        json['col'] == null) {
      throw Exception('Invalid seat data: $json');
    }

    return Seat(
      id: json['id'] as int,
      theaterId: json['theater_id'] as int,
      label: json['seat_label'] as String,
      row: json['row'] as String,
      col: json['col'] as int,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'theater_id': theaterId,
      'seat_label': label,
      'row': row,
      'col': col
    };
  }

}
