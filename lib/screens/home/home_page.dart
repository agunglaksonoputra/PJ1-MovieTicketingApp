import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:movify/models/movie_model.dart';
import 'package:movify/screens/menu/menu_page.dart';
import 'package:movify/screens/widgets/cards/movie_card_rating.dart';
import 'package:movify/screens/widgets/carousel_widget.dart';
import 'package:movify/services/movie_service.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with WidgetsBindingObserver {
  final MovieService movieService = MovieService();
  List<Movie> _nowPlayingMovies = [];
  List<Movie> _mostPopularMovies = [];
  String _selectedCity = 'Bandung';

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    loadMovies();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      loadMovies();
    }
  }

  void loadMovies() async {
    final movies = await movieService.fetchNowPlaying();
    final mostPopular = await movieService.fetchMoviePopuler();
    if (!mounted) return;
    setState(() {
      _nowPlayingMovies = movies;
      _mostPopularMovies = mostPopular;
    });
  }

  void _showCityBottomSheet(BuildContext context) {
    final List<String> cities = ['Jakarta', 'Surabaya', 'Bandung', 'Yogyakarta', 'Medan'];

    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Pilih Kota',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.close, color: Colors.black),
                      onPressed: () {
                        Navigator.pop(context); // Menutup modal bottom sheet
                      },
                    ),
                  ],
                ),
              ),

              // Daftar kota
              Padding(
                padding: EdgeInsets.only(bottom: 30),
                child: Column(
                  children: cities.map((city) {
                    return ListTile(
                      title: Text(city),
                      trailing: _selectedCity == city
                          ? Icon(Icons.check, color: Colors.blue) // Menambahkan ikon check jika kota dipilih
                          : null,
                      onTap: () {
                        // Menutup modal bottom sheet dan mengupdate kota yang dipilih
                        Navigator.pop(context);
                        setState(() {
                          _selectedCity = city;
                        });
                      },
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        );
      },
    );
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
                leading: FaIcon(FontAwesomeIcons.magnifyingGlass, color: Colors.white, size: 18),
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
            icon: FaIcon(FontAwesomeIcons.bell),
            iconSize: 24,
            onPressed: () {},
          ),
          IconButton(
            icon: FaIcon(FontAwesomeIcons.locationDot),
            iconSize: 24,
              onPressed: () => _showCityBottomSheet(context),
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
                  SizedBox(
                    height: 396,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.fromLTRB(20, 5, 20, 20),
                      itemCount: _nowPlayingMovies.length,
                      itemBuilder: (context, index) {
                        final movie = _nowPlayingMovies[index];
                        return Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: MovieCardRating(
                            id: movie.id,
                            title: movie.title,
                            posterUrl: movie.posterUrl,
                            rating: movie.ratingAverage,
                            city: _selectedCity,
                          ),
                        );
                      },
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
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MenuPage(city: _selectedCity),
                              ),
                            );
                          },
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
                  SizedBox(
                    height: 396,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.fromLTRB(20, 5, 20, 20),
                      itemCount: _mostPopularMovies.length,
                      itemBuilder: (context, index) {
                        final movie = _mostPopularMovies[index];
                        return Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: MovieCardRating(
                            id: movie.id,
                            title: movie.title,
                            posterUrl: movie.posterUrl,
                            rating: movie.ratingAverage,
                            city: _selectedCity
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),

          ],
        ),
      ),

    );
  }
}