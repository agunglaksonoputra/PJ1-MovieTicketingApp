import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: SeatSelectionPage()));
}

class SeatSelectionPage extends StatefulWidget {
  @override
  _SeatSelectionPageState createState() => _SeatSelectionPageState();
}

class _SeatSelectionPageState extends State<SeatSelectionPage> {
  final int rows = 5;
  final int columns = 8;
  final List<String> bookedSeats = ['A1', 'A2', 'C4']; // Kursi yang sudah dibooking
  List<String> selectedSeats = [];

  String getSeatId(int row, int column) => '${String.fromCharCode(65 + row)}${column + 1}';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Pilih Kursi')),
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(16),
              itemCount: rows * columns,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: columns,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
              ),
              itemBuilder: (context, index) {
                int row = index ~/ columns;
                int col = index % columns;
                String seatId = getSeatId(row, col);
                bool isBooked = bookedSeats.contains(seatId);
                bool isSelected = selectedSeats.contains(seatId);

                Color seatColor;
                if (isBooked) seatColor = Colors.red;
                else if (isSelected) seatColor = Colors.blue;
                else seatColor = Colors.green;

                return GestureDetector(
                  onTap: isBooked
                      ? null
                      : () {
                    setState(() {
                      if (isSelected) {
                        selectedSeats.remove(seatId);
                      } else {
                        selectedSeats.add(seatId);
                      }
                    });
                  },
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: seatColor,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(seatId, style: TextStyle(color: Colors.white)),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text('Kursi Dipilih: ${selectedSeats.join(', ')}'),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: selectedSeats.isEmpty ? null : () {
                    // Aksi konfirmasi
                    showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                        title: Text('Konfirmasi'),
                        content: Text('Kursi yang dipilih: ${selectedSeats.join(', ')}'),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: Text('Tutup'),
                          )
                        ],
                      ),
                    );
                  },
                  child: Text('Konfirmasi'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
