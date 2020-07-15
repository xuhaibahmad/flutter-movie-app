import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_movie_app/data/app_repository.dart';
import 'package:flutter_movie_app/data/movie_repository.dart';
import 'package:flutter_movie_app/models/viewmodels/genre_list/genre_list_viewmodel.dart';
import 'package:flutter_movie_app/models/viewmodels/movie_list/movie_list_viewmodel.dart';
import 'package:flutter_movie_app/utils/mixins/auto_reset_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'movie_list_event.dart';
part 'movie_list_state.dart';

@preResolve
@lazySingleton
class MovieListBloc extends Bloc<MovieListEvent, MovieListState>
    with AutoResetLazySingleton<MovieListEvent, MovieListState> {
  final AppRepository appRepository;
  final MovieRepository movieRepository;

  MovieListBloc({
    this.appRepository,
    this.movieRepository,
  }) : super(MovieListInitialState());

  @override
  Stream<MovieListState> mapEventToState(
    MovieListEvent event,
  ) async* {
    if (event is GetNowPlayingMovieListEvent) {
      yield MovieListLoadingState();
      try {
        final movies = await movieRepository.getNowPlayingMovies();
        final genres = await movieRepository.getGenres();
        yield MovieListLoadedState(genres, movies);
      } on Error catch (e) {
        yield MovieListErrorState(e);
      }
    } else if (event is GetTrendingMovieListEvent) {
      yield MovieListLoadingState();
      try {
        final movies = await movieRepository.getTrendingMovies();
        final genres = await movieRepository.getGenres();
        yield MovieListLoadedState(genres, movies);
      } on Error catch (e) {
        yield MovieListErrorState(e);
      }
    } else if (event is GetUpcomingMovieListEvent) {
      yield MovieListLoadingState();
      try {
        final movies = await movieRepository.getUpcomingMovies();
        final genres = await movieRepository.getGenres();
        yield MovieListLoadedState(genres, movies);
      } on Error catch (e) {
        yield MovieListErrorState(e);
      }
    } else if (event is GetMovieListByGenreEvent) {
      yield MovieListLoadingState();
      try {
        final movies = await movieRepository.getMoviesByGenre(
          event.genreId,
          appRepository.contentFilterEnabled,
        );
        final genres = await movieRepository.getGenres(event.genreId);
        yield MovieListLoadedState(genres, movies);
      } on Error catch (e) {
        yield MovieListErrorState(e);
      }
    }
  }
}
