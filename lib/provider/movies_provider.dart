
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:final_project_movies_app/helper/dio_helper.dart';
import 'package:final_project_movies_app/models/movie_model.dart';
import 'package:final_project_movies_app/models/reviews.dart';
import 'package:flutter/material.dart';

class MoviesProvider extends ChangeNotifier {
  MoviesProvider(){
    getNowPlayingMovies();
    getTopRateMovies();
    getTrendMovies();
    getUpComingMovies();
  }
  TextEditingController textEditingController= TextEditingController();


   List<Movie> nowPlayingMovies=[];
   List<Movie> topRated=[];
   List<Movie> trend=[];
   List<Movie> upComing=[];
   List<Movie> searchedMovies=[];
   List<Movie> similarMovies=[];
   List<Review> reviews =[];

   int page=1;
   bool isLoading=false;


   getMoreMovies(){
     ++page;
     getNowPlayingMovies();
     getUpComingMovies();
     getTrendMovies();
     getTopRateMovies();
   }



  getNowPlayingMovies() async {
    isLoading=true;
    notifyListeners();
    List<Movie> nowPlaying= await DioHelper.dioHelper.getNowPlayingMovies(page);
    nowPlayingMovies.addAll(nowPlaying);
    isLoading=false;
    notifyListeners();
  }

  getTopRateMovies() async {
    topRated= await DioHelper.dioHelper.getTopRateMovies(page);
    notifyListeners();
  }

  getTrendMovies() async {
    trend= await DioHelper.dioHelper.getTrendMovies(page);
    notifyListeners();
  }
  getUpComingMovies() async {
    upComing= await DioHelper.dioHelper.getUpComingMovies(page);
    notifyListeners();
  }
  getSearchResult () async {
     if(textEditingController.text.isNotEmpty){
       searchedMovies = await DioHelper.dioHelper.getSearchedMovies(textEditingController.text);
     }
     notifyListeners();
  }
  getMoviesReviews(Movie movie) async{
     reviews= await DioHelper.dioHelper.getMovieReviews(movie.id!);
     notifyListeners();
  }
  getSimilarMovies(Movie movie) async {
     similarMovies = await DioHelper.dioHelper.getSimilarMovies(movie.id!);
     notifyListeners();
  }


}
