import 'dart:collection';

import 'package:flutter_movie_app/data/movie_api.dart';
import 'package:flutter_movie_app/models/api_responses/genre_list/genre_list_response.dart';
import 'package:flutter_movie_app/models/api_responses/movie_details/movie_details_response.dart';
import 'package:flutter_movie_app/models/api_responses/movie_list/movie_list_response.dart';
import 'package:flutter_movie_app/models/errors.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';

const NOW_PLAYING = "now_playing";
const TRENDING = "trending";
const UPCOMING = "upcoming";

@singleton
class MovieRepository {
  final MovieApi api;

  final movieListMemCache = HashMap<String, MovieListResponse>();
  final movieDetailsMemCache = HashMap<int, MovieDetailsResponse>();
  final genreListMemCache = HashMap<String, GenreListResponse>();

  final today = DateFormat(DateFormat.ABBR_MONTH_DAY).format(DateTime.now());

  MovieRepository(this.api);

  Future<MovieListResponse> getNowPlayingMovies() async {
    try {
      if (movieListMemCache.containsKey(NOW_PLAYING)) {
        return movieListMemCache[NOW_PLAYING];
      }
      final response = await api.getNowPlaying();
      final result = response.body;
      movieListMemCache[NOW_PLAYING] = result;
      return result;
    } on Error catch (e) {
      print(e.stackTrace);
      return Future.error(MovieListError(e));
    }
  }

  Future<MovieListResponse> getTrendingMovies() async {
    try {
      if (movieListMemCache.containsKey(TRENDING)) {
        return movieListMemCache[TRENDING];
      }
      final response = await api.getPopular();
      final result = response.body;
      movieListMemCache[TRENDING] = result;
      return result;
    } on Error catch (e) {
      print(e.stackTrace);
      return Future.error(MovieListError(e));
    }
  }

  Future<MovieListResponse> getUpcomingMovies() async {
    try {
      if (movieListMemCache.containsKey(UPCOMING)) {
        return movieListMemCache[UPCOMING];
      }
      final response = await api.getUpcoming();
      final result = response.body;
      movieListMemCache[UPCOMING] = result;
      return result;
    } on Error catch (e) {
      print(e.stackTrace);
      return Future.error(MovieListError(e));
    }
  }

  Future<MovieListResponse> getMoviesByGenre(String genreId) async {
    try {
      if (movieListMemCache.containsKey(genreId)) {
        return movieListMemCache[genreId];
      }
      final response = await api.getByGenre(genreId);
      final result = response.body;
      movieListMemCache[genreId] = result;
      return result;
    } on Error catch (e) {
      print(e.stackTrace);
      return Future.error(MovieListError(e));
    }
  }

  Future<MovieListResponse> search(String query) async {
    try {
      if (movieListMemCache.containsKey(query)) {
        return movieListMemCache[query];
      }
      final response = await api.search(query);
      final result = response.body;
      movieListMemCache[query] = result;
      return result;
    } on Error catch (e) {
      print(e.stackTrace);
      return Future.error(MovieListError(e));
    }
  }

  Future<GenreListResponse> getGenres() async {
    try {
      if (genreListMemCache.containsKey(today)) {
        return genreListMemCache[today];
      }
      final response = await api.getGenres();
      final result = response.body;
      genreListMemCache[today] = result;
      return result;
    } on Error catch (e) {
      print(e.stackTrace);
      return Future.error(MovieListError(e));
    }
  }

  Future<MovieDetailsResponse> getMovieDetails(int movieId) async {
    try {
      if (movieDetailsMemCache.containsKey(movieId)) {
        return movieDetailsMemCache[movieId];
      }
      final response = await api.getMovie(movieId);
      final result = response.body;
      movieDetailsMemCache[movieId] = result;
      return result;
    } on Error catch (e) {
      print(e.stackTrace);
      return Future.error(MovieListError(e));
    }
  }
}
