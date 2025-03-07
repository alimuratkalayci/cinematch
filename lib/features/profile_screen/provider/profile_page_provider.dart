import 'dart:convert';
import 'package:cinematch/features/profile_screen/models/favorite_movies_model.dart';
import 'package:cinematch/features/profile_screen/models/profile_page_data_model.dart';
import 'package:cinematch/features/profile_screen/services/profile_web_service.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../services/favorite_movie_web_service.dart';

class ProfilePageProvider with ChangeNotifier {
  ProfilePageDataModel? _profilePageDataModel;

  // Getter'lar
  Data? get profileData => _profilePageDataModel?.data;

  final ProfileWebService _profileWebService = ProfileWebService();
  final FavoriteMovieListWebService _favoriteMovieListWebService =
      FavoriteMovieListWebService();

  Future<void> fetchProfileDatas() async {
    try {
      final response = await _profileWebService.fetchProfileDatas();

      if (response.statusCode == 200) {
        _profilePageDataModel = profilePageDataModelFromJson(response.body);
      } else {
        throw Exception('API isteği başarısız oldu');
      }
    } catch (error) {
      print('Hata: $error');
      throw error;
    } finally {
      notifyListeners();
    }
  }

  List<FavoriteMoviesModel> _movies = [];
  bool _isLoading = false;

  List<FavoriteMoviesModel> get movies => _movies;
  bool get isLoading => _isLoading;

  Future<void> fetchMovies() async {
    _isLoading = true;
    notifyListeners();

    final response =
        await _favoriteMovieListWebService.fetchFavoriteMovieList();

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final List<dynamic> movieList = data['data'];

      _movies = movieList
          .map((movie) => FavoriteMoviesModel.fromJson(movie))
          .toList();
      notifyListeners();
    } else {
      throw Exception('Failed to load movies');
    }

    _isLoading = false;
    notifyListeners();
  }
}
