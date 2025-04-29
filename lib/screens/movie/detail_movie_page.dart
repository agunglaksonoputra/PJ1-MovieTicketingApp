import 'package:flutter/material.dart';
import 'package:movify/models/movie_model.dart';
import 'package:movify/services/movie_service.dart';

class DetailMovie extends StatefulWidget{
  final int id;
  const DetailMovie({super.key, required this.id});

  @override
  State<StatefulWidget> createState() => _DetailMovieState();
}

class _DetailMovieState extends State<DetailMovie> {
  final MovieService movieService = MovieService();
  Movie? _detailMovie;

  @override
  void initState() {
    super.initState();
    loadMovies();
  }

  void loadMovies() async {
    final movie = await movieService.getMovieById(widget.id);
    setState(() {
      _detailMovie = movie;
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
        ) // Menampilkan indikator loading jika data belum ada
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
                        icon: const Icon(Icons.arrow_back, color: Colors.white),
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
                    SizedBox(height: 8),

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
                    SizedBox(height: 8),

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
                        // Column(
                        //   crossAxisAlignment: CrossAxisAlignment.start,
                        //   children: [
                        //     Text(
                        //       'Duration',
                        //       style: TextStyle(
                        //           fontSize: 16,
                        //           color: Colors.grey.shade600
                        //       ),
                        //     ),
                        //     Text(
                        //       _detailMovie!.runtimeFormatted,
                        //       style: TextStyle(
                        //         fontSize: 16,
                        //         fontWeight: FontWeight.w500,
                        //       ),
                        //     ),
                        //   ],
                        // ),
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
                      Builder(
                        builder: (BuildContext context) {
                          final TabController tabController = DefaultTabController.of(context);
                          return AnimatedBuilder(
                            animation: tabController,
                            builder: (context, child) {
                              return IndexedStack(
                                index: tabController.index,
                                children: [
                                  // Tab Schedule
                                  Visibility(
                                    visible: tabController.index == 0,
                                    maintainState: true,
                                    child: Padding(
                                      padding: const EdgeInsets.only(bottom: 20),
                                      child: Center(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Icon(Icons.calendar_month, size: 64),
                                            Text('Schedule content here'),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  // Tab Details
                                  Visibility(
                                    visible: tabController.index == 1,
                                    maintainState: true,
                                    child: _buildDetail(_detailMovie!.overview),
                                  ),
                                ],
                              );
                            },
                          );
                        },
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