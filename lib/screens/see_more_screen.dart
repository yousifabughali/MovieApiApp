import 'package:final_project_movies_app/constant.dart';
import 'package:final_project_movies_app/models/movie_model.dart';
import 'package:final_project_movies_app/provider/movies_provider.dart';
import 'package:final_project_movies_app/widgets/movie_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:provider/provider.dart';
import 'package:skeletons/skeletons.dart';

class SeeMore extends StatefulWidget {
  String title;
  List<Movie> result;



  SeeMore({required this.title,required this.result,Key? key}) : super(key: key);

  @override
  State<SeeMore> createState() => _SeeMoreState();
}

class _SeeMoreState extends State<SeeMore> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Constant.kPrimaryColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(widget.title,),
      ),
      body: Consumer<MoviesProvider>(
        builder: (context,moviesProvider,child) {
          return Padding(
            padding: const EdgeInsets.only(left: 12,top: 12,bottom: 12),
            child: LazyLoadScrollView(
              onEndOfPage: () {
                moviesProvider.getMoreMovies();
              },
              child: StaggeredGridView.countBuilder(
                shrinkWrap: true,
                itemCount: moviesProvider.isLoading?widget.result.length+1:widget.result.length,
                staggeredTileBuilder: (index) => const StaggeredTile.fit(2),
                crossAxisCount: 4,
                mainAxisSpacing: 9,
                crossAxisSpacing: 4,
                                itemBuilder: (context, index) {
                  if(index==widget.result.length && moviesProvider.isLoading==true){
                    return Center(child: SkeletonListView(),);
                  }
                  return MovieCard(
                    index: index,
                    movie: widget.result[index],
                    );
                },
              ),
            ),
          );
        }
      ),
    );
  }

}
