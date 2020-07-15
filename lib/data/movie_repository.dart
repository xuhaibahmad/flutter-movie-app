import 'dart:collection';

import 'package:flutter_movie_app/data/movie_api.dart';
import 'package:flutter_movie_app/models/viewmodels/genre_list/genre_list_viewmodel.dart';
import 'package:flutter_movie_app/models/viewmodels/movie_details/movie_details_viewmodel.dart';
import 'package:flutter_movie_app/models/viewmodels/movie_list/movie_list_viewmodel.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';

const NOW_PLAYING = "now_playing";
const TRENDING = "trending";
const UPCOMING = "upcoming";

@singleton
class MovieRepository {
  final MovieApi api;

  final movieListMemCache = HashMap<String, MovieListViewModel>();
  final movieDetailsMemCache = HashMap<int, MovieDetailsViewModel>();
  final genreListMemCache = HashMap<String, GenreListViewModel>();

  final today = DateFormat(DateFormat.ABBR_MONTH_DAY).format(DateTime.now());

  MovieRepository(this.api);

  Future<MovieListViewModel> getNowPlayingMovies() async {
    try {
      if (movieListMemCache.containsKey(NOW_PLAYING)) {
        return movieListMemCache[NOW_PLAYING];
      }
      final response = await api.getNowPlaying();
      final result = MovieListViewModel.fromMovieResponse(response.body);
      movieListMemCache[NOW_PLAYING] = result;
      return result;
    } on Error catch (e) {
      print(e.stackTrace);
      return Future.error(e);
    }
  }

  Future<MovieListViewModel> getTrendingMovies() async {
    try {
      if (movieListMemCache.containsKey(TRENDING)) {
        return movieListMemCache[TRENDING];
      }
      final response = await api.getPopular();
      final result = MovieListViewModel.fromMovieResponse(response.body);
      movieListMemCache[TRENDING] = result;
      return result;
    } on Error catch (e) {
      print(e.stackTrace);
      return Future.error(e);
    }
  }

  Future<MovieListViewModel> getUpcomingMovies() async {
    try {
      if (movieListMemCache.containsKey(UPCOMING)) {
        return movieListMemCache[UPCOMING];
      }
      final response = await api.getUpcoming();
      final result = MovieListViewModel.fromMovieResponse(response.body);
      movieListMemCache[UPCOMING] = result;
      return result;
    } on Error catch (e) {
      print(e.stackTrace);
      return Future.error(e);
    }
  }

  Future<MovieListViewModel> getMoviesByGenre(
    int genreId,
    bool includeAdult,
  ) async {
    try {
      if (movieListMemCache.containsKey("$genreId")) {
        return movieListMemCache["$genreId"];
      }
      final response = await api.getByGenre(genreId, includeAdult);
      final result = MovieListViewModel.fromMovieResponse(response.body);
      movieListMemCache["$genreId"] = result;
      return result;
    } on Error catch (e) {
      print(e.stackTrace);
      return Future.error(e);
    }
  }

  Future<MovieListViewModel> search(String query, bool includeAdult) async {
    try {
      if (movieListMemCache.containsKey(query)) {
        return movieListMemCache[query];
      }
      final response = await api.search(query, includeAdult);
      final result = MovieListViewModel.fromMovieResponse(response.body);
      movieListMemCache[query] = result;
      return result;
    } on Error catch (e) {
      print(e.stackTrace);
      return Future.error(e);
    }
  }

  Future<GenreListViewModel> getGenres([int currentGenreId = -1]) async {
    try {
      if (genreListMemCache.containsKey(today)) {
        return genreListMemCache[today];
      }
      final response = await api.getGenres();
      final result = GenreListViewModel.fromGenreResponse(
        currentGenreId,
        response.body,
      );
      genreListMemCache[today] = result;
      return result;
    } on Error catch (e) {
      print(e.stackTrace);
      return Future.error(e);
    }
  }

  Future<MovieDetailsViewModel> getMovieDetails(int movieId) async {
    try {
      if (movieDetailsMemCache.containsKey(movieId)) {
        return movieDetailsMemCache[movieId];
      }
      final response = await api.getMovie(movieId);
      final result =
          MovieDetailsViewModel.fromMovieDetailsResponse(response.body);
      movieDetailsMemCache[movieId] = result;
      return result;
    } on Error catch (e) {
      print(e.stackTrace);
      return Future.error(e);
    }
  }

  Future<MovieListViewModel> getSimilarMovies(int movieId) async {
    try {
      if (movieListMemCache.containsKey(movieId.toString())) {
        return movieListMemCache[movieId.toString()];
      }
      final response = await api.getSimilarMovies(movieId);
      final result = MovieListViewModel.fromMovieResponse(response.body);
      movieListMemCache[movieId.toString()] = result;
      return result;
    } on Error catch (e) {
      print(e.stackTrace);
      return Future.error(e);
    }
  }
}
