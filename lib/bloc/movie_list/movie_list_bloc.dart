import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_movie_app/data/movie_repository.dart';
import 'package:flutter_movie_app/models/errors.dart';
import 'package:flutter_movie_app/models/viewmodels/genre_list/genre_list_viewmodel.dart';
import 'package:flutter_movie_app/models/viewmodels/movie_list/movie_list_viewmodel.dart';
import 'package:flutter_movie_app/utils/mixins/auto_reset_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'movie_list_event.dart';
part 'movie_list_state.dart';

const EMPTY_STRING = "";

@preResolve
@lazySingleton
class MovieListBloc extends Bloc<MovieListEvent, MovieListState>
    with AutoResetLazySingleton<MovieListEvent, MovieListState> {
  final MovieRepository repository;

  MovieListBloc({this.repository}) : super(MovieListInitialState());

  @override
  Stream<MovieListState> mapEventToState(
    MovieListEvent event,
  ) async* {
    if (event is GetNowPlayingMovieListEvent) {
      yield MovieListLoadingState();
      try {
        final response = await repository.getNowPlayingMovies();
        final movies = MovieListViewModel.fromMovieResponse(response);
        final genreResponse = await repository.getGenres();
        final genres = GenreListViewModel.fromGenreResponse(
          EMPTY_STRING,
          genreResponse,
        );
        yield MovieListLoadedState(genres, movies);
      } on MovieListError catch (e) {
        yield MovieListErrorState(e);
      }
    } else if (event is GetTrendingMovieListEvent) {
      yield MovieListLoadingState();
      try {
        final response = await repository.getTrendingMovies();
        final movies = MovieListViewModel.fromMovieResponse(response);
        final genreResponse = await repository.getGenres();
        final genres = GenreListViewModel.fromGenreResponse(
          EMPTY_STRING,
          genreResponse,
        );
        yield MovieListLoadedState(genres, movies);
      } on MovieListError catch (e) {
        yield MovieListErrorState(e);
      }
    } else if (event is GetUpcomingMovieListEvent) {
      yield MovieListLoadingState();
      try {
        final response = await repository.getUpcomingMovies();
        final movies = MovieListViewModel.fromMovieResponse(response);
        final genreResponse = await repository.getGenres();
        final genres = GenreListViewModel.fromGenreResponse(
          EMPTY_STRING,
          genreResponse,
        );
        yield MovieListLoadedState(genres, movies);
      } on MovieListError catch (e) {
        yield MovieListErrorState(e);
      }
    } else if (event is GetMovieListByGenreEvent) {
      yield MovieListLoadingState();
      try {
        final response = await repository.getMoviesByGenre(event.genreId);
        final movies = MovieListViewModel.fromMovieResponse(response);
        final genreResponse = await repository.getGenres();
        final genres = GenreListViewModel.fromGenreResponse(
          event.genreId,
          genreResponse,
        );
        yield MovieListLoadedState(genres, movies);
      } on MovieListError catch (e) {
        yield MovieListErrorState(e);
      }
    }
  }
}
