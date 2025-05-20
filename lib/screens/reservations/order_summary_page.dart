import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:movify/models/movie_model.dart';
import 'package:movify/models/theater_model.dart';
import 'package:movify/screens/movie/detail_movie_page.dart';
import 'package:movify/services/movie_service.dart';

import '../../models/cinema_model.dart';
import '../../models/schedule_model.dart';

class OrderSummaryPage extends StatefulWidget {
  final Map<String, dynamic> data;

  const OrderSummaryPage({
    super.key,
    required this.data
  });

  @override
  State<StatefulWidget> createState() => _OrderSummaryPageState();
}

class _OrderSummaryPageState extends State<OrderSummaryPage> {
  final MovieService movieService = MovieService();

  final double convenienceFee = 500;

  late Movie movie;
  late Theater theater;
  late Cinema cinema;
  late Schedule schedule;
  late List<Map<String, dynamic>> seats;

  // Movie? _detailMovie;

  void initState() {
    super.initState();

    movie = widget.data['movie'];
    theater = widget.data['theater'];
    cinema = widget.data['cinema'];
    schedule = widget.data['schedule'];
    seats = widget.data['seats'];

    // loadAPI();
  }

  // void loadAPI() async {
  //   final movie = await movieService.getMovieById(movie.id);
  //   setState(() {
  //     _detailMovie = movie;
  //   });
  // }
  String formatRupiah(double value) {
    // Buang digit desimal dengan toInt()
    int intValue = value.toInt();

    // Format angka dengan titik sebagai pemisah ribuan
    final reg = RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
    final rupiah = intValue.toString().replaceAllMapped(reg, (Match match) => '${match[1]}.');

    return 'Rp$rupiah';
  }

  @override
  Widget build(BuildContext context) {
    double totalPayment = (schedule.price + convenienceFee) * seats.length;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: FaIcon(FontAwesomeIcons.angleLeft),
          iconSize: 30.0,
          onPressed: () {
            int count = 0;
            Navigator.popUntil(
              context,
                  (route) => count++ == 2,
            );
          },
        ),
        title: Text(
          'Order Summary',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Expanded(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 80,
                      height: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.grey[300],
                        image: DecorationImage(
                          image: NetworkImage(movie.posterUrl),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            movie.title,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          SizedBox(height: 8),
                          Container(
                            child: Row(
                              children: [
                                Icon(Icons.star, color: Colors.amber, size: 18),
                                Text(
                                  movie.ratingAverage,
                                  style: TextStyle(
                                    color: Colors.grey[600],
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            cinema.name,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            theater.name,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            '${schedule.formattedFullDate}, ${schedule.formattedStartTime}',
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'ORDER NUMBER : 184673095736285873',
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 13,
                      ),
                    ),
                    Divider(height: 20),
                  ],
                ),
              ),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Transaction Details',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Text(
                          '${seats.length} TICKET',
                          style: TextStyle(fontSize: 14),
                        ),
                        Spacer(),
                        Text(
                          '${seats.map((seat) => seat['seat_label']).join(', ')}',
                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Text(
                          'REGULAR SEAT',
                          style: TextStyle(fontSize: 14),
                        ),
                        Spacer(),
                        Row(
                          children: [
                            Text(
                              formatRupiah(schedule.price),
                              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              ' x ${seats.length}',
                              style: TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'CONVENIENCE FEE',
                              style: TextStyle(fontSize: 14),
                            ),
                            Text(
                              'To help us improve your experience',
                              style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                        Spacer(),
                        Row(
                          children: [
                            Text(
                              formatRupiah(convenienceFee),
                              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              ' x ${seats.length}',
                              style: TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Text(
                          'TOTAL PAYMENT',
                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                        Spacer(),
                        Row(
                          children: [
                            Text(
                              formatRupiah(totalPayment),
                              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                            ),

                          ],
                        ),
                      ],
                    ),
                    Divider(height: 20),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildNoteItem(text: 'Purchased tickets cannot be changed / cancelled.'),
                    _buildNoteItem(text: 'Velvet & Sweetbox maximum for 2 people.'),
                    _buildNoteItem(text: 'R10+ Not recommended for children under 100cm in height, pregnant women, the elderly, individuals with disabilities, and those in ill health.'),
                    _buildNoteItem(text: 'Children (3 years old/above) are required to purchase ticket.'),
                  ],
                ),
              ),
              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 50,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF2A3663),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero,
                ),
              ),
              child: const Text('SELECT PAYMENT METHOD'),
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

  Widget _buildNoteItem({ required String text }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          FaIcon(FontAwesomeIcons.solidCircle,size: 8, color: Colors.red),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                color: Colors.red[300],
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}