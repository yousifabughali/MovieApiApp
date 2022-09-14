import 'package:final_project_movies_app/constant.dart';
import 'package:final_project_movies_app/helper/shared_preferences.dart';
import 'package:final_project_movies_app/models/movie_model.dart';
import 'package:final_project_movies_app/utils/get_genere.dart';
import 'package:final_project_movies_app/widgets/review_card.dart';
import 'package:final_project_movies_app/widgets/similar_movies.dart';
import 'package:flutter/material.dart';

class MovieDetails extends StatefulWidget {
  Movie movie;

  // String title;
  MovieDetails(
      {required this.movie,

      Key? key})
      : super(key: key);

  @override
  State<MovieDetails> createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, length: 3);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Constant.kPrimaryColor,
        // extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: Text(widget.movie.title??''),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  children: [
                    Container(
                      height: 350,
                      clipBehavior: Clip.antiAlias,
                      decoration:  BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(25),
                      ),

                      child: Image.network(
                        'https://image.tmdb.org/t/p/w500/${widget.movie.posterPath}',
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: 300,
                      ),
                    ),
                    TabBar(
                      tabs: [
                        Tab(
                          child: Text('OverView'),
                        ),
                        Tab(
                          child: Text('Reviews'),
                        ),
                        Tab(
                          child: Text('Similar Movie'),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 270,
                      child: TabBarView(
                          children: [
                            SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 12,),
                                  Row(
                                    children: [
                                      Text('Relase Date: ',
                                        style: TextStyle(color: Colors.blue,fontSize: 18),
                                      ),
                                      Text('${widget.movie.releaseDate?.substring(0,4)}',
                                        style: TextStyle(color: Colors.white,fontSize: 18),
                                      ),
                                    ],
                                  ),

                                  SizedBox(height: 10,),
                                  Row(
                                    children: [
                                      Icon(Icons.star,color: Colors.orange,size: 28,),
                                      SizedBox(width: 15,),
                                      Text(widget.movie.voteAverage.toString(),
                                        style: TextStyle(color: Colors.orange,fontSize: 18),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10,),
                                  
                                  Text(
                                    'Description:',
                                    style: TextStyle(color: Colors.blue,fontSize: 18),
                                  ),
                                  Text(widget.movie.overview.toString(),
                                    style: TextStyle(color: Constant.kFourthColor,fontSize: 18),
                                  ),
                                ],
                              ),
                            ),

                        Center(
                          child: ReviewCard(),
                        ),
                        Center(
                          child: SimilarMovies(),
                        ),
                      ]),
                    )
                  ],
                ),
              ),
            ),
      ),
    );
  }
  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['id'] = widget.movie.id;
  //   data['overview'] = widget.movie.overview;
  //   data['image'] = widget.movie.posterPath;
  //   data['title'] = widget.movie.title;
  //   data['rate'] = widget.movie.voteAverage;
  //   return data;
  //
  // }
}
