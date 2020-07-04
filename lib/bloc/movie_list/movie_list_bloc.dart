import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_movie_app/data/movie_repository.dart';
import 'package:flutter_movie_app/models/errors.dart';
import 'package:flutter_movie_app/models/viewmodels/movie_list/movie_list_viewmodel.dart';
import 'package:flutter_movie_app/utils/mixins/auto_reset_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'movie_list_event.dart';
part 'movie_list_state.dart';

@lazySingleton
class MovieListBloc extends Bloc<MovieListEvent, MovieListState>
    with AutoResetLazySingleton<MovieListEvent, MovieListState> {
  final MovieRepository repository;

  MovieListBloc({this.repository});

  @override
  MovieListState get initialState => MovieListInitialState();

  @override
  Stream<MovieListState> mapEventToState(
    MovieListEvent event,
  ) async* {
    if (event is GetMovieListEvent) {
      yield MovieListLoadingState();
      try {
        final response = await repository.getNowPlayingMovies();
        final movies = MovieListViewModel.fromMovieResponse(response);
        yield MovieListLoadedState(movies);
      } on MovieListError catch (e) {
        yield MovieListErrorState(e);
      }
    }
  }
}
