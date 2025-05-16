import 'package:flutter/material.dart';

void main() {
  runApp(const CinemaApp());
}

class CinemaApp extends StatelessWidget {
  const CinemaApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pemilihan Kursi Bioskop',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const SeatSelectionScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class SeatSelectionScreen extends StatefulWidget {
  const SeatSelectionScreen({Key? key}) : super(key: key);

  @override
  State<SeatSelectionScreen> createState() => _SeatSelectionScreenState();
}

class _SeatSelectionScreenState extends State<SeatSelectionScreen> {
  // Status kursi: 0 = tersedia, 1 = terpilih, 2 = sudah dipesan
  final List<List<int>> _seats = List.generate(
    8,
        (_) => List.generate(20, (_) => 0),
  );

  // Beberapa kursi yang sudah dipesan (contoh)
  @override
  void initState() {
    super.initState();
    // Contoh kursi yang sudah dipesan
    _seats[2][3] = 2;
    _seats[2][4] = 2;
    _seats[5][7] = 2;
    _seats[5][8] = 2;
    _seats[6][1] = 2;
  }

  int _selectedSeats = 0;
  final int _maxSeats = 6; // Maksimal kursi yang bisa dipilih

  void _toggleSeat(int row, int col) {
    if (_seats[row][col] == 2) return; // Tidak bisa memilih kursi yang sudah dipesan

    setState(() {
      if (_seats[row][col] == 0) {
        // Jika jumlah kursi yang dipilih masih kurang dari maksimum
        if (_selectedSeats < _maxSeats) {
          _seats[row][col] = 1;
          _selectedSeats++;
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Anda tidak dapat memilih lebih dari 6 kursi'),
              duration: Duration(seconds: 2),
            ),
          );
        }
      } else {
        _seats[row][col] = 0;
        _selectedSeats--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pilih Kursi'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          // Layar bioskop
          Expanded(
            child: InteractiveViewer(
              minScale: 0.1,
              maxScale: 3.0,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Column(
                    children: [
                      // Layar
                      Center(
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 20,
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

                      // Kursi
                      Column(
                        children: List.generate(
                          _seats.length,
                              (row) => Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),  // Padding kiri dan kanan
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: List.generate(
                                _seats[row].length,
                                    (col) => GestureDetector(
                                  onTap: () => _toggleSeat(row, col),
                                  child: Container(
                                    margin: const EdgeInsets.all(3),
                                    width: 30,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      color: _getColor(_seats[row][col]),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Center(
                                      child: Text(
                                        '${String.fromCharCode(65 + row)}${col + 1}',
                                        style: TextStyle(
                                          color: _seats[row][col] == 1 ? Colors.white : Colors.black54,
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          // Keterangan warna kursi
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildLegendItem(Colors.green, 'Tersedia'),
                _buildLegendItem(Colors.blue, 'Dipilih'),
                _buildLegendItem(Colors.red, 'Sudah Dipesan'),
              ],
            ),
          ),
          // Info kursi yang dipilih
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Kursi yang dipilih: $_selectedSeats / $_maxSeats',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          // Tombol lanjutkan
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: ElevatedButton(
              onPressed: _selectedSeats > 0
                  ? () {
                _confirmSelection();
              }
                  : null,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              ),
              child: const Text(
                'Lanjutkan',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLegendItem(Color color, String label) {
    return Row(
      children: [
        Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(3),
          ),
        ),
        const SizedBox(width: 5),
        Text(label),
      ],
    );
  }

  Color _getColor(int status) {
    switch (status) {
      case 0:
        return Colors.green[300]!;
      case 1:
        return Colors.blue;
      case 2:
        return Colors.red;
      default:
        return Colors.green[300]!;
    }
  }

  void _confirmSelection() {
    // Dapatkan kursi yang terpilih
    List<String> selectedSeats = [];
    for (int i = 0; i < _seats.length; i++) {
      for (int j = 0; j < _seats[i].length; j++) {
        if (_seats[i][j] == 1) {
          selectedSeats.add('${String.fromCharCode(65 + i)}${j + 1}');
        }
      }
    }

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Konfirmasi Pemilihan'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Anda telah memilih kursi:'),
            const SizedBox(height: 10),
            Text(
              selectedSeats.join(', '),
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text('Lanjutkan ke pembayaran?'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Batal'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              // Di sini Anda bisa menambahkan navigasi ke halaman pembayaran
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Mengarahkan ke halaman pembayaran...'),
                ),
              );
            },
            child: const Text('Lanjutkan'),
          ),
        ],
      ),
    );
  }
}