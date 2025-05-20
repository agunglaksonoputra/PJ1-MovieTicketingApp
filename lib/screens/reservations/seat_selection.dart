import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:movify/models/cinema_model.dart';
import 'package:movify/models/movie_model.dart';
import 'package:movify/models/schedule_model.dart';
import 'package:movify/models/seat_model.dart';
import 'package:movify/models/theater_model.dart';
import 'package:movify/screens/reservations/order_summary_page.dart';
import 'package:movify/services/seat_service.dart';

void main() {
  runApp(const mainApp());
}

class mainApp extends StatelessWidget {
  const mainApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final data = {
      'city': 'Bandung',
    };

    return MaterialApp(
      title: 'Order Summary',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // home: const SeatSelectionPage(theaterId: 4, scheduleId: 1),
      home: SeatSelectionPage(theaterId: 4, scheduleId: 1, data: data),
      debugShowCheckedModeBanner: false,
    );
  }
}

class SeatSelectionPage extends StatefulWidget {
  final int theaterId;
  final int scheduleId;
  final Map<String, dynamic> data;

  const SeatSelectionPage({Key? key, required this.theaterId, required this.scheduleId, required this.data}) : super(key: key);

  @override
  _SeatSelectionPageState createState() => _SeatSelectionPageState();
}

class _SeatSelectionPageState extends State<SeatSelectionPage> {
  final SeatService _seatService = SeatService();

  late Movie movie;
  late Theater theater;
  late Cinema cinema;
  late Schedule schedule;

  List<Seat> allSeats = [];
  List<Map<String, dynamic>> selectedSeatIds = [];
  bool isLoading = true;
  String? errorMessage;

  @override
  void initState() {
    super.initState();

    movie = widget.data['movie'];
    theater = widget.data['theater'];
    cinema = widget.data['cinema'];
    schedule = widget.data['schedule'];

    loadSeats();
  }

  Future<void> loadSeats() async {
    try {
      List<Seat> seats = await _seatService.fetchSeats(theater.id, schedule.id);
      setState(() {
        allSeats = seats;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        errorMessage = e.toString();
        print(errorMessage);
        isLoading = false;
      });
    }
  }

  void toggleSeatSelection(Seat seat) {
    if (seat.isBooked) return;

    setState(() {
      if (selectedSeatIds.any((seatMap) => seatMap['id'] == seat.id)) {
        selectedSeatIds.removeWhere((seatMap) => seatMap['id'] == seat.id);
      } else {
        if (selectedSeatIds.length < 6) {
          selectedSeatIds.add({'id': seat.id, 'seat_label': seat.label});
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Maksimal 6 kursi dapat dipilih.'),
              duration: Duration(seconds: 2),
            ),
          );
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {

    Map<String, List<Seat>> groupedByRow = {};
    for (var seat in allSeats) {
      groupedByRow.putIfAbsent(seat.row, () => []).add(seat);
    }

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: FaIcon(FontAwesomeIcons.angleLeft),
          iconSize: 30.0,
          onPressed: () => Navigator.pop(context),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              movie.title,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              '${cinema.name}, ${theater.name}',
              style: TextStyle(
                fontSize: 12,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  schedule.formattedDate,
                  style: TextStyle(
                    fontWeight: FontWeight.bold
                  ),
                ),
                Text(
                  schedule.formattedStartTime
                ),
              ],
            ),
          ),
        ],
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : errorMessage != null
          ? Center(child: Text(errorMessage ?? 'Error'))
          : Column(
        children: [
          const SizedBox(height: 20),
          Expanded(
            child: InteractiveViewer(
              minScale: 0.1,
              maxScale: 3.0,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Column(
                  children: [
                    Center(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Center(
                          child: Text(
                            'LAYAR',
                            style: TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),

                    Column(
                      children: groupedByRow.entries.map((entry) {
                        entry.value.sort((a, b) => a.col.compareTo(b.col));
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: entry.value.map(buildSeat).toList(),
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // Daftar Kursi dipilih
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Kursi yang dipilih: ${selectedSeatIds.map((seat) => seat['seat_label']).join(', ')}',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                LegendBox(color: Colors.green, label: "Available"),
                LegendBox(color: Colors.grey, label: "Booked"),
                LegendBox(color: Colors.blueAccent, label: "Selected"),
              ],
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 50,
            child: ElevatedButton(
              onPressed: selectedSeatIds.isEmpty
                  ? null
                  : () {
                // Kirim selectedSeatIds ke backend atau halaman pembayaran
                print("Seat dipilih: $selectedSeatIds");
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => OrderSummaryPage(
                          data: {
                            'movie': movie,
                            'theater': theater,
                            'cinema': cinema,
                            'schedule': schedule,
                            'seats': selectedSeatIds
                          }
                      ),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF2A3663),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero,
                ),
              ),
              child: const Text('Lanjutkan'),
            ),
          ),
          Container(
            height: 30,
            width: double.infinity,
            color: Colors.white,
          ),
        ],
      ),
    );
  }

  Widget buildSeat(Seat seat) {
    Color color;
    if (seat.isBooked) {
      color = Colors.grey.shade400;
    } else if (selectedSeatIds.any((seatMap) => seatMap['id'] == seat.id)) {
      color = Colors.blueAccent;
    } else {
      color = Colors.green;
    }

    return GestureDetector(
      onTap: () => toggleSeatSelection(seat),
      child: Container(
        margin: const EdgeInsets.all(4),
        width: 40,
        height: 40,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Text(
          seat.label,
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12),
        ),
      ),
    );
  }
}

class LegendBox extends StatelessWidget {
  final Color color;
  final String label;

  const LegendBox({Key? key, required this.color, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(width: 20, height: 20, color: color, margin: const EdgeInsets.only(right: 8)),
        Text(label),
      ],
    );
  }
}
