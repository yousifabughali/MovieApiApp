import 'package:final_project_movies_app/provider/movies_provider.dart';
import 'package:final_project_movies_app/widgets/movie_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
class SimilarMovies extends StatelessWidget {
  const SimilarMovies({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<MoviesProvider>(
        builder: (context,moviesProvider,child) {
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: moviesProvider.similarMovies.length,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.all(10.0),
              child: MovieCard(movie: moviesProvider.similarMovies[index],index: 0,)
            ),
          );
        }
    );
  }
}
