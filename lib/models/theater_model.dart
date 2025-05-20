import 'package:movify/models/schedule_model.dart';

class Theater {
  final int id;
  final String name;
  final List<Schedule> schedule;

  Theater({
    required this.id,
    required this.name,
    required this.schedule,
  });

  factory Theater.fromMap(Map<String, dynamic> map) {
    return Theater(
      id: map['id'],
      name: map['name'],
      schedule: List<Schedule>.from(
        map['Schedules'].map((s) => Schedule.fromMap(s)),
      ),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'Schedules': schedule.map((s) => s.toMap()).toList(),
    };
  }


}
