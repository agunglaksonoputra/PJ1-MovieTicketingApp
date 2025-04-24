import 'package:flutter/material.dart';
import 'package:movify/models/movie_model.dart';
import 'package:movify/screens/widgets/cards/movie_card_vertical.dart';
import 'package:movify/screens/widgets/carousel_widget.dart';
import 'package:movify/services/movie_service.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final MovieService movieService = MovieService();
  List<Movie> _nowPlayingMovies = [];
  List<Movie> _mostPopularMovies = [];

  @override
  void initState() {
    super.initState();
    loadMovies();
  }

  void loadMovies() async {
    final movies = await movieService.NowPlaying();
    final mostPopular = await movieService.MostPopular();
    setState(() {
      _nowPlayingMovies = movies;
      _mostPopularMovies = mostPopular;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 6.0, horizontal: 16.0),
              child: SearchBar(
                hintText: 'Search Movies',
                hintStyle: MaterialStatePropertyAll(
                  TextStyle(color: Colors.yellow),
                ),
                leading: Icon(Icons.search, color: Colors.white),
                backgroundColor: MaterialStatePropertyAll(Color(0xFF205979)),
                shape: MaterialStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24.0),
                  ),
                ),
                padding: MaterialStatePropertyAll(
                  EdgeInsets.symmetric(horizontal: 16.0),
                ),
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.notifications_none),
            iconSize: 30.0,
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.location_on),
            iconSize: 30.0,
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20.0),
              child: CarouselWidget(),
            ),

            // Now Playing
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 20, 20, 5),
                    child: Text(
                      'Now Playing',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(20, 5, 20, 20),
                      child: Row(
                        children: _nowPlayingMovies.map((movie) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: MovieCardVertical(
                              title: movie.title,
                              posterUrl: movie.posterUrl,
                              rating: movie.ratingAverage,
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Most Popular
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Most Popular',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            backgroundColor: Color(0xFF205979),
                            shape: StadiumBorder(),
                            padding: EdgeInsets.symmetric(horizontal: 18.0),
                          ),
                          child: Text(
                            'See More',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    )
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(20, 5, 20, 20),
                      child: Row(
                        children: _mostPopularMovies.map((movie) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: MovieCardVertical(
                              title: movie.title,
                              posterUrl: movie.posterUrl,
                              rating: movie.ratingAverage,
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ],
              ),
            ),



          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        color: Color(0xFF205979),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          elevation: 0,
          backgroundColor: Colors.transparent,
          selectedItemColor: Colors.yellow, // hanya untuk icon
          unselectedItemColor: Colors.white,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.confirmation_num), label: 'Ticket'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          ],
        ),
      ),
    );
  }
}