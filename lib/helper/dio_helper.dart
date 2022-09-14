
import 'package:dio/dio.dart';
import 'dart:developer';

import 'package:final_project_movies_app/models/movie_model.dart';
import 'package:final_project_movies_app/models/reviews.dart';

class DioHelper{
  DioHelper._();
  static DioHelper dioHelper = DioHelper._();
  Dio dio = Dio();

  getNowPlayingMovies(int page) async {
    Response response = await dio.get('https://api.themoviedb.org/3/movie/now_playing',queryParameters: {
      "api_key":"4452d2b6476cb09be281ba5595f54929",
      "language":"en-US",
      "page":page,
    });
    Map<String,dynamic> responseMap = response.data;
    List responseListofMap = responseMap['results'];
    List<Movie> nowPlayingMovies= await responseListofMap.map((e) {
      // log(e.toString());
      return Movie.fromJson(e);
    }).toList();
    return nowPlayingMovies;
  }

  getTopRateMovies(int page) async {
    Response response = await dio.get('https://api.themoviedb.org/3/movie/top_rated?api_key=4452d2b6476cb09be281ba5595f54929&language=en-US&page=${page}');
    Map<String,dynamic> responseMap = response.data;
    List responseListofMap = responseMap['results'];
    List<Movie> topTrend= await responseListofMap.map((e) {
      // log(e.toString());
      return Movie.fromJson(e);
    }).toList();
    return topTrend;
  }

  getTrendMovies(int page) async {
    Response response = await dio.get('https://api.themoviedb.org/3/movie/popular?api_key=4452d2b6476cb09be281ba5595f54929&language=en-US&page=${page}');
    Map<String,dynamic> responseMap = response.data;
    List responseListofMap = responseMap['results'];
    List<Movie> trend= await responseListofMap.map((e) {
      // log(e.toString());
      return Movie.fromJson(e);
    }).toList();
    return trend;
  }

  getUpComingMovies(int page) async {
    Response response = await dio.get('https://api.themoviedb.org/3/movie/upcoming?api_key=4452d2b6476cb09be281ba5595f54929&language=en-US&page=${page}');
    Map<String,dynamic> responseMap = response.data;
    List responseListofMap = responseMap['results'];
    List<Movie> upComing= await responseListofMap.map((e) {
      // log(e.toString());
      return Movie.fromJson(e);
    }).toList();
    return upComing;
  }
    getSearchedMovies(String searchInput) async {
    try {
      Response response = await dio.get(
          'https://api.themoviedb.org/3/search/movie?api_key=4452d2b6476cb09be281ba5595f54929&language=en-US&query={$searchInput}&page=1&include_adult=false');
      Map<String,dynamic> responseMap = response.data;
      List responseListOfMap = responseMap['results'];
      List<Movie> movies= await responseListOfMap.map((e) {
        return Movie.fromJson(e);
      }).toList();
      return movies;
    } catch (e) {
      return null;
    }
  }
    getMovieReviews(int movieId) async {
      List<Review> reviews = [];

      Response response = await dio.get(
          'https://api.themoviedb.org/3/movie/$movieId/reviews?api_key=4452d2b6476cb09be281ba5595f54929&language=en-US&page=1');
      Map<String,dynamic> responseMap = response.data;
      List responseListOfMap = responseMap['results'];
      responseListOfMap.forEach((element) {
        reviews.add(
          Review(author: element['author'], comment:element['content'], rating: element['author_details']['rating']),
        );
      });
      return reviews;
  }

  getSimilarMovies(int movieId) async {
    Response response = await dio.get(
        'https://api.themoviedb.org/3/movie/$movieId/similar?api_key=4452d2b6476cb09be281ba5595f54929&language=en-US&page=1');
    Map<String,dynamic> responseMap = response.data;
    List responseListOfMap = responseMap['results'];
    List<Movie> movies= await responseListOfMap.map((e) {
      return Movie.fromJson(e);
    }).toList();
    return movies;
  }

  //

}