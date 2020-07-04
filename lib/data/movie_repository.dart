import 'dart:collection';

import 'package:flutter_movie_app/data/movie_api.dart';
import 'package:flutter_movie_app/models/api_responses/movie_list/movie_list_response.dart';
import 'package:flutter_movie_app/models/errors.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';

@singleton
class MovieRepository {
  final MovieApi api;

  final nowPlayingMoviesMemCache = HashMap<String, MovieListResponse>();
  final _today = DateFormat(DateFormat.ABBR_MONTH_DAY).format(DateTime.now());

  MovieRepository(this.api);

  Future<MovieListResponse> getNowPlayingMovies() async {
    try {
      if (nowPlayingMoviesMemCache.containsKey(_today)) {
        return nowPlayingMoviesMemCache[_today];
      }
      final response = await api.getNowPlaying();
      final result = response.body;
      nowPlayingMoviesMemCache[_today] = result;
      return result;
    } on Error catch (e) {
      print(e.stackTrace);
      return Future.error(MovieListError(e));
    }
  }
}
