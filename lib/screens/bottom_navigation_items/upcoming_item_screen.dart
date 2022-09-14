import 'package:final_project_movies_app/constant.dart';
import 'package:final_project_movies_app/provider/movies_provider.dart';
import 'package:final_project_movies_app/widgets/movie_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:provider/provider.dart';

class UpComingItemScreen extends StatefulWidget {
  const UpComingItemScreen({Key? key}) : super(key: key);

  @override
  State<UpComingItemScreen> createState() => _UpComingItemScreenState();
}

class _UpComingItemScreenState extends State<UpComingItemScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<MoviesProvider>(
        builder: (context,moviesProvider,child) {
          return Padding(
            padding: const EdgeInsets.only(left: 12,top: 12,bottom: 12),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 10,),
                  Text('Upcoming Movies',style: TextStyle(color: Constant.kThirdColor,fontSize: 22,fontWeight: FontWeight.bold),),
                  SizedBox(height: 10,),
                  LazyLoadScrollView(
                    onEndOfPage: () {
                      moviesProvider.getMoreMovies();
                    },
                    child: StaggeredGridView.countBuilder(
                      shrinkWrap: true,
                      itemCount: moviesProvider.isLoading?
                      moviesProvider.upComing.length+1:
                      moviesProvider.upComing.length,
                      staggeredTileBuilder: (index) => const StaggeredTile.fit(2),
                      crossAxisCount: 4,
                      mainAxisSpacing: 9,
                      crossAxisSpacing: 4,
                      itemBuilder: (context, index) {
                        if(index==moviesProvider.upComing.length && moviesProvider.isLoading==true){
                          return Center(child: CircularProgressIndicator(),);
                        }
                        return MovieCard(
                          index: index,
                          movie: moviesProvider.upComing[index],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        }
    );
  }
}
