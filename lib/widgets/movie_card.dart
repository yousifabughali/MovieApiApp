import 'dart:developer';

import 'package:final_project_movies_app/constant.dart';
import 'package:final_project_movies_app/helper/shared_preferences.dart';
import 'package:final_project_movies_app/models/movie_model.dart';
import 'package:final_project_movies_app/provider/movies_provider.dart';
import 'package:final_project_movies_app/screens/movie_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MovieCard extends StatelessWidget {
  Movie movie;
  int index=0;

  MovieCard({required this.index, required this.movie,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final minHeight = getMinHeight(index);

    return Consumer<MoviesProvider>(
        builder: (context, moviesProvider, child) {
          return InkWell(
            onTap: () async {
              log(SpHelper.spHelper.getToken().toString()??'');
              log(moviesProvider.topRated.first.id.toString());
              await moviesProvider.getMoviesReviews(movie);
              await moviesProvider.getSimilarMovies(movie);
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return MovieDetails(movie: movie,);
              },));
            },
            child: Container(
              margin: EdgeInsets.only(right: 6),
              clipBehavior: Clip.antiAlias,
              width: MediaQuery
                  .of(context)
                  .size
                  .width / 2,
              // height: 220,
              constraints: BoxConstraints(
                  minHeight: minHeight, maxHeight: minHeight),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Stack(
                children: [
                  Image.network(
                    'https://image.tmdb.org/t/p/w500/${movie.posterPath}',
                    fit: BoxFit.cover,width: 200,height: 400,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Spacer(),
                      Container(
                        padding: EdgeInsets.only(left: 12),
                        height: 55,
                        width: double.infinity,
                        color: Constant.kThirdColor,
                        child: Row(
                          children: [
                            Flexible(child: Center(child: Text(movie.title ?? '', maxLines: 2,style: TextStyle(color: Colors.white,fontSize: 18),))),
                            SizedBox(width: 10,),
                            Icon(Icons.star,size: 24,color: Colors.orange),
                            Text(movie.voteAverage==0?'N/A':movie.voteAverage.toString(),style: TextStyle(color: Colors.white,fontSize: 18),),
                            SizedBox(width: 10,),
                          ],
                        ),),

                    ],
                  ),
                ],
              ),
            ),


          );
        }
    );
  }

  double getMinHeight(int index) {
    switch (index % 4) {
      case 0:
        return 220;
      case 1:
        return 280;
      case 2:
        return 280;
      case 3:
        return 220;
      default:
        return 220;
    }
  }

}
