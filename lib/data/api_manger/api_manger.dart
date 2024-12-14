

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movies_app/core/const_manger.dart';
import 'package:movies_app/data/model/genres/genre.dart';
import 'package:movies_app/data/model/genres/genre_response.dart';
import 'package:movies_app/data/model/movie/movie_response.dart';
import 'package:movies_app/data/model/movie/movies.dart';



class ApiManger{

  static Future<MovieResponse> getPopularMovies() async {
    // Constructing the URL
    Uri url = Uri.https(ConstManger.baseUrl, ConstManger.popular, {
      'api_key': ConstManger.apiKey,
    });

    // Making the HTTP GET request
    var response = await http.get(url);
    // Check if the response status is 200 (OK)
    if (response.statusCode == 200) {
      // Parse the response body into a map and decode it
      Map<String, dynamic> json = jsonDecode(response.body);
      // Return the MoviesResponse model
      return MovieResponse.fromJson(json);
    } else {
      // If the response status is not OK, throw an exception
      throw Exception('Failed to load popular movies');
    }
  }
  static Future<MovieResponse> getUpComingMovies() async {

    Uri url = Uri.https(ConstManger.baseUrl, ConstManger.upComing, {
      'api_key': ConstManger.apiKey,
    });
    var response = await http.get(url);
    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);
      return MovieResponse.fromJson(json);
    } else {
      throw Exception('Failed to load upcoming movies');
    }
  }
  static Future<MovieResponse> getTopRated() async{

    Uri url = Uri.https(ConstManger.baseUrl, ConstManger.topRated, {
      'api_key': ConstManger.apiKey,
    });
    var response = await http.get(url);
    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);
      return MovieResponse.fromJson(json);
    } else {
      throw Exception('Failed to load popular movies');
    }
  }
  static Future<MovieResponse> getLikeThis(int movieId) async {
    String moreLikeThis = '/3/movie/$movieId/similar';
    Uri url = Uri.https(ConstManger.baseUrl, moreLikeThis, {
      'api_key': ConstManger.apiKey,
    });
    var response = await http.get(url);
    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);
      return MovieResponse.fromJson(json);
    } else {
      throw Exception('Failed to the movies');
    }
  }
  static Future<List<Movie>> getMovieBySearch(String query) async {
    Uri url = Uri.https(ConstManger.baseUrl, ConstManger.search, {
      'api_key': ConstManger.apiKey,
      'query': query,
    });

    var response = await http.get(url);

    if (response.statusCode == 200) {
       Map<String, dynamic> json = jsonDecode(response.body);
       MovieResponse movieResponse = MovieResponse.fromJson(json);
      return movieResponse.results ?? [];
    } else {
      throw Exception('Failed to get search results');
    }
  }
  static Future<List<Genre>> getGenre() async{
    Uri url = Uri.https(ConstManger.baseUrl,ConstManger.genre,{
    'api_key' : ConstManger.apiKey,
  });
  var response = await http.get(url);
  if(response.statusCode == 200){
    Map<String,dynamic> json = jsonDecode(response.body);
    List genre = json['genres'];
    return genre.map((genre) => Genre.fromJson(genre)).toList();
  }
  else{
    throw Exception('Failed to load genre');
  }
}
  static Future<List<Movie>> getMovieByGenre(int genreId) async {
    Uri url = Uri.https(ConstManger.baseUrl, ConstManger.discover , {
      'api_key': ConstManger.apiKey,
      'with_genres' : genreId.toString()

    });
    final response = await http.get(url);

    if (response.statusCode == 200) {
       Map<String, dynamic> json = jsonDecode(response.body);
       MovieResponse movieResponse = MovieResponse.fromJson(json);
      return movieResponse.results ?? []; // Extract the list of movies
    } else {
      throw Exception('Failed to fetch search results');
    }
  }






// static Future<MovieResponse> getMovieBySearch(String query) async{
  //   Uri url = Uri.https(baseUrl,search,{
  //     'apikey' : _apiKey,
  //      'query': query
  //   });
  //   var response = await http.get(url);
  //
  //   if(response.statusCode == 200){
  //     Map<String,dynamic> json = jsonDecode(response.body);
  //     return MovieResponse.fromJson(json);
  //   }
  //   else{
  //     throw Exception('Failed to load movies');
  //   }
  //
  //
  //
  //
  // }





}