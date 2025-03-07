import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:cinematch/features/home_screen/models/movie_list_models.dart';
import '../services/favorite_movie_web_service.dart';
import '../services/home_screen_web_service.dart';

class HomeScreenProvider extends ChangeNotifier {
  MovieList? _movieList;
  bool _isLoading = false;
  String isFavorite = '';
  String? _error;
  bool _hasMore = true;
  int _currentPage = 1;

  final HomeScreenWebService _homeScreenWebService = HomeScreenWebService();

  final FavoriteMovieWebService _favoriteMovieWebService =
      FavoriteMovieWebService();

  // Getter'lar
  MovieList? get movieList => _movieList;
  bool get isLoading => _isLoading;
  String? get error => _error;
  bool get hasMore => _hasMore;
  List<Movie> get movies => _movieList?.data.movies ?? [];

  Future<void> fetchMovies({bool isRefresh = false}) async {
    if (isRefresh) {
      _currentPage = 1;
      _movieList = null;
      _hasMore = true;
    }

    if (_isLoading || !_hasMore) return;

    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      final response =
          await _homeScreenWebService.fetchHomeScreenDatas(_currentPage);

      final movieList = MovieList.fromJson(json.decode(response.body));

      if (_movieList == null) {
        _movieList = movieList;
      } else {
        _movieList!.data.movies.addAll(movieList.data.movies);
      }

      final pagination = movieList.data.pagination;
      _hasMore = _currentPage < pagination.maxPage;

      _currentPage++;
    } catch (e) {
      _error = e.toString();
      _hasMore = false;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> toggleFavorite(String movieId) async {
    try {
      await _favoriteMovieWebService.favoriteMovie(movieId);

      int index = movies.indexWhere((movie) => movie.id == movieId);
      if (index != -1) {
        _movieList!.data.movies[index] =
            _movieList!.data.movies[index].copyWith(
          isFavorite: !_movieList!.data.movies[index].isFavorite,
        );
      }

      notifyListeners();
    } catch (e) {
      print('Favori güncelleme hatası: $e');
    }
  }
}
