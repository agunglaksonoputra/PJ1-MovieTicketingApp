import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:movify/models/movie_model.dart';
import 'package:movify/screens/widgets/cards/movie_card_rating.dart';
import 'package:movify/services/movie_service.dart';

enum MovieFilter { mostPopular, nowPlaying, upcoming }

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<StatefulWidget> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  final MovieService movieService = MovieService();
  List<Movie> _movies = [];
  MovieFilter selectedFilter = MovieFilter.mostPopular;

  @override
  void initState() {
    super.initState();
    loadMovies(MovieFilter.mostPopular);
  }

  void loadMovies(MovieFilter filter) async {
    List<Movie> movies = [];

    switch (filter) {
      case MovieFilter.mostPopular:
        movies = await movieService.MostPopular();
        break;
      case MovieFilter.nowPlaying:
        movies = await movieService.NowPlaying();
        break;
      case MovieFilter.upcoming:
        movies = await movieService.Upcoming();
        break;
    }

    setState(() {
      _movies = movies;
      selectedFilter = filter;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: FaIcon(FontAwesomeIcons.angleLeft),
          iconSize: 30.0,
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Movies',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Wrap(
              spacing: 10,
              children: [
                _buildFilterButton('Most Popular', MovieFilter.mostPopular),
                _buildFilterButton('Now Playing', MovieFilter.nowPlaying),
                _buildFilterButton('Upcoming', MovieFilter.upcoming),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: GridView.builder(
                itemCount: _movies.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 0.53,
                ),
                itemBuilder: (context, index) {
                  final movie = _movies[index];
                  return MovieCardRating(
                    id: movie.id,
                    title: movie.title,
                    posterUrl: movie.posterUrl,
                    rating: movie.ratingAverage,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterButton(String label, MovieFilter filter) {
    final bool isActive = selectedFilter == filter;

    return TextButton(
      onPressed: () => loadMovies(filter),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          isActive ? Color(0xFF205979) : Colors.grey[300],
        ),
        padding: MaterialStateProperty.all(
          const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        ),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 16,
          color: isActive ? Colors.white : Colors.black,
        ),
      ),
    );
  }
}
