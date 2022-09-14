import 'package:final_project_movies_app/constant.dart';
import 'package:final_project_movies_app/provider/movies_provider.dart';
import 'package:final_project_movies_app/widgets/movie_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Consumer<MoviesProvider>(
        builder: (context,moviesProvider,child) {
          return ListView(
            children: [
              Text('Search',textAlign: TextAlign.center,style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color: Colors.white),),
              SizedBox(height: 10,),
              TextField(
                controller: moviesProvider.textEditingController,
                onChanged: (value) {
                  setState(() {
                    if(moviesProvider.textEditingController.text.isEmpty && moviesProvider.searchedMovies.length!=0){
                      moviesProvider.searchedMovies=[];
                    }
                    moviesProvider.getSearchResult();

                  });
                },
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Constant.kFourthColor,

                  hintText: 'Let\'s find what you are searching about!',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(29),
                  ),
                ),
              ),
              SizedBox(height: 10,),
              StaggeredGridView.countBuilder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: moviesProvider.isLoading?
                moviesProvider.searchedMovies.length+1:
                moviesProvider.searchedMovies.length,
                staggeredTileBuilder: (index) => const StaggeredTile.fit(2),
                crossAxisCount: 4,
                mainAxisSpacing: 4,
                crossAxisSpacing: 4,
                itemBuilder: (context, index) {
                  if(index==moviesProvider.searchedMovies.length && moviesProvider.isLoading==true){
                    return Center(child: CircularProgressIndicator(),);
                  }
                  return MovieCard(
                    index: index,
                    movie: moviesProvider.searchedMovies[index],
                  );
                },
              ),

            ],
          );
        }
      ),
    );
  }
}
