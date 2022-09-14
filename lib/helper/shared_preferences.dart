import 'package:final_project_movies_app/models/movie_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SpHelper{
  SpHelper._();
  static SpHelper spHelper = SpHelper._();
  SharedPreferences? sharedPreference;
  static List<String> sp = [];
  initSp() async {
    sharedPreference=await SharedPreferences.getInstance();
  }
  saveMovie(Movie movie){
    Set<String> ss= sp.toSet();
    sharedPreference!.
    setStringList('movie', ss.toList());
    print(sharedPreference!.get('movie'));
  }
  List<String> getToken() {
    sp= sharedPreference!.getStringList('movie')??[];
    return sp;

  }
  deleteToken(){
    sharedPreference!.remove('token');
  }


}
