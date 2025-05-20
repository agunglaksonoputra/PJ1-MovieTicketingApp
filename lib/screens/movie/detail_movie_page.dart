import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:movify/models/movie_model.dart';
import 'package:movify/models/schedule_model.dart';
import 'package:movify/models/theater_model.dart';
import 'package:movify/screens/reservations/seat_selection.dart';
import 'package:movify/services/cinema_service.dart';
import 'package:movify/services/movie_service.dart';

import '../../models/cinema_model.dart';

class DetailMovie extends StatefulWidget{
  final int id;
  final String city;
  const DetailMovie({
    super.key,
    required this.id,
    required this.city
  });

  @override
  State<StatefulWidget> createState() => _DetailMovieState();
}

class _DetailMovieState extends State<DetailMovie> {
  final MovieService movieService = MovieService();
  final CinemaService cinemaService = CinemaService();
  Movie? _detailMovie;
  List<Cinema> _cinemas = [];

  @override
  void initState() {
    super.initState();
    loadAPI();
  }

  void loadAPI() async {
    final movie = await movieService.getMovieById(widget.id);
    final cinemas = await cinemaService.getCinemasShowingMovie(widget.city, widget.id);
    setState(() {
      _detailMovie = movie;
      _cinemas = cinemas;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: _detailMovie == null
            ? Center(
          child: CircularProgressIndicator(),
        )
            : SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    height: 250,
                    width: double.infinity,
                    child: Image.network(
                      _detailMovie!.backdropUrl,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          height: 250,
                          color: Colors.grey[300],
                          child: const Center(
                            child: Icon(Icons.image_not_supported, size: 50),
                          ),
                        );
                      },
                    ),
                  ),
                  Positioned(
                    top: 20,
                    left: 20,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.5),
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        icon: const FaIcon(FontAwesomeIcons.angleLeft, color: Colors.white),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ),
                ],
              ),

              Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title
                    Text(
                      _detailMovie!.title,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),

                    // Ratting
                    Row(
                      children: [
                        const Icon(
                          Icons.star,
                          color: Colors.amber,
                          size: 20,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          "${_detailMovie!.ratingAverage}/10",
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),

                    // Genre
                    Wrap(
                      spacing: 8.0,
                      children: _detailMovie!.genres.map((genre) => Chip(
                        label: Text(
                            genre,
                            style: TextStyle(
                              color: Colors.black,
                            )
                        ),
                        backgroundColor: Colors.grey.shade300,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                          side: BorderSide.none,
                        ),
                      )).toList(),
                    ),

                    SizedBox(height: 8),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Duration',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey.shade600
                              ),
                            ),
                            Text(
                              _detailMovie!.runtimeFormatted,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Language',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey.shade600
                              ),
                            ),
                            Text(
                              _detailMovie!.originalLanguageName,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // Tab Bar
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: DefaultTabController(
                  length: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TabBar(
                        dividerColor: Colors.transparent,
                        tabs: [
                          Tab(text: 'Schedule'),
                          Tab(text: 'Details'),
                        ],
                      ),
                      SizedBox(height: 8),
                      Container(
                        height: 400,
                        child: TabBarView(
                          children: [
                            // Tab Schedule
                            _cinemas.isEmpty
                                ? const Center(
                              child: Text("Tidak ada jadwal untuk kota ini."),
                            )
                                : ListView.builder(
                              itemCount: _cinemas.length,
                              itemBuilder: (context, index) {
                                final cinema = _cinemas[index];
                                return ExpansionTileCard(cinema: cinema, movie: _detailMovie!);
                              },
                            ),
                            // Tab Detail
                            _buildDetail(_detailMovie!.overview),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetail(String description) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Description',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8),
        Text(
          description,
          textAlign: TextAlign.justify,
        ),
      ],
    );
  }
}

class ExpansionTileCard extends StatelessWidget {
  final Cinema cinema;
  final Movie movie;

  const ExpansionTileCard({
    super.key,
    required this.cinema,
    required this.movie
  });

  @override
  Widget build(BuildContext context) {
    if (cinema.theater.isEmpty) {
      return Center(child: Text("Tidak ada jadwal di ${cinema.name}"));
    }

    return Card(
      elevation: 2,
      color: Color(0xFFc7e2f0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Theme(
        data: Theme.of(context).copyWith(
          dividerColor: Colors.transparent,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: ExpansionTile(
          title: Text(
            cinema.name,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          expandedAlignment: Alignment.topLeft,
          childrenPadding: EdgeInsets.fromLTRB(16, 0, 16, 20),
          children: cinema.theater.map((theater) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      theater.name,
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    Text(
                      theater.schedule.first.formattedPrice,
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Wrap(
                  spacing: 8.0,
                  runSpacing: 8.0,
                  children: theater.schedule.map((schedule) {
                    return ActionChip(
                      label: Text(schedule.formattedStartTime),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SeatSelectionPage(
                                theaterId: theater.id,
                                scheduleId: schedule.id,
                                data:  {
                                  'movie': movie,
                                  'theater': theater,
                                  'cinema': cinema,
                                  'schedule': schedule,
                                },
                              )
                          ),
                        );
                      },
                    );
                  }).toList(),
                ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
