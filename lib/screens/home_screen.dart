import 'package:final_project_movies_app/helper/dio_helper.dart';
import 'package:final_project_movies_app/provider/movies_provider.dart';
import 'package:final_project_movies_app/screens/bottom_navigation_items/home_screen_item.dart';
import 'package:final_project_movies_app/screens/bottom_navigation_items/search_screen.dart';
import 'package:final_project_movies_app/screens/bottom_navigation_items/upcoming_item_screen.dart';
import 'package:final_project_movies_app/screens/bottom_navigation_items/watchlist_item_screen.dart';
import 'package:final_project_movies_app/screens/movie_details_screen.dart';
import 'package:final_project_movies_app/screens/see_more_screen.dart';
import 'package:final_project_movies_app/widgets/heading_widget.dart';
import 'package:final_project_movies_app/widgets/movie_card.dart';
import 'package:final_project_movies_app/widgets/now_playing_widget.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:provider/provider.dart';

import '../constant.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index=0;
  String content='Home';
  @override
  Widget build(BuildContext context) {
    return Consumer<MoviesProvider>(builder: (context, moviesProvider, child) {
      return SafeArea(
        child: Scaffold(
          backgroundColor: Constant.kPrimaryColor,
          body: index==0?HomeScreenItem():
          index==1? SearchScreen():
          // index==2? WatchList():
          UpComingItemScreen(),
          bottomNavigationBar: Container(
            height: 60,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
            child: BottomNavigationBar(

              type: BottomNavigationBarType.fixed,
                backgroundColor: Constant.kFourthColor,
                fixedColor: Constant.kThirdColor,
                unselectedItemColor: Constant.kSecondryColor,
                showUnselectedLabels: false,
                onTap: (i) {
                  setState(() {
                    index = i;

                  });
                },
                currentIndex: index,
                items: [
              BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home'),
              BottomNavigationBarItem(icon: Icon(Icons.search),label: 'Search'),
              // BottomNavigationBarItem(icon: Icon(Icons.bookmark_border),label: 'My Watchlist'),
              BottomNavigationBarItem(icon: Icon(Icons.upcoming),label: 'Upcoming'),
            ]),
          ),
        ),
      );
    });
  }
}
