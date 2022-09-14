import 'package:carousel_slider/carousel_slider.dart';
import 'package:final_project_movies_app/provider/movies_provider.dart';
import 'package:final_project_movies_app/screens/see_more_screen.dart';
import 'package:final_project_movies_app/widgets/heading_widget.dart';
import 'package:final_project_movies_app/widgets/movie_card.dart';
import 'package:final_project_movies_app/widgets/now_playing_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skeletons/skeletons.dart';


class HomeScreenItem extends StatefulWidget {
  const HomeScreenItem({Key? key}) : super(key: key);

  @override
  State<HomeScreenItem> createState() => _HomeScreenItemState();
}

class _HomeScreenItemState extends State<HomeScreenItem> {
  @override
  Widget build(BuildContext context) {
    return Consumer<MoviesProvider>(
      builder: (context,moviesProvider,child) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Heading(
                    title: 'Now playing',
                    press: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return SeeMore(
                              title: 'Now Playing',
                              result: moviesProvider.nowPlayingMovies);
                        },
                      ));
                    }),
                Container(
                  height: 220,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.symmetric(horizontal: 4),
                  child: CarouselSlider.builder(
                    itemCount: 5,
                    itemBuilder: (context, index, realIndex) {
                      return moviesProvider.nowPlayingMovies.isEmpty
                          ?  Center(
                          child: Container(width: 220,child: Center(child: CircularProgressIndicator.adaptive())))
                          : NowPlaying(
                          movie: moviesProvider.nowPlayingMovies[index]);
                    },
                    options: CarouselOptions(
                      enableInfiniteScroll: false,
                      enlargeCenterPage: true,
                      autoPlay: true,
                    ),
                  ),
                ),

                Heading(
                    title: 'Top Rated',
                    press: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return SeeMore(
                              title: 'Top Rated',
                              result: moviesProvider.topRated);
                        },
                      ));
                    }),
                Container(
                  height: 220,
                  padding: EdgeInsets.symmetric(horizontal: 4),
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context, index) =>
                    moviesProvider.topRated.isEmpty
                        ?  Center(
                        child: Container(width: 220,child: Center(child: CircularProgressIndicator.adaptive())))
                        : MovieCard(
                      index: index,
                      movie: moviesProvider.topRated[index],
                    ),
                  ),
                ),
                Heading(
                    title: 'Popular',
                    press: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return SeeMore(
                              title: 'Popular',
                              result: moviesProvider.trend);
                        },
                      ));
                    }),
                Container(
                  height: 220,
                  padding: EdgeInsets.symmetric(horizontal: 4),
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context, index) =>
                    moviesProvider.trend.isEmpty
                        ?  Center(
                        child: Container(width: 220,child: Center(child: CircularProgressIndicator.adaptive())))
                        : MovieCard(
                      index: index + 1,
                      movie: moviesProvider.trend[index + 1],
                    ),
                  ),
                ),
                // Heading(
                //     title: 'Upcoming Movies',
                //     press: () {
                //       Navigator.push(context, MaterialPageRoute(
                //         builder: (context) {
                //           return SeeMore(
                //               title: 'Now Playing',
                //               result: moviesProvider.upComing);
                //         },
                //       ));
                //     }),
                // Container(
                //   height: 220,
                //   padding: EdgeInsets.only(left: 8),
                //   child: ListView.builder(
                //     shrinkWrap: true,
                //     scrollDirection: Axis.horizontal,
                //     itemCount: 5,
                //     itemBuilder: (context, index) =>
                //     moviesProvider.upComing.isEmpty
                //         ? const Center(
                //         child: CircularProgressIndicator.adaptive())
                //         : MovieCard(
                //       index: index,
                //       movie: moviesProvider.upComing[index],
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        );
      },
    );
  }
}
