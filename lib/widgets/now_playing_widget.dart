
import 'package:final_project_movies_app/constant.dart';
import 'package:final_project_movies_app/models/movie_model.dart';
import 'package:final_project_movies_app/screens/movie_details_screen.dart';
import 'package:flutter/material.dart';

class NowPlaying extends StatelessWidget {
   Movie movie;

   NowPlaying({required this.movie,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => MovieDetails(movie: movie),));
      },
      child: Container(
        margin: EdgeInsets.only(right: 6),
        clipBehavior: Clip.antiAlias,
        width: MediaQuery.of(context).size.width, height: 220,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Stack(
          children: [
            Image.network('https://image.tmdb.org/t/p/original/${movie.posterPath}',fit: BoxFit.cover,width: 400,height: 400,),
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
                      Flexible(child: Center(child: Text(movie.title ?? '', style: TextStyle(color: Colors.white,fontSize: 18),))),
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
}
